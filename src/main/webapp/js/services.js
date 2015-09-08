logeoApp.service('logeoService', function($http) {
    this.findAll = function(callback) {
        $http.get('/usuarios').success(callback);
    }
    this.search = function
});

recetaApp.service('recetaSrvc', function($http) {
	this.findAll = function(callback) {
		$http.get('/recetas').success(callback);
	}
	this.search = function(receta, callback) {
		$http.get('recetas/search', receta).success(callback);
	}
	this.buscar = function(receta, callback) {
		$http.get('recetas/:' + receta, receta).success(callback);
	}
	this.buscarVarias = function(parteDelNombre, callback) {
		$http.get('recetas/varias:' + parteDelNombre, parteDelNombre).success(
				callback);
	}
})