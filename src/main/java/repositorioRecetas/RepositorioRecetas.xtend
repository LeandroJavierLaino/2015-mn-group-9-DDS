package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta
import uqbar.arena.persistence.PersistentHome

@Observable
@Accessors
class RepositorioRecetas extends PersistentHome<Receta>{
	Collection<Receta> recetas = new ArrayList<Receta>
	
	AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas

	Collection<Receta> recetasTotales = new ArrayList<Receta>

	Collection<Receta> listarRecetasVisibles
	
	override def createExample() {
		new Receta
	}
	
	override def getEntityType() {
		typeof(Receta)
	}

	/**
	 * *********************************************
	 *           DEFINICION DEL SINGLETON
	 * *********************************************
	 */
	 
	static RepositorioRecetas instance = null
	
	static def getInstance() {
		if (instance == null){
			instance = new RepositorioRecetas()
		}
		instance
	}


	
	
	/**
	 * *********************************************
	 *                     ALTA 
	 * *********************************************
	 */
	 
	def createIfNotExist(Receta receta) {
		var recetaDB = get(receta.nombrePlato)
		if(recetaDB == null) {
			create(receta)
			recetaDB = receta
		} else {
		}
		recetaDB
	}
	
	def agregar(Receta receta) {
		recetas.add(receta)
		create(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
		delete(receta)
	}
	/**
	 * *********************************************
	 *                    BUSQUEDA
	 * *********************************************
	 */
	
	def Receta get(String unNombre) {
		val Receta receta = new Receta => [ nombrePlato = unNombre]
		
		val recetas = searchByExample(receta)
		if(recetas.isEmpty) {
			null
		} else {
			recetas.get(0)
		}
	}
	def buscarPorNombre(String nombreDeReceta) {
		//recetas.findFirst[it.nombrePlato.equals(nombreDeReceta)]
		allInstances.findFirst[it.nombrePlato.equals(nombreDeReceta)]
	}
	
	
	def boolean tieneLaReceta(Receta receta) {
		//(!recetas.nullOrEmpty) && recetas.contains(receta)
		!allInstances.nullOrEmpty && allInstances.contains(receta)
	}

	def cargarTodasLasRecetas() {
		//recetas = (recetas + obtenerRecetasExternas()).toList
		obtenerRecetasExternas.forEach[createIfNotExist(it)]
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		//recetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
		allInstances.filter[unaReceta | unaReceta.puedeVerReceta(usuario)].toSet
	}

	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}

	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}

	

	def quitarPorNombre(String nombreDeReceta) {
		recetas = recetas.filter[!it.nombrePlato.equals(nombreDeReceta)].toList
	}
	

	
}
