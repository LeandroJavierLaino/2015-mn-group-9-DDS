package filtro

import java.util.Set
import receta.Receta
import cosasUsuario.Usuario

class FiltroPorSerCaros implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.tieneIngredientesCaros].toSet
		
	}
	
}