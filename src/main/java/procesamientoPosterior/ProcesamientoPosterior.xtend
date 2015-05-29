package procesamientoPosterior

import java.util.Set
import receta.Receta

interface ProcesamientoPosterior {
	def Set<Receta> asociarProcesamiento(Set<Receta> recetas)
}