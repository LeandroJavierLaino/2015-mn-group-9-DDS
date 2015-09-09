recetaApp.service('recetaSrvc', function($http) {
	this.findAll = function(callback) {
		$http.get('/recetas').success(callback);
	}
	this.search = function(receta, callback) {
		$http.get('recetas/search', receta).success(callback);
	}
	this.buscarVarias = function(parteDelNombre, callback) {
		$http.get('recetas/search/' + parteDelNombre).success(
				callback);
	}
})

