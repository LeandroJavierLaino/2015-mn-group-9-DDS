package org.queComemos.uiArena

import repositorioUsuarios.RepositorioUsuarios
import cosasUsuario.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class MainWindowApplicationModel {
	
	String usuario
	String contrasenia
	QueComemosMainWindow owner
	String logro
	
	def init() {
		logro = ""
	}
	
	def login() {
		if(RepositorioUsuarios.instance.objects.exists[it.nombre == usuario] && contrasenia == "123") {
			
			logro = "Acceso Permitido"
			val window = new UserRecipesWindow(owner, new UserRecipesModel(getUser(usuario)))
			window.open
			
			owner.close
		}
		else logro = "Acceso Denegado"
	}
	def Usuario getUser(String usuario) {
		RepositorioUsuarios.instance.getUserByName(usuario)
	}

}