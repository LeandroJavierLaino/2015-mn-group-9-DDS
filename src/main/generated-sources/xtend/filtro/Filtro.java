package filtro;

import cosasUsuario.Usuario;
import java.util.Set;
import org.uqbar.commons.utils.TransactionalAndObservable;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@TransactionalAndObservable
@SuppressWarnings("all")
public interface Filtro {
  public abstract Set<Receta> filtrar(final Set<Receta> recetas, final Usuario usuario);
}
