package rutina;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@SuppressWarnings("all")
public abstract class Rutina {
  @Id
  @GeneratedValue
  private long idRutina;
  
  @Column
  private int tiempo;
  
  public abstract boolean activaIntensa();
  
  public abstract boolean esActiva();
  
  @Pure
  public long getIdRutina() {
    return this.idRutina;
  }
  
  public void setIdRutina(final long idRutina) {
    this.idRutina = idRutina;
  }
  
  @Pure
  public int getTiempo() {
    return this.tiempo;
  }
  
  public void setTiempo(final int tiempo) {
    this.tiempo = tiempo;
  }
}
