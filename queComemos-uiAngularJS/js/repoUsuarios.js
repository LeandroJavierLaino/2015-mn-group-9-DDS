"use strict"
function RepositorioDeUsuarios() {

	self = this;
	this.usuarios = [];

	if(!(this instanceof RepositorioDeUsuarios)) {
			return new RepositorioDeUsuarios();
	}
	this.agregarUsuario = function(usuario) {
		self.usuarios[self.usuarios.length] = usuario;
	}
	this.buscarUsuario = function(user) {
		var i = 0
		while(self.usuarios[i]) {
			if(user == self.usuarios[i].nombre) {
				break;
			}
			i++;
		}
		return self.usuarios[i];
	}
}


var repo = new RepositorioDeUsuarios();
repo.agregarUsuario(pepe);