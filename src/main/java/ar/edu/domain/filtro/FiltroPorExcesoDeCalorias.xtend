package ar.edu.domain.filtro

import ar.edu.domain.cosasUsuario.Usuario
import java.util.Set
import ar.edu.domain.receta.Receta

class FiltroPorExcesoDeCalorias implements Filtro {

	override Set<Receta> filtrar(Set<Receta> recetas, Usuario usuario) {
		if (usuario.tieneSobrepeso) {
			recetas.filter[receta|receta.tieneExcesoDeCalorias].toSet
		} else {
			recetas
		}
	}

}
