"use strict"
indexApp.service('indexSrvc', function($http) {
	
	this.usuario;
	this.recetaSeleccionada;
	
	this.getUsuario = function(usuario, callback) {
		$http.get('usuario/' + usuario.nombre, usuario.password).success(callback);
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
	this.guardarReceta = function(receta, callback) {	
		$http.put('/receta/', receta).success(callback);
	}
	this.realizarConsulta = function(consulta, callback) {
		$http.get('/receta/consulta', consulta).success(callback);
	}
})