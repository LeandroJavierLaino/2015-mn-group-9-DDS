"use strict"

var recipeApp = angular.module('recipeApp', []);

recipeApp.controller('recipeCtrl', function(){

	//Este solo lo pude hacer Funcionar en Firefox y Opera
	//console.log(JSON.parse(localStorage.getItem('usuario'))); 
	//Usar la consola es malo.

	var user = JSON.parse(sessionStorage.getItem('usuario1'));

	//Metodo por Frame
	//var user = window.parent.usuario;

	user.verReceta = function() {
		sessionStorage.setItem('recetaAVer', JSON.stringify(user.recetaSeleccionada));
		window.parent.receta = user.recetaSeleccionada;
		window.open("detallereceta.html", "_self");
	} 
	
	return user;
	/*Esto funciona en EDGE pero requiere un frame (y en Opera tira error)*/

	
})