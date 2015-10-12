package ar.edu.domain.filtro

import java.util.Set
import ar.edu.domain.receta.Receta
import ar.edu.domain.cosasUsuario.Usuario

class FiltroPorSerCaros implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.tieneIngredientesCaros].toSet
	}
	
}