package excepcion;

@SuppressWarnings("all")
public class RecetaInvalidaExcepcion extends Exception {
  public RecetaInvalidaExcepcion(final String msg) {
    super(msg);
  }
}
