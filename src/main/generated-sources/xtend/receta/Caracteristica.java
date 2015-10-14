package receta;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@Inheritance(strategy = InheritanceType.JOINED)
@Entity
@SuppressWarnings("all")
public abstract class Caracteristica {
  @Id
  @GeneratedValue
  private long idCaracteristica;
  
  @Column(length = 30)
  private String nombre;
  
  @Column
  private double cantidad;
  
  @Column(length = 30)
  private String tipo;
  
  public Caracteristica() {
  }
  
  public Caracteristica(final String cNombre, final double cCantidad, final String cTipo) {
    this.nombre = cNombre;
    this.cantidad = cCantidad;
    this.tipo = cTipo;
  }
  
  @Pure
  public long getIdCaracteristica() {
    return this.idCaracteristica;
  }
  
  public void setIdCaracteristica(final long idCaracteristica) {
    this.idCaracteristica = idCaracteristica;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public double getCantidad() {
    return this.cantidad;
  }
  
  public void setCantidad(final double cantidad) {
    this.cantidad = cantidad;
  }
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}
