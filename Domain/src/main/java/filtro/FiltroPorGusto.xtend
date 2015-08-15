package filtro

import cosasUsuario.Usuario
import java.util.Set
import receta.Receta

class FiltroPorGusto implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(usuario)].toSet
	}
	
}