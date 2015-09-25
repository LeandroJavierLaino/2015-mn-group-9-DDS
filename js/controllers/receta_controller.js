"use strict"
indexApp.controller('recetaController', function(indexSrvc, $state, $stateParams) {
	
	var self = this;
	this.receta;
	this.nuevoPaso;
	this.ingrediente;
	this.condimento;
	this.mostrarDivNuevoIngrediente = false;
	this.mostrarDivNuevoCondimento = false;
	
	
	this.cargarReceta = function() {
		indexSrvc.getReceta($stateParams.nombre, function(data) {
			self.receta = transformarAReceta(data);
		})
	}
	this.agregarPaso = function() {
		self.receta.procesoPreparacion.push(self.nuevoPaso);
	}
	
	this.agregarIngrediente = function() {
		self.receta.ingredientes.push(self.ingrediente);
		self.ingrediente = new Ingrediente;
	}
	this.agregarCondimento = function() {
		self.receta.condimentos.push(self.condimento);
		self.nuevoCondimento();
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
	
	this.guardarReceta = function() {
		var receta = self.receta
		console.log(receta)
		indexSrvc.guardarReceta(receta, function(data) {
			console.log(data.nombrePlato);
		})
	}
})