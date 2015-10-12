package ar.edu.domain.procesamientoPosterior

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import ar.edu.domain.receta.Receta

@Accessors
class ProcesamientoParaTomarLosPrimerosN implements ProcesamientoPosterior{
	int cantidadDeRecetasATraer  = 10
	
	override asociarProcesamiento(Set<Receta> recetas) {
		recetas.take(cantidadDeRecetasATraer).toSet
	}
	
}