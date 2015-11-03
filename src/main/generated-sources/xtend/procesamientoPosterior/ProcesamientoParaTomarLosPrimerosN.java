package procesamientoPosterior;

import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@Accessors
@PersistentClass
@SuppressWarnings("all")
public class ProcesamientoParaTomarLosPrimerosN implements ProcesamientoPosterior {
  private int cantidadDeRecetasATraer = 10;
  
  public Set<Receta> asociarProcesamiento(final Set<Receta> recetas) {
    Iterable<Receta> _take = IterableExtensions.<Receta>take(recetas, this.cantidadDeRecetasATraer);
    return IterableExtensions.<Receta>toSet(_take);
  }
  
  @Pure
  public int getCantidadDeRecetasATraer() {
    return this.cantidadDeRecetasATraer;
  }
  
  public void setCantidadDeRecetasATraer(final int cantidadDeRecetasATraer) {
    this.cantidadDeRecetasATraer = cantidadDeRecetasATraer;
  }
}
