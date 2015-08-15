package excepcion;

@SuppressWarnings("all")
public class UsuarioInvalidoExcepcion extends Exception {
  public UsuarioInvalidoExcepcion(final String msg) {
    super(msg);
  }
}
