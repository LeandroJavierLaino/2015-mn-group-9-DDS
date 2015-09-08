'use strict'

var recetaApp = angular.module('recetaApp', []);

function transformarAReceta(jsonReceta) {
	return angular.extend(new Receta(), jsonReceta);
}

recetaApp.controller('recetaCtrl', function(recetaSrvc) {

	var self = this;
	this.recetas = null;
	this.recetaSeleccionada = null;
	this.nombreABuscar = null;
	this.mostrarError = false;
	this.mostrarTabla = false;

	this.buscar = function(busqueda) {
		
		recetaSrvc.buscar(self.nombreABuscar, function(data) {
			self.recetaSeleccionada = JSON.parse(data);
		});
		
		if (self.recetaSeleccionada == null)
			this.mostrarError = true;
		else
			this.mostrarTabla = true;
		
	}
	this.buscarVarias = function() {
		recetaSrvc.buscarVarias(self.nombreABuscar, function(data) {
			self.tareas = _.map(data, transformarAReceta);
		});
	}

})