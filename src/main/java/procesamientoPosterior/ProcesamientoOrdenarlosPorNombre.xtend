package procesamientoPosterior

import java.util.Set
import receta.Receta
import java.util.List
import java.util.ArrayList
import com.fasterxml.jackson.databind.annotation.JsonSerialize

@JsonSerialize
class ProcesamientoOrdenarlosPorNombre implements ProcesamientoPosterior {
	
	override asociarProcesamiento(Set<Receta> recetas) {
		var List<Receta> recetasLista = new ArrayList<Receta>(recetas)
		recetasLista.sortBy[receta|receta.nombrePlato]
		recetasLista.toSet
	}
	
}