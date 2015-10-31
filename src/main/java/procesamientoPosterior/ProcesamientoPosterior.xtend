package procesamientoPosterior

import java.util.Set
import org.uqbar.commons.utils.TransactionalAndObservable
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
@TransactionalAndObservable
interface ProcesamientoPosterior {
	def Set<Receta> asociarProcesamiento(Set<Receta> recetas)
}