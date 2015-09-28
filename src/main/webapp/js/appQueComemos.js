"use strict"
var indexApp = angular.module('indexApp', [ 'ui.router' ])

indexApp.config(function($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.otherwise("/");

	$stateProvider
	.state('inicio', {
		url : "/",
		templateUrl : "partials/inicio.html",
		controller : "indexCtrl as user"
	})
	.state('listarRecetas', {
		url : "/:nombre",
		templateUrl : "partials/listadoRecetas.html",
		controller : "listadoDeRecetasController as buscador"
	})
	.state('verReceta', {
		url : "/receta/:nombre",
		templateUrl : "partials/detallesDeLaReceta.html",
		controller : "recetaController as receta"
	})
	.state('buscarUsuarios', {
		url : "/search/:nombre",
		templateUrl : "partials/listadoUsuarios.html",
		controller : "buscadorDeUsuariosController as buscador"
	})
	.state('realizarConsulta', {
		url : "/",
		templateUrl : "partials/listadoRecetas.html",
		controller : "consultasController as buscador"
	})
});
