package condicion;

import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import excepcion.CondPreexistenteExcepcion;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import receta.Receta;
import rutina.Rutina;

@SuppressWarnings("all")
public class CondicionHipertenso implements CondicionPreexistente {
  public boolean valido(final Usuario unUsuario) {
    try {
      boolean _xblockexpression = false;
      {
        List<String> _comidaPreferida = unUsuario.getComidaPreferida();
        boolean _isNullOrEmpty = IterableExtensions.isNullOrEmpty(_comidaPreferida);
        if (_isNullOrEmpty) {
          throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia");
        }
        List<String> _comidaPreferida_1 = unUsuario.getComidaPreferida();
        int _length = ((Object[])Conversions.unwrapArray(_comidaPreferida_1, Object.class)).length;
        _xblockexpression = (_length > 0);
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean tieneRutinaSaludable(final Usuario unUsuario) {
    Rutina _rutina = unUsuario.getRutina();
    return _rutina.activaIntensa();
  }
  
  public boolean tolera(final Receta unaReceta) {
    boolean _and = false;
    boolean _contieneComida = unaReceta.contieneComida("Sal", 0);
    boolean _not = (!_contieneComida);
    if (!_not) {
      _and = false;
    } else {
      boolean _contieneComida_1 = unaReceta.contieneComida("Caldo", 0);
      boolean _not_1 = (!_contieneComida_1);
      _and = _not_1;
    }
    return _and;
  }
  
  public Boolean esCondicionVegana() {
    return Boolean.valueOf(false);
  }
}
