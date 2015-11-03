package procesamientoPosterior;

import java.util.Set;
import org.uqbar.commons.utils.TransactionalAndObservable;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@TransactionalAndObservable
@SuppressWarnings("all")
public interface ProcesamientoPosterior {
  public abstract Set<Receta> asociarProcesamiento(final Set<Receta> recetas);
}
