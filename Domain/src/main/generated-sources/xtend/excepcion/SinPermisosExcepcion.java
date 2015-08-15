package excepcion;

@SuppressWarnings("all")
public class SinPermisosExcepcion extends Exception {
  public SinPermisosExcepcion(final String msg) {
    super(msg);
  }
}
