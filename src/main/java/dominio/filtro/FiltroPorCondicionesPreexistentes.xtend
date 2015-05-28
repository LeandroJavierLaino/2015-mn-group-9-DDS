package filtro

import cosasUsuario.Usuario
import java.util.Set
import receta.Receta

class FiltroPorCondicionesPreexistentes implements Filtro {
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.esRecomendablePara(usuario)].toSet
	}
		
}