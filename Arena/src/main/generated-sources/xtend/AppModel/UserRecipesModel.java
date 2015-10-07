package AppModel;

import AppModel.RecipeModel;
import cosasUsuario.Usuario;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.queComemos.uiArena.RecipeDetailWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.Observable;
import receta.Receta;

@Accessors
@Observable
@SuppressWarnings("all")
public class UserRecipesModel {
  private Usuario user;
  
  private String nombre;
  
  private List<Receta> resultados;
  
  private Receta seleccionada;
  
  private WindowOwner owner;
  
  public UserRecipesModel(final Usuario usuario) {
    this.user = usuario;
  }
  
  public List<Receta> inspeccionarUsuario() {
    List<Receta> _xblockexpression = null;
    {
      String _nombre = this.user.getNombre();
      this.nombre = _nombre;
      Set<Receta> _recetas = this.user.getRecetas();
      List<Receta> _list = IterableExtensions.<Receta>toList(_recetas);
      _xblockexpression = this.resultados = _list;
    }
    return _xblockexpression;
  }
  
  public void verReceta() {
    RecipeModel _recipeModel = new RecipeModel(this.seleccionada, this.user);
    final RecipeDetailWindow window = new RecipeDetailWindow(this.owner, _recipeModel);
    window.open();
  }
  
  @Pure
  public Usuario getUser() {
    return this.user;
  }
  
  public void setUser(final Usuario user) {
    this.user = user;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public List<Receta> getResultados() {
    return this.resultados;
  }
  
  public void setResultados(final List<Receta> resultados) {
    this.resultados = resultados;
  }
  
  @Pure
  public Receta getSeleccionada() {
    return this.seleccionada;
  }
  
  public void setSeleccionada(final Receta seleccionada) {
    this.seleccionada = seleccionada;
  }
  
  @Pure
  public WindowOwner getOwner() {
    return this.owner;
  }
  
  public void setOwner(final WindowOwner owner) {
    this.owner = owner;
  }
}
