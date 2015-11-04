package procesamientoPosterior

import com.fasterxml.jackson.databind.annotation.JsonSerialize
import java.util.ArrayList
import java.util.List
import java.util.Set
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@JsonSerialize
@PersistentClass
@TransactionalAndObservable
class ProcesamientoOrdenarlosPorNombre extends Entity implements ProcesamientoPosterior {
	
	override asociarProcesamiento(Set<Receta> recetas) {
		var List<Receta> recetasLista = new ArrayList<Receta>(recetas)
		recetasLista.sortBy[receta|receta.nombrePlato]
		recetasLista.toSet
	}
	 
}