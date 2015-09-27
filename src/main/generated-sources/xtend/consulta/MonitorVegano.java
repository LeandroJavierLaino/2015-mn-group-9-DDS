package consulta;

import consulta.Consulta;
import consulta.Monitor;
import cosasUsuario.Usuario;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import receta.Receta;

@SuppressWarnings("all")
public class MonitorVegano implements Monitor {
  private int contador = 0;
  
  public void monitorear(final Consulta consulta) {
    boolean _and = false;
    Usuario _usuario = consulta.getUsuario();
    Boolean _esVegano = _usuario.esVegano();
    if (!(_esVegano).booleanValue()) {
      _and = false;
    } else {
      Set<Receta> _recetas = consulta.getRecetas();
      final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta it) {
          return Boolean.valueOf(it.esDificil());
        }
      };
      boolean _exists = IterableExtensions.<Receta>exists(_recetas, _function);
      _and = _exists;
    }
    if (_and) {
      this.contador++;
    }
  }
  
  public String mostrarResultados() {
    return Integer.valueOf(this.contador).toString();
  }
}
