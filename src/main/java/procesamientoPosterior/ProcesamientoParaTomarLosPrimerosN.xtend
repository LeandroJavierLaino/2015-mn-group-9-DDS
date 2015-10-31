package procesamientoPosterior

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@Accessors
@PersistentClass
class ProcesamientoParaTomarLosPrimerosN implements ProcesamientoPosterior{
	int cantidadDeRecetasATraer  = 10
	
	override asociarProcesamiento(Set<Receta> recetas) {
		recetas.take(cantidadDeRecetasATraer).toSet
	}
	
}