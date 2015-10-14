package filtro

import cosasUsuario.Usuario
import java.util.Set
import javax.persistence.Entity
import receta.Receta

@Entity
class FiltroPorCondicionesPreexistentes extends Filtro {
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.esRecomendablePara(usuario)].toSet
	}
		
}