package rutina;

import org.eclipse.xtend.lib.annotations.Accessors;
import rutina.Rutina;

@Accessors
@SuppressWarnings("all")
public class RutinaSedentaria extends Rutina {
  public boolean activaIntensa() {
    return false;
  }
  
  public boolean esActiva() {
    return false;
  }
  
  public boolean sedentariaLeve() {
    int _tiempo = this.getTiempo();
    return (_tiempo <= 30);
  }
  
  public boolean sedentariaMedia() {
    int _tiempo = this.getTiempo();
    return (_tiempo > 30);
  }
  
  public boolean sedentaria() {
    int _tiempo = this.getTiempo();
    return (_tiempo == 0);
  }
}
