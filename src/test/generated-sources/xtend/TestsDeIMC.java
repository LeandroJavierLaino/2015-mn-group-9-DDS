import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class TestsDeIMC {
  @Test
  public void leandroCalculaSuIMC() {
    final Usuario leandro = new Usuario();
    leandro.setAltura(1.74);
    leandro.setPeso(70);
    double _calculaIMC = leandro.calculaIMC();
    Assert.assertEquals(23.12062359624785, _calculaIMC, 0.00000000000001);
  }
  
  @Test
  public void eriCalculaSuIMC() {
    final Usuario eri = new Usuario();
    eri.setAltura(1.52);
    eri.setPeso(60);
    double _calculaIMC = eri.calculaIMC();
    Assert.assertEquals(25.9695291, _calculaIMC, 0.0000001);
  }
  
  @Test
  public void diegoCalculaSuIMC() {
    final Usuario diego = new Usuario();
    diego.setAltura(1.70);
    diego.setPeso(65);
    double _calculaIMC = diego.calculaIMC();
    Assert.assertEquals(22.491349481, _calculaIMC, 0.000000001);
  }
}
