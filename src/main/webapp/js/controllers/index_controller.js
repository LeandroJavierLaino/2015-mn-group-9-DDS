indexApp.controller('indexCtrl', function(indexSrvc, $state, $stateParams) {
	
	var self = this;
	this.usuario = new Usuario;
	this.logeo = new Logeo(indexSrvc);
	this.recetas;
	this.aBuscar;
	this.listadoDeUsuarios;
	this.consulta = new Consulta;
	this.resultadoDeLaConsulta;
	this.dificultades = ["baja","media","alta"];
	this.temporadas = ["verano","otonio","invierno","primavera","todoElAnio"];
	
	this.acceder = function() {
		this.logeo.acceder(self.usuario, $state, $stateParams);
	}
	
	this.buscarUsuarios = function() {
		$state.go('buscarUsuarios', {"nombre" : self.aBuscar});
	}
	
	this.realizarConsulta = function() {
		indexSrvc.realizarConsulta(self.consulta, function(data) {
			self.resultadoDeLaConsulta = _.map(data, transformarAReceta);
		})
	}
})