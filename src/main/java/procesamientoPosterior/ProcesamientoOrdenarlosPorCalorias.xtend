package procesamientoPosterior

import java.util.ArrayList
import java.util.List
import java.util.Set
import receta.Receta
import javax.persistence.Entity

@Entity
class ProcesamientoOrdenarlosPorCalorias extends ProcesamientoPosterior{
	
	override asociarProcesamiento(Set<Receta> recetas){
		var List<Receta> recetasLista = new ArrayList<Receta>(recetas)
		recetasLista.sortBy[receta|receta.cantidadMaximaCalorias]
		recetasLista.toSet
	}
}