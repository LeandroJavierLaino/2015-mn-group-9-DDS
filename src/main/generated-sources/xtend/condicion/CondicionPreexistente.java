package condicion;

import cosasUsuario.Usuario;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@SuppressWarnings("all")
public interface CondicionPreexistente {
  public abstract boolean valido(final Usuario unUsusario);
  
  public abstract boolean tieneRutinaSaludable(final Usuario unUsuario);
  
  public abstract boolean tolera(final Receta unaReceta);
  
  public abstract Boolean esCondicionVegana();
}
