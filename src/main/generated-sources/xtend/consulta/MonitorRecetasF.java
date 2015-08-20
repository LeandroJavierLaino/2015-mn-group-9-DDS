package consulta;

import com.google.common.base.Objects;
import consulta.Consulta;
import consulta.MonitorRecetas;
import cosasUsuario.Usuario;
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
public class MonitorRecetasF extends MonitorRecetas {
  private Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>();
  
  @Override
public void monitorear(final Consulta consulta) {
    boolean _and = false;
    Usuario _usuario = consulta.getUsuario();
    String _sexo = _usuario.getSexo();
    boolean _notEquals = (!Objects.equal(_sexo, null));
    if (!_notEquals) {
      _and = false;
    } else {
      Usuario _usuario_1 = consulta.getUsuario();
      String _sexo_1 = _usuario_1.getSexo();
      boolean _equalsIgnoreCase = _sexo_1.equalsIgnoreCase("F");
      _and = _equalsIgnoreCase;
    }
    if (_and) {
      Set<Receta> _recetas = consulta.getRecetas();
      final Consumer<Receta> _function = new Consumer<Receta>() {
        public void accept(final Receta receta) {
          boolean _containsKey = MonitorRecetasF.this.contadorDeRecetas.containsKey(receta);
          if (_containsKey) {
            Integer _get = MonitorRecetasF.this.contadorDeRecetas.get(receta);
            Integer _get_1 = MonitorRecetasF.this.contadorDeRecetas.get(receta);
            int _plus = ((_get_1).intValue() + 1);
            MonitorRecetasF.this.contadorDeRecetas.replace(receta, _get, Integer.valueOf(_plus));
          } else {
            MonitorRecetasF.this.contadorDeRecetas.put(receta, Integer.valueOf(1));
          }
        }
      };
      _recetas.forEach(_function);
    }
  }
  
  @Override
public String mostrarResultados() {
    final Function2<Receta, Integer, Boolean> _function = new Function2<Receta, Integer, Boolean>() {
      public Boolean apply(final Receta p1, final Integer p2) {
        Collection<Integer> _values = MonitorRecetasF.this.contadorDeRecetas.values();
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
