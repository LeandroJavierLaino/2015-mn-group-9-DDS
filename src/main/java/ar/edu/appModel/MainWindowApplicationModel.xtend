package ar.edu.appModel

import ar.edu.domain.repositorioUsuarios.RepositorioUsuarios
import ar.edu.domain.cosasUsuario.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class MainWindowApplicationModel {
	
	String usuario
	String contrasenia
	ar.edu.queComemos.uiArena.QueComemosMainWindow owner
	String logro
	
	def init() {
		logro = ""
	}
	
	def login() {
		if(RepositorioUsuarios.instance.objects.exists[it.nombre == usuario] && contrasenia == "123") {
			
			logro = "Acceso Permitido"
			val window = new ar.edu.queComemos.uiArena.UserRecipesWindow(owner, new ar.edu.appModel.UserRecipesModel(getUser(usuario)))
			window.open
			
			owner.close
		}
		else logro = "Acceso Denegado"
	}
	def Usuario getUser(String usuario) {
		RepositorioUsuarios.instance.getUserByName(usuario)
	}

}