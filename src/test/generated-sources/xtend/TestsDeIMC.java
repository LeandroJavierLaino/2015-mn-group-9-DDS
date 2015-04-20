import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestsDeIMC {
  private Usuario leandro;
  
  private Usuario eri;
  
  private Usuario diego;
  
  private Usuario nicolas;
  
  private Usuario pablo;
  
  private double delta = 0.0000000001;
  
  @Before
  public void init() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setAltura(1.74);
        it.setPeso(70);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.leandro = _doubleArrow;
    Usuario _usuario_1 = new Usuario();
    final Procedure1<Usuario> _function_1 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setAltura(1.52);
        it.setPeso(60);
      }
    };
    Usuario _doubleArrow_1 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_1, _function_1);
    this.eri = _doubleArrow_1;
    Usuario _usuario_2 = new Usuario();
    final Procedure1<Usuario> _function_2 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setAltura(1.70);
        it.setPeso(65);
      }
    };
    Usuario _doubleArrow_2 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_2, _function_2);
    this.diego = _doubleArrow_2;
    Usuario _usuario_3 = new Usuario();
    final Procedure1<Usuario> _function_3 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setAltura(1.74);
        it.setPeso(60);
      }
    };
    Usuario _doubleArrow_3 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_3, _function_3);
    this.nicolas = _doubleArrow_3;
    Usuario _usuario_4 = new Usuario();
    final Procedure1<Usuario> _function_4 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setAltura(1.79);
        it.setPeso(72);
      }
    };
    Usuario _doubleArrow_4 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_4, _function_4);
    this.pablo = _doubleArrow_4;
  }
  
  @Test
  public void leandroCalculaSuIMC() {
    double _calculaIMC = this.leandro.calculaIMC();
    Assert.assertEquals(23.1206235962, _calculaIMC, this.delta);
  }
  
  @Test
  public void eriCalculaSuIMC() {
    double _calculaIMC = this.eri.calculaIMC();
    Assert.assertEquals(25.9695290859, _calculaIMC, this.delta);
  }
  
  @Test
  public void diegoCalculaSuIMC() {
    double _calculaIMC = this.diego.calculaIMC();
    Assert.assertEquals(22.4913494809, _calculaIMC, this.delta);
  }
  
  @Test
  public void nicolasCalculaSuIMC() {
    double _calculaIMC = this.nicolas.calculaIMC();
    Assert.assertEquals(19.8176773682, _calculaIMC, this.delta);
  }
  
  @Test
  public void pabloCalculaSuIMC() {
    double _calculaIMC = this.pablo.calculaIMC();
    Assert.assertEquals(22.4712087637, _calculaIMC, this.delta);
  }
}
