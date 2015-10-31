package filtro

import cosasUsuario.Usuario
import java.util.Set
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
class FiltroPorExcesoDeCalorias implements Filtro {

	override Set<Receta> filtrar(Set<Receta> recetas, Usuario usuario) {
		if (usuario.tieneSobrepeso) {
			recetas.filter[receta|receta.tieneExcesoDeCalorias].toSet
		} else {
			recetas
		}
	}

}
