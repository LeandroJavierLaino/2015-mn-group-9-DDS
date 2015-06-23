package procesamientoPosterior;

import java.util.Set;
import receta.Receta;

@SuppressWarnings("all")
public interface ProcesamientoPosterior {
  public abstract Set<Receta> asociarProcesamiento(final Set<Receta> recetas);
}
