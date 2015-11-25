"use strict"

indexApp.controller('buscadorDeUsuariosController', function(indexSrvc, $state, $stateParams) {
	var self = this;
	this.listadoDeUsuarios;
	
	this.listarUsuarios = function() {
		indexSrvc.buscarUsuarios($stateParams.nombre, function(data) {
			self.listadoDeUsuarios = _.map(data, transformarAUsuario);
		})
	}
})