package procesamientoPosterior;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@SuppressWarnings("all")
public class ProcesamientoOrdenarlosPorCalorias implements ProcesamientoPosterior {
  public Set<Receta> asociarProcesamiento(final Set<Receta> recetas) {
    Set<Receta> _xblockexpression = null;
    {
      List<Receta> recetasLista = new ArrayList<Receta>(recetas);
      final Function1<Receta, Double> _function = new Function1<Receta, Double>() {
        public Double apply(final Receta receta) {
          return Double.valueOf(receta.getCantidadMaximaCalorias());
        }
      };
      IterableExtensions.<Receta, Double>sortBy(recetasLista, _function);
      _xblockexpression = IterableExtensions.<Receta>toSet(recetasLista);
    }
    return _xblockexpression;
  }
}
