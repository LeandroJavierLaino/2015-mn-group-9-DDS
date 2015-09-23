recetaApp.service('recetaSrvc', function($http) {
	this.findAll = function(callback) {
		$http.get('/recetas').success(callback);
	}
	this.search = function(receta, callback) {
		$http.get('recetas/search', receta).success(callback);
	}
	this.buscarVarias = function(parteDelNombre, callback) {
		$http.get('recetas/search/' + parteDelNombre).success(callback);
	}
	this.buscarConFiltros = function(nombre, calMin, calMax, dif, temp, ingred, callback) {
		$http.get('/recetas/search?' + nombre + '&' + calMin + '&' + calMax + '&' + dif + '&' + temp + '&' + ingred).success(callback);
	}
})
usuariosApp.service('usuariosSrvc', function($http) {
	this.buscar = function(parteDelNombre, callback) {
		$http.get('usuarios/search/' + parteDelNombre).success(callback);
	}
})
recipeApp.service('recipeSrvc', function($http) {
	this.listarRecetas = function(nombre, callback) {
		$http.get('recetas').success(callback);
	}
})
logeoApp.service('logeoSrvc', function($http) {
	this.getUsuario = function(nombre, callback) {
		$http.get('usuarios/' + nombre).success(callback);
	}
})
recipeDetailApp.service('recipeDetailSrvc', function($http) {
	this.guardarReceta = function(receta, callback) {
		$http.put('recetas/' + receta.nombrePlato, jsonify(receta)).success(callback)
	}
	this.cambiarFavorito = function(receta, usuario, callback) {
		$http.put('usuario/' + usuario + '/favoritos', jsonify(receta)).success(callback)
	}
	
})