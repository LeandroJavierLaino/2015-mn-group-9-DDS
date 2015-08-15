package rutina;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public abstract class Rutina {
  private int tiempo;
  
  public abstract boolean activaIntensa();
  
  public abstract boolean esActiva();
  
  @Pure
  public int getTiempo() {
    return this.tiempo;
  }
  
  public void setTiempo(final int tiempo) {
    this.tiempo = tiempo;
  }
}
