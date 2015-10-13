indexApp.controller('indexCtrl', function(indexSrvc, $state, $stateParams) {

	var self = this;
	this.usuario = new Usuario;
	this.logeo = new Logeo(indexSrvc);
	this.recetas;
	this.aBuscar;
	this.listadoDeUsuarios;
	this.consulta = new Consulta;
	this.resultadoDeLaConsulta;
	this.dificultades = [ "FACIL", "MEDIANA", "DIFICIL" ];
	this.temporadas = [ "VERANO", "OTOÑO", "INVIERNO", "PRIMAVERA",
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

		// self.consulta.ingredientes.push(self.consulta.ingrediente);
		// self.consulta.ingrediente = null;
		//
		console.log(self.usuario.nombre);
		console.log(self.consulta);
		console.log(jsonify(self.consulta));

		indexSrvc.recetas(function(data) {
			indexSrvc.recetasRecibidas = _.map(data, transformarAReceta);
			$state.go('realizarConsulta');
		});

	}
})