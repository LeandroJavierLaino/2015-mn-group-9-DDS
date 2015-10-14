package filtro

import cosasUsuario.Usuario
import java.util.Set
import javax.persistence.Entity
import receta.Receta

@Entity
class FiltroPorExcesoDeCalorias extends Filtro {

	override Set<Receta> filtrar(Set<Receta> recetas, Usuario usuario) {
		if (usuario.tieneSobrepeso) {
			recetas.filter[receta|receta.tieneExcesoDeCalorias].toSet
		} else {
			recetas
		}
	}

}
