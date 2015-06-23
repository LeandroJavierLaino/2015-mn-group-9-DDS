package consulta;

import consulta.Consulta;

@SuppressWarnings("all")
public interface Monitor {
  public abstract void monitorear(final Consulta consulta);
  
  public abstract String mostrarResultados();
}
