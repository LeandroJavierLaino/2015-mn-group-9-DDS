package rutina;

import org.eclipse.xtend.lib.annotations.Accessors;
import rutina.Rutina;
import uqbar.arena.persistence.annotations.PersistentClass;

@PersistentClass
@Accessors
@SuppressWarnings("all")
public class RutinaActiva extends Rutina {
  public boolean activaIntensa() {
    int _tiempo = this.getTiempo();
    return (_tiempo > 30);
  }
  
  public boolean esActiva() {
    return true;
  }
  
  public boolean esSoloActiva() {
    int _tiempo = this.getTiempo();
    return Integer.valueOf(_tiempo).equals(Integer.valueOf(0));
  }
}
