"use strict"
indexApp
		.controller(
				'recetaController',
				function(indexSrvc, $state, $stateParams) {

					var self = this;
					this.receta;
					this.textoNuevoPaso;
					this.ingrediente = new Ingrediente;
					this.condimento = new Condimento;
					this.mostrarDivNuevoIngrediente = false;
					this.mostrarDivNuevoCondimento = false;
					this.usuario = null;
					//this.puedeEditar = false;
					this.errores = [];
					this.message = [];

					function notificarError(message) {
						console.log(message)
						self.errores.push(message.data);
					}

					this.cargarReceta = function() {
						self.receta = indexSrvc.recetaSeleccionada;
						self.usuario = indexSrvc.usuario;
						self.puedeEditar = (self.usuario != null && self.receta.creador == self.usuario.nombre);
					}
					this.agregarPaso = function() {
						if (self.textoNuevoPaso != null) {
							
							var nuevoPaso = new Palabras();
							nuevoPaso.palabras = self.textoNuevoPaso;
							
							self.receta.procesoPreparacion.push(nuevoPaso);
							
							self.textoNuevoPaso = null;
							console.log(self.receta.procesoPreparacion)
						} else {
							return alert('Debe ingresar un paso');
						}
					}

					this.agregarIngrediente = function() {
						if (self.ingrediente != null) {
							self.receta.ingredientes.push(self.ingrediente);
							console.log(self.ingrediente)
							self.ingrediente = new Ingrediente();
						} else {
							return alert('Debe ingresar un ingrediente');
						}
					}
					this.agregarCondimento = function() {
						if (self.condimento != null) {
							self.receta.condimentos.push(self.condimento);
							self.condimento = new Condimento();
						} else {
							return alert('Debe ingresar un condimento');
						}
					}
					this.borrarPaso = function(paso) {
						var index = self.receta.procesoPreparacion
								.indexOf(paso);
						self.receta.procesoPreparacion.splice(index, 1);
					}
					this.borrarIngrediente = function(ingrediente) {
						var index = self.receta.ingredientes
								.indexOf(ingrediente);
						self.receta.ingredientes.splice(index, 1);
					}
					this.borrarCondimento = function(condimento) {
						var index = self.receta.condimentos.indexOf(condimento);
						self.receta.condimentos.splice(index, 1);
					}
					this.puedeEditar = function() {
						(self.receta.creador == self.usuario.nombre) || contains(self.receta, self.usuario.recetas)
					}

					this.guardarReceta = function() {

						indexSrvc.guardarReceta(self.receta, function(data) {
							
							console.log(data);
							self.message = [];
							self.message.push("Los cambios se han guardado con exito");
							self.errores = [];
							
						}, notificarError);
						self.message = [];
						self.errores = [];
					}
					this.volver = function() {
						$state.go('listarRecetas', {"nombre" : self.usuario.nombre});
					}
				})