package filtro;

import cosasUsuario.Usuario;
import filtro.Filtro;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import receta.Receta;

@SuppressWarnings("all")
public class FiltroPorSerCaros implements Filtro {
  public Set<Receta> filtrar(final Set<Receta> recetas, final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta receta) {
        return Boolean.valueOf(receta.tieneIngredientesCaros());
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetas, _function);
    return IterableExtensions.<Receta>toSet(_filter);
  }
}
