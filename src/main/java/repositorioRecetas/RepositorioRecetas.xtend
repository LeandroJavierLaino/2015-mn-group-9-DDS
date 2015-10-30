package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta
import uqbar.arena.persistence.PersistentHome
import uqbar.arena.persistence.annotations.Relation

@Observable
@Accessors
class RepositorioRecetas extends PersistentHome<Receta>{
	@Relation Collection<Receta> recetas = new ArrayList<Receta>
	@Relation static RepositorioRecetas instance = null
	@Relation AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas

	@Relation Collection<Receta> recetasTotales = new ArrayList<Receta>

	@Relation Collection<Receta> listarRecetasVisibles

	static def getInstance() {
		if (instance == null){
			instance = new RepositorioRecetas()
		}
		instance
	}

	def boolean tieneLaReceta(Receta receta) {
		(!recetas.nullOrEmpty) && recetas.contains(receta)
	}

	def cargarTodasLasRecetas() {
		recetas = (recetas + obtenerRecetasExternas()).toList
	}

	def agregar(Receta receta) {
		recetas.add(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		recetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
	}

	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}

	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}

	def buscarPorNombre(String nombreDeReceta) {
		recetas.findFirst[it.nombrePlato.equals(nombreDeReceta)]
	}

	def quitarPorNombre(String nombreDeReceta) {
		recetas = recetas.filter[!it.nombrePlato.equals(nombreDeReceta)].toList
	}
	
	override def createExample() {
		new Receta
	}
	
	override def getEntityType() {
		typeof(Receta)
	}
	
}
