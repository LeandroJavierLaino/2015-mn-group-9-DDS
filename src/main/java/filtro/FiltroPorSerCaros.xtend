package filtro

import cosasUsuario.Usuario
import java.util.Set
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
class FiltroPorSerCaros implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.tieneIngredientesCaros].toSet
	}
	
}