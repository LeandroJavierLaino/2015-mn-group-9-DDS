"use strict"

function Logeo(indexSrvc) {

	var self = this
	this.exito = null;
	this.usuarioCompleto = new Usuario;
	this.recetas;

	this.acceder = function(usuario, $state, $stateParams) {	

		indexSrvc.getUsuario(usuario, function(data) {

			self.usuarioCompleto = transformarAUsuario(data);
			self.exito = true;
			indexSrvc.usuario = self.usuarioCompleto;
			
			$state.go('listarRecetas', {"nombre" : self.usuarioCompleto.nombre});

		})
	}
	
}