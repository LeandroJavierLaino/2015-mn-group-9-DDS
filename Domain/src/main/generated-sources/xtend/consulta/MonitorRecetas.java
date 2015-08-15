package consulta;

import consulta.Consulta;
import consulta.Monitor;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.MapExtensions;
import receta.Receta;

@SuppressWarnings("all")
public class MonitorRecetas implements Monitor {
  private Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>();
  
  public void monitorear(final Consulta consulta) {
    Set<Receta> _recetas = consulta.getRecetas();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta receta) {
        boolean _containsKey = MonitorRecetas.this.contadorDeRecetas.containsKey(receta);
        if (_containsKey) {
          Integer _get = MonitorRecetas.this.contadorDeRecetas.get(receta);
          Integer _get_1 = MonitorRecetas.this.contadorDeRecetas.get(receta);
          int _plus = ((_get_1).intValue() + 1);
          MonitorRecetas.this.contadorDeRecetas.replace(receta, _get, Integer.valueOf(_plus));
        } else {
          MonitorRecetas.this.contadorDeRecetas.put(receta, Integer.valueOf(1));
        }
      }
    };
    _recetas.forEach(_function);
  }
  
  public String mostrarResultados() {
    final Function2<Receta, Integer, Boolean> _function = new Function2<Receta, Integer, Boolean>() {
      public Boolean apply(final Receta p1, final Integer p2) {
        Collection<Integer> _values = MonitorRecetas.this.contadorDeRecetas.values();
        Integer _max = IterableExtensions.<Integer>max(_values);
        return Boolean.valueOf(p2.equals(_max));
      }
    };
    Map<Receta, Integer> _filter = MapExtensions.<Receta, Integer>filter(this.contadorDeRecetas, _function);
    Set<Receta> _keySet = _filter.keySet();
    Receta _head = IterableExtensions.<Receta>head(_keySet);
    return _head.getNombrePlato();
  }
}
