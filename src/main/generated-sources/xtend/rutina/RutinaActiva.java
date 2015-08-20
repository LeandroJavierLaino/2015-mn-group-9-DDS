package rutina;

import org.eclipse.xtend.lib.annotations.Accessors;
import rutina.Rutina;

@Accessors
@SuppressWarnings("all")
public class RutinaActiva extends Rutina {
  @Override
public boolean activaIntensa() {
    int _tiempo = this.getTiempo();
    return (_tiempo > 30);
  }
  
  @Override
public boolean esActiva() {
    return true;
  }
  
  public boolean esSoloActiva() {
    int _tiempo = this.getTiempo();
    return Integer.valueOf(_tiempo).equals(Integer.valueOf(0));
  }
}
