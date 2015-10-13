indexApp.controller('consultasController', function(indexSrvc, $state, $stateParams){
	var self = this;
	this.recetas;

	this.listarRecetas = function() {
		self.recetas = indexSrvc.recetasRecibidas;
	}
	
})