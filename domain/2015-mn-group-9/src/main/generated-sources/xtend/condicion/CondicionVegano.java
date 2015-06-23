package condicion;

import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import excepcion.CondPreexistenteExcepcion;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import receta.Receta;

@SuppressWarnings("all")
public class CondicionVegano implements CondicionPreexistente {
  public boolean valido(final Usuario unUsuario) {
    try {
      boolean _xifexpression = false;
      boolean _or = false;
      boolean _or_1 = false;
      boolean _or_2 = false;
      List<String> _comidaPreferida = unUsuario.getComidaPreferida();
      boolean _contains = _comidaPreferida.contains("Carne");
      if (_contains) {
        _or_2 = true;
      } else {
        List<String> _comidaPreferida_1 = unUsuario.getComidaPreferida();
        boolean _contains_1 = _comidaPreferida_1.contains("Pollo");
        _or_2 = _contains_1;
      }
      if (_or_2) {
        _or_1 = true;
      } else {
        List<String> _comidaPreferida_2 = unUsuario.getComidaPreferida();
        boolean _contains_2 = _comidaPreferida_2.contains("Chivito");
        _or_1 = _contains_2;
      }
      if (_or_1) {
        _or = true;
      } else {
        List<String> _comidaPreferida_3 = unUsuario.getComidaPreferida();
        boolean _contains_3 = _comidaPreferida_3.contains("Chori");
        _or = _contains_3;
      }
      if (_or) {
        throw new CondPreexistenteExcepcion("Le gustan alimentos no propios de un vegano");
      } else {
        _xifexpression = true;
      }
      return _xifexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean tieneRutinaSaludable(final Usuario unUsuario) {
    try {
      boolean _xblockexpression = false;
      {
        List<String> _comidaPreferida = unUsuario.getComidaPreferida();
        boolean _isNullOrEmpty = IterableExtensions.isNullOrEmpty(_comidaPreferida);
        if (_isNullOrEmpty) {
          throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia");
        }
        List<String> _comidaPreferida_1 = unUsuario.getComidaPreferida();
        _xblockexpression = _comidaPreferida_1.contains("Fruta");
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean tolera(final Receta unaReceta) {
    boolean _and = false;
    boolean _and_1 = false;
    boolean _and_2 = false;
    boolean _contieneComida = unaReceta.contieneComida("carne", 1);
    boolean _not = (!_contieneComida);
    if (!_not) {
      _and_2 = false;
    } else {
      boolean _contieneComida_1 = unaReceta.contieneComida("pollo", 1);
      boolean _not_1 = (!_contieneComida_1);
      _and_2 = _not_1;
    }
    if (!_and_2) {
      _and_1 = false;
    } else {
      boolean _contieneComida_2 = unaReceta.contieneComida("chivito", 1);
      boolean _not_2 = (!_contieneComida_2);
      _and_1 = _not_2;
    }
    if (!_and_1) {
      _and = false;
    } else {
      boolean _contieneComida_3 = unaReceta.contieneComida("chori", 1);
      boolean _not_3 = (!_contieneComida_3);
      _and = _not_3;
    }
    return _and;
  }
  
  public Boolean esCondicionVegana() {
    return Boolean.valueOf(true);
  }
}
