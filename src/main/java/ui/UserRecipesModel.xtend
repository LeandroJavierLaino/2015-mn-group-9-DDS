package ui

import cosasUsuario.Usuario
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import receta.Receta
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
		val window = new RecipeDetailWindow(owner, new RecipeModel(seleccionada))
		window.open
	}
}