package condicion;

import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import receta.Receta;

@SuppressWarnings("all")
public class CondicionCeliaco implements CondicionPreexistente {
  public boolean valido(final Usuario unUsuario) {
    return true;
  }
  
  public boolean tieneRutinaSaludable(final Usuario unUsuario) {
    return true;
  }
  
  public boolean tolera(final Receta unaReceta) {
    return true;
  }
  
  public Boolean esCondicionVegana() {
    return Boolean.valueOf(false);
  }
}
