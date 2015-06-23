package receta;

import org.eclipse.xtend.lib.annotations.Accessors;
import receta.Caracteristica;

@Accessors
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
  
  public Condimento(final String cNombre, final double cCantidad, final String cTipo) {
    super(cNombre, cCantidad, cTipo);
  }
}
