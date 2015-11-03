package filtro;

import cosasUsuario.Usuario;
import filtro.Filtro;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import receta.Receta;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@SuppressWarnings("all")
public class FiltroPorExcesoDeCalorias implements Filtro {
  public Set<Receta> filtrar(final Set<Receta> recetas, final Usuario usuario) {
    Set<Receta> _xifexpression = null;
    boolean _tieneSobrepeso = usuario.tieneSobrepeso();
    if (_tieneSobrepeso) {
      final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          return Boolean.valueOf(receta.tieneExcesoDeCalorias());
        }
      };
      Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetas, _function);
      _xifexpression = IterableExtensions.<Receta>toSet(_filter);
    } else {
      _xifexpression = recetas;
    }
    return _xifexpression;
  }
}
