package filtro

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.annotation.JsonSerialize
import cosasUsuario.Usuario
import java.util.Set
import javax.persistence.Entity
import receta.Receta

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize
@Entity
class FiltroPorGusto extends Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(usuario)].toSet
	}
	
}