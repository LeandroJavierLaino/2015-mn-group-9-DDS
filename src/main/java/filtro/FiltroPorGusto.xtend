package filtro

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.annotation.JsonSerialize
import cosasUsuario.Usuario
import java.util.Set
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize
@PersistentClass
class FiltroPorGusto implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(usuario)].toSet
	}
	
}