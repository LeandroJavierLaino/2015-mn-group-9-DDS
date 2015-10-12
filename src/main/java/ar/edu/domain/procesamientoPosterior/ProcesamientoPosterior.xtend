package ar.edu.domain.procesamientoPosterior

import java.util.Set
import ar.edu.domain.receta.Receta

interface ProcesamientoPosterior {
	def Set<Receta> asociarProcesamiento(Set<Receta> recetas)
}