package procesamientoPosterior

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import receta.Receta
import javax.persistence.Entity

@Accessors
@Entity
class ProcesamientoParaTomarLosPrimerosN extends ProcesamientoPosterior{
	int cantidadDeRecetasATraer  = 10
	
	override asociarProcesamiento(Set<Receta> recetas) {
		recetas.take(cantidadDeRecetasATraer).toSet
	}
	
}