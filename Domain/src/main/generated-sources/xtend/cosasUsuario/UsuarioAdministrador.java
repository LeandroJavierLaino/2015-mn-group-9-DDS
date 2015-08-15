package cosasUsuario;

import cosasUsuario.Usuario;
import java.util.List;
import repositorioUsuarios.RepositorioUsuarios;

@SuppressWarnings("all")
public class UsuarioAdministrador extends Usuario {
  public void aceptarSuscripcion(final Usuario usuario) {
    RepositorioUsuarios repo = RepositorioUsuarios.getInstance();
    repo.removerDeListaPendientes(usuario);
    repo.add(usuario);
  }
  
  public boolean rechazarSuscripcion(final Usuario usuario, final String motivo) {
    boolean _xblockexpression = false;
    {
      RepositorioUsuarios repo = RepositorioUsuarios.getInstance();
      _xblockexpression = repo.removerDeListaPendientes(usuario);
    }
    return _xblockexpression;
  }
  
  public List<Usuario> listarPendientes() {
    List<Usuario> _xblockexpression = null;
    {
      RepositorioUsuarios repo = RepositorioUsuarios.getInstance();
      _xblockexpression = repo.getListaPorAceptarse();
    }
    return _xblockexpression;
  }
}
