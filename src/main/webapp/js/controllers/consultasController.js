indexApp.controller('consultasController', function(indexSrvc, $state, $stateParams){
	var self = this;
	this.recetas;

	this.obtenerConsulta = function() {
		self.recetas=indexSrvc.recetasRecibidas
	}
	
})