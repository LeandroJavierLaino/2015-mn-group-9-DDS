indexApp.controller('consultasController', function(indexSrvc, $state, $stateParams){
	var self = this;
	this.recetas;

	this.listarRecetas = function() {
		
		console.log($state)
		
		indexSrvc.realizarConsulta(function(data) {
			self.recetas = _.map(data, transformarAReceta);
		});
	}
	this.abrirReceta = function(receta) {
		indexSrvc.recetaSeleccionada = receta;
		$state.go('verReceta', {"nombre": receta.nombrePlato})
	}
})