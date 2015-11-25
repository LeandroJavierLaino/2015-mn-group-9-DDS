"use strict"
indexApp.controller('listadoDeRecetasController', function(indexSrvc, $state, $stateParams) {
	
	var self = this;
	this.recetas;
	
	this.listarRecetas = function() {
		
		var nombre = $stateParams.nombre;

		indexSrvc.getRecetasDeUsuario(nombre, function(data) {
			self.recetas = _.map(data, transformarAReceta);
		});
	}
	this.abrirReceta = function(receta) {
		indexSrvc.recetaSeleccionada = receta;
		$state.go('verReceta', {"nombre": receta.nombrePlato})
	}
})