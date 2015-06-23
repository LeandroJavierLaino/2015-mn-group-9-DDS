package condicion;

import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import excepcion.CondPreexistenteExcepcion;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.StringExtensions;
import receta.Receta;
import rutina.Rutina;

@SuppressWarnings("all")
public class CondicionDiabetico implements CondicionPreexistente {
  public boolean valido(final Usuario unUsuario) {
    try {
      boolean _xblockexpression = false;
      {
        String _sexo = unUsuario.getSexo();
        boolean _isNullOrEmpty = StringExtensions.isNullOrEmpty(_sexo);
        if (_isNullOrEmpty) {
          throw new CondPreexistenteExcepcion("El campo sexo no se declaro esta vacio");
        } else {
          boolean _or = false;
          String _sexo_1 = unUsuario.getSexo();
          boolean _equalsIgnoreCase = _sexo_1.equalsIgnoreCase("M");
          if (_equalsIgnoreCase) {
            _or = true;
          } else {
            String _sexo_2 = unUsuario.getSexo();
            boolean _equalsIgnoreCase_1 = _sexo_2.equalsIgnoreCase("F");
            _or = _equalsIgnoreCase_1;
          }
          boolean _not = (!_or);
          if (_not) {
            throw new CondPreexistenteExcepcion("El campo sexo es dintinto de \'M\' y \'F\'");
          }
        }
        List<String> _comidaPreferida = unUsuario.getComidaPreferida();
        boolean _isNullOrEmpty_1 = IterableExtensions.isNullOrEmpty(_comidaPreferida);
        if (_isNullOrEmpty_1) {
          throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia");
        }
        boolean _or_1 = false;
        String _sexo_3 = unUsuario.getSexo();
        boolean _equalsIgnoreCase_2 = _sexo_3.equalsIgnoreCase("M");
        if (_equalsIgnoreCase_2) {
          _or_1 = true;
        } else {
          String _sexo_4 = unUsuario.getSexo();
          boolean _equalsIgnoreCase_3 = _sexo_4.equalsIgnoreCase("F");
          _or_1 = _equalsIgnoreCase_3;
        }
        _xblockexpression = _or_1;
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean tieneRutinaSaludable(final Usuario unUsuario) {
    boolean _or = false;
    Rutina _rutina = unUsuario.getRutina();
    boolean _esActiva = _rutina.esActiva();
    if (_esActiva) {
      _or = true;
    } else {
      double _peso = unUsuario.getPeso();
      boolean _lessEqualsThan = (_peso <= 70);
      _or = _lessEqualsThan;
    }
    return _or;
  }
  
  public boolean tolera(final Receta unaReceta) {
    boolean _contieneComida = unaReceta.contieneComida("Azucar", 100);
    return (!_contieneComida);
  }
  
  public Boolean esCondicionVegana() {
    return Boolean.valueOf(false);
  }
}
