package procesamientoPosterior

import java.util.ArrayList
import java.util.List
import java.util.Set
import org.uqbar.commons.model.Entity
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
class ProcesamientoOrdenarlosPorCalorias extends Entity implements ProcesamientoPosterior{
	
	override asociarProcesamiento(Set<Receta> recetas){
		var List<Receta> recetasLista = new ArrayList<Receta>(recetas)
		recetasLista.sortBy[receta|receta.cantidadMaximaCalorias]
		recetasLista.toSet
	}
}