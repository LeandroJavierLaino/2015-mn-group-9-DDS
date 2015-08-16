package excepcion;

@SuppressWarnings("all")
public class CondPreexistenteExcepcion extends Exception {
  public CondPreexistenteExcepcion(final String msg) {
    super(msg);
  }
}
