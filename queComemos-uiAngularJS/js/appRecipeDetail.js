"use strict"

var recipeDetailApp = angular.module('recipeDetailApp', []);

recipeDetailApp.controller('recipeDetailCtrl', function(){

	var recipe = JSON.parse(sessionStorage.getItem('recetaAVer'));

	//var recipe = window.parent.receta;
	
	return recipe;
})