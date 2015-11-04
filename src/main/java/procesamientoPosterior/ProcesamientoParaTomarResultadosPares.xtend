package procesamientoPosterior

import java.util.ArrayList
import java.util.List
import java.util.Set
import org.uqbar.commons.model.Entity
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
class ProcesamientoParaTomarResultadosPares extends Entity implements ProcesamientoPosterior {
	
	override asociarProcesamiento(Set<Receta> recetas) {
		var List<Receta> listaFiltrada = new ArrayList<Receta>
		var List<Receta> listaRecetas = new ArrayList<Receta>(recetas)
		var boolean esPar = true
		for(receta : listaRecetas){
			if(esPar) listaFiltrada.add(receta)
			esPar = !esPar
		}
		listaFiltrada.toSet
	}
	
}