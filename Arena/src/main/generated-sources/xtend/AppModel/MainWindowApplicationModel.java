package AppModel;

import AppModel.UserRecipesModel;
import com.google.common.base.Objects;
import cosasUsuario.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.queComemos.uiArena.QueComemosMainWindow;
import org.queComemos.uiArena.UserRecipesWindow;
import org.uqbar.commons.utils.Observable;
import repositorioUsuarios.RepositorioUsuarios;

@Observable
@Accessors
@SuppressWarnings("all")
public class MainWindowApplicationModel {
  private String usuario;
  
  private String contrasenia;
  
  private QueComemosMainWindow owner;
  
  private String logro;
  
  public String init() {
    return this.logro = "";
  }
  
  public String login() {
    String _xifexpression = null;
    boolean _and = false;
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    List<Usuario> _objects = _instance.getObjects();
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario it) {
        String _nombre = it.getNombre();
        return Boolean.valueOf(Objects.equal(_nombre, MainWindowApplicationModel.this.usuario));
      }
    };
    boolean _exists = IterableExtensions.<Usuario>exists(_objects, _function);
    if (!_exists) {
      _and = false;
    } else {
      boolean _equals = Objects.equal(this.contrasenia, "123");
      _and = _equals;
    }
    if (_and) {
      this.logro = "Acceso Permitido";
      Usuario _user = this.getUser(this.usuario);
      UserRecipesModel _userRecipesModel = new UserRecipesModel(_user);
      final UserRecipesWindow window = new UserRecipesWindow(this.owner, _userRecipesModel);
      window.open();
      this.owner.close();
    } else {
      _xifexpression = this.logro = "Acceso Denegado";
    }
    return _xifexpression;
  }
  
  public Usuario getUser(final String usuario) {
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    return _instance.getUserByName(usuario);
  }
  
  @Pure
  public String getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final String usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public String getContrasenia() {
    return this.contrasenia;
  }
  
  public void setContrasenia(final String contrasenia) {
    this.contrasenia = contrasenia;
  }
  
  @Pure
  public QueComemosMainWindow getOwner() {
    return this.owner;
  }
  
  public void setOwner(final QueComemosMainWindow owner) {
    this.owner = owner;
  }
  
  @Pure
  public String getLogro() {
    return this.logro;
  }
  
  public void setLogro(final String logro) {
    this.logro = logro;
  }
}
