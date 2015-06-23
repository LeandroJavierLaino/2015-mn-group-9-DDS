package consulta;

import consulta.Consulta;
import consulta.Monitor;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.joda.time.DateTime;

@SuppressWarnings("all")
public class MonitorHora implements Monitor {
  private DateTime localtime = new DateTime();
  
  private int hora = this.localtime.getHourOfDay();
  
  private int[] contadorHoras = new int[24];
  
  public void monitorear(final Consulta consulta) {
    DateTime _now = DateTime.now();
    this.localtime = _now;
    int _hourOfDay = this.localtime.getHourOfDay();
    this.hora = _hourOfDay;
    int _indexOf = ((List<Integer>)Conversions.doWrapArray(this.contadorHoras)).indexOf(Integer.valueOf(this.hora));
    boolean _equals = Integer.valueOf(_indexOf).equals(null);
    if (_equals) {
      this.contadorHoras[this.hora] = 1;
    } else {
      int _get = this.contadorHoras[this.hora];
      int _plus = (_get + 1);
      this.contadorHoras[this.hora] = _plus;
    }
  }
  
  public String mostrarResultados() {
    Integer _max = IterableExtensions.<Integer>max(((Iterable<Integer>)Conversions.doWrapArray(this.contadorHoras)));
    int _indexOf = ((List<Integer>)Conversions.doWrapArray(this.contadorHoras)).indexOf(_max);
    return Integer.valueOf(_indexOf).toString();
  }
}
