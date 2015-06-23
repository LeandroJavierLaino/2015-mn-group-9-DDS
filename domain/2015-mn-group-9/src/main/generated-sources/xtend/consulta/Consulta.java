package consulta;

import cosasUsuario.Usuario;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import receta.Receta;

@Accessors
@SuppressWarnings("all")
public class Consulta {
  private Usuario usuario;
  
  private Set<Receta> recetas;
  
  public Consulta(final Usuario usr, final Set<Receta> vRecetas) {
    this.usuario = usr;
    this.recetas = vRecetas;
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public Set<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final Set<Receta> recetas) {
    this.recetas = recetas;
  }
}
