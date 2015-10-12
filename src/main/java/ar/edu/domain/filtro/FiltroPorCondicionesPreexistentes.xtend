package ar.edu.domain.filtro

import ar.edu.domain.cosasUsuario.Usuario
import java.util.Set
import ar.edu.domain.receta.Receta

class FiltroPorCondicionesPreexistentes implements Filtro {
	
	override filtrar(Set<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|receta.esRecomendablePara(usuario)].toSet
	}
		
}