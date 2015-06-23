package excepcion;

@SuppressWarnings("all")
public class FechaInvalidaExcepcion extends RuntimeException {
  public FechaInvalidaExcepcion(final String msg) {
    super(msg);
  }
}
