package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import queComemos.entrega3.repositorio.BusquedaRecetas

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	static RepositorioRecetas instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
		}
		instance
	}

	def tieneLaReceta(Receta receta) {
		(!recetas.nullOrEmpty) && recetas.contains(receta)
	}

	def listarRecetas() {
		recetas
	}
	
	def nuevasRecetas(BusquedaRecetas busquedaRecetas){
				recetas.map[receta|receta.convertir].join
	}

	def agregar(Receta receta) {
		recetas.add(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		listarRecetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
	}
	
}