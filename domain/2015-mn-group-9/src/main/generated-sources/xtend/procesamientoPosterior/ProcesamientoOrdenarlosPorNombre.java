package procesamientoPosterior;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Receta;

@SuppressWarnings("all")
public class ProcesamientoOrdenarlosPorNombre implements ProcesamientoPosterior {
  public Set<Receta> asociarProcesamiento(final Set<Receta> recetas) {
    Set<Receta> _xblockexpression = null;
    {
      List<Receta> recetasLista = new ArrayList<Receta>(recetas);
      final Function1<Receta, String> _function = new Function1<Receta, String>() {
        public String apply(final Receta receta) {
          return receta.getNombrePlato();
        }
      };
      IterableExtensions.<Receta, String>sortBy(recetasLista, _function);
      _xblockexpression = IterableExtensions.<Receta>toSet(recetasLista);
    }
    return _xblockexpression;
  }
}
