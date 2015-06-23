package procesamientoPosterior;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Receta;

@SuppressWarnings("all")
public class ProcesamientoParaTomarResultadosPares implements ProcesamientoPosterior {
  public Set<Receta> asociarProcesamiento(final Set<Receta> recetas) {
    Set<Receta> _xblockexpression = null;
    {
      List<Receta> listaFiltrada = new ArrayList<Receta>();
      List<Receta> listaRecetas = new ArrayList<Receta>(recetas);
      boolean esPar = true;
      for (final Receta receta : listaRecetas) {
        {
          if (esPar) {
            listaFiltrada.add(receta);
          }
          esPar = (!esPar);
        }
      }
      _xblockexpression = IterableExtensions.<Receta>toSet(listaFiltrada);
    }
    return _xblockexpression;
  }
}
