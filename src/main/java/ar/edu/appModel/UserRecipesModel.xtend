package ar.edu.appModel

import ar.edu.domain.cosasUsuario.Usuario
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.domain.receta.Receta
import org.uqbar.arena.windows.WindowOwner

@Accessors
@Observable
class UserRecipesModel {
	Usuario user
	String nombre
	List<Receta> resultados
	Receta seleccionada
	WindowOwner owner
	
	new(Usuario usuario) {
		user = usuario
	}
	def inspeccionarUsuario() {
		nombre = user.nombre
		resultados = user.recetas.toList
	}
	def verReceta() {
		val window = new ar.edu.queComemos.uiArena.RecipeDetailWindow(owner, new ar.edu.appModel.RecipeModel(seleccionada, user))
		window.open
	}
}