package receta;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.Entity;
import org.uqbar.commons.utils.TransactionalAndObservable;
import uqbar.arena.persistence.annotations.PersistentClass;
import uqbar.arena.persistence.annotations.PersistentField;

@PersistentClass
@TransactionalAndObservable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@SuppressWarnings("all")
public abstract class Caracteristica extends Entity {
  @PersistentField
  private String nombre;
  
  @PersistentField
  private double cantidad;
  
  @PersistentField
  private String tipo;
  
  public Caracteristica() {
  }
  
  public Caracteristica(final String cNombre, final double cCantidad, final String cTipo) {
    this.nombre = cNombre;
    this.cantidad = cCantidad;
    this.tipo = cTipo;
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
