indexApp.controller('indexCtrl', function(indexSrvc, $state, $stateParams) {

	var self = this;
	this.usuario = new Usuario;
	this.logeo = new Logeo(indexSrvc);
	this.recetas;
	this.aBuscar;
	this.listadoDeUsuarios;
	this.consulta = new Consulta;
	this.resultadoDeLaConsulta;
	this.dificultades = [ "" ,"FACIL", "MEDIANA", "DIFICIL" ];
	this.temporadas = [ "","VERANO", "OTOÑO", "INVIERNO", "PRIMAVERA",
			"todoElAnio" ];

	this.acceder = function() {
		this.logeo.acceder(self.usuario, $state, $stateParams);
	}

	this.buscarUsuarios = function() {
		$state.go('buscarUsuarios', {
			"nombre" : self.aBuscar
		});
	}
	this.realizarConsulta = function() {
		indexSrvc.consulta = self.consulta;
		
		if($state.includes('realizarConsulta')) {
			$state.go($state.current, {}, {reload: true});
		}
		else $state.go('realizarConsulta');
	}

//	this.realizarConsulta = function() {
//
//		console.log(self.consulta);
//		indexSrvc.realizarConsulta(self.usuario.nombre, self.consulta, function(data) {
//			indexSrvc.recetasRecibidas = _.map(data, transformarAReceta);
//			if($state.includes('realizarConsulta')) {
//				$state.go($state.current, {}, {reload: true});
//			}
//			else $state.go('realizarConsulta');
//		});
//
//	}

})