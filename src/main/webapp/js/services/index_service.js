"use strict"
indexApp.service('indexSrvc', function($http) {

	this.usuario;
	this.recetaSeleccionada;
	this.recetasRecibidas;

	this.getUsuario = function(usuario, callback) {
		$http.get('usuario/' + usuario.nombre, usuario.password).success(
				callback);
	}
	this.getRecetasDeUsuario = function(usuario, callback) {
		$http.get('usuario/' + usuario + '/recetas').success(callback);
	}
	this.buscarUsuarios = function(parteDelNombre, callback) {
		$http.get('usuarios/search/' + parteDelNombre).success(callback);
	}
	this.getReceta = function(nombre, callback) {
		$http.get('receta/' + nombre).success(callback);
	}
	this.guardarReceta = function(receta, callback, errorHandler) {
		$http.put('/receta/', receta).then(callback, errorHandler);
	}
//	this.recetas = function(callback) {
//		$http.get('/recetas').success(callback);
//	}
	this.realizarConsulta = function(consulta, callback) {
		$http.post('/consulta/recetas', consulta).success(callback);
	}
})