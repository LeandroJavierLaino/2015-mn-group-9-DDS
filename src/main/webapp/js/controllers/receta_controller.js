"use strict"
indexApp.controller('recetaController', function(indexSrvc, $state, $stateParams) {
	
	var self = this;
	this.receta;
	this.nuevoPaso;
	this.ingrediente = new Ingrediente;
	this.condimento = new Condimento;
	this.mostrarDivNuevoIngrediente = false;
	this.mostrarDivNuevoCondimento = false;
	this.usuario = null;
	this.puedeEditar = false;
	
	this.cargarReceta = function() {
		self.receta = indexSrvc.recetaSeleccionada;
		self.usuario = indexSrvc.usuario;
		self.puedeEditar = (self.usuario != null && self.receta.creador == self.usuario.nombre);
	}
	this.agregarPaso = function() {
		self.receta.procesoPreparacion.push(self.nuevoPaso);
	}
	
	this.agregarIngrediente = function() {
		self.receta.ingredientes.push(self.ingrediente);
		console.log(self.ingrediente)
		self.ingrediente = new Ingrediente();
	}
	this.agregarCondimento = function() {
		self.receta.condimentos.push(self.condimento);
		self.condimento = new Condimento();
	}
	this.borrarPaso = function(paso) {
		var index = self.receta.procesoPreparacion.indexOf(paso);
		self.receta.procesoPreparacion.splice(index, 1);
	}
	this.borrarIngrediente = function(ingrediente) {
		var index = self.receta.ingredientes.indexOf(ingrediente);
		self.receta.ingredientes.splice(index, 1);
	}
	this.borrarCondimento = function(condimento) {
		var index = self.receta.condimentos.indexOf(condimento);
		self.receta.condimentos.splice(index, 1);
	}
	this.puedeEditar = function() {
		
	}
	
	this.guardarReceta = function() {

		indexSrvc.guardarReceta(self.receta, function(data) {
			console.log(data);
		})
	}
})