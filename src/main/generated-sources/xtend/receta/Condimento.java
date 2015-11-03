package receta;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.uqbar.commons.utils.TransactionalAndObservable;
import receta.Caracteristica;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@TransactionalAndObservable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@SuppressWarnings("all")
public class Condimento extends Caracteristica {
  public boolean esParteDe(final String unCondimento, final int unaCantidad) {
    boolean _and = false;
    double _cantidad = this.getCantidad();
    boolean _greaterEqualsThan = (_cantidad >= unaCantidad);
    if (!_greaterEqualsThan) {
      _and = false;
    } else {
      String _nombre = this.getNombre();
      boolean _equalsIgnoreCase = _nombre.equalsIgnoreCase(unCondimento);
      _and = _equalsIgnoreCase;
    }
    return _and;
  }
  
  public String toString() {
    return this.getNombre();
  }
}
