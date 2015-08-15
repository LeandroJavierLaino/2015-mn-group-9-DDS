package receta;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import receta.Caracteristica;

@Accessors
@SuppressWarnings("all")
public class Ingrediente extends Caracteristica {
  public static List<Ingrediente> ingredientesCaros = new ArrayList<Ingrediente>();
  
  public boolean esParteDe(final String unIngrediente, final int unaCantidad) {
    boolean _and = false;
    double _cantidad = this.getCantidad();
    boolean _greaterEqualsThan = (_cantidad >= unaCantidad);
    if (!_greaterEqualsThan) {
      _and = false;
    } else {
      String _nombre = this.getNombre();
      boolean _equalsIgnoreCase = _nombre.equalsIgnoreCase(unIngrediente);
      _and = _equalsIgnoreCase;
    }
    return _and;
  }
  
  public boolean esCaro() {
    return Ingrediente.ingredientesCaros.contains(this);
  }
  
  public Ingrediente(final String cNombre, final double cCantidad, final String cTipo) {
    super(cNombre, cCantidad, cTipo);
  }
}
