indexApp.controller('consultasController', function(indexSrvc, $state, $stateParams){
	var self = this;
	this.recetas;

	this.listarRecetas = function() {
//		self.recetas = indexSrvc.recetasRecibidas;
		indexSrvc.realizarConsulta(indexSrvc.usuario.nombre, indexSrvc.consulta, function(data) {
			self.recetas = _.map(data, transformarAReceta);
		});
	}
	this.abrirReceta = function(receta) {
		indexSrvc.recetaSeleccionada = receta;
		$state.go('verReceta', {"nombre": receta.nombrePlato})
	}
})