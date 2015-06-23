package filtro;

import cosasUsuario.Usuario;
import java.util.Set;
import receta.Receta;

@SuppressWarnings("all")
public interface Filtro {
  public abstract Set<Receta> filtrar(final Set<Receta> recetas, final Usuario usuario);
}
