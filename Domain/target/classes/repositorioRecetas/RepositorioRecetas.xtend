package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	static RepositorioRecetas instance = null
	AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas
	
	Collection<Receta> recetasTotales = new ArrayList<Receta>
	
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
		recetas + obtenerRecetasExternas()
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
	
	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}
	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}
	
}