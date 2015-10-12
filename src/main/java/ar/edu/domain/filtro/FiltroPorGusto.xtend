package ar.edu.domain.filtro

import ar.edu.domain.cosasUsuario.Usuario
import java.util.Set
import ar.edu.domain.receta.Receta
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.annotation.JsonSerialize

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize
class FiltroPorGusto implements Filtro{
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(usuario)].toSet
	}
	
}