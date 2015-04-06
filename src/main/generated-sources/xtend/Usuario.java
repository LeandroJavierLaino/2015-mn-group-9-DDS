import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Usuario {
  @Accessors
  private double altura;
  
  @Accessors
  private double peso;
  
  public double calculaIMC() {
    return (this.peso / (this.altura * this.altura));
  }
  
  @Pure
  public double getAltura() {
    return this.altura;
  }
  
  public void setAltura(final double altura) {
    this.altura = altura;
  }
  
  @Pure
  public double getPeso() {
    return this.peso;
  }
  
  public void setPeso(final double peso) {
    this.peso = peso;
  }
}
