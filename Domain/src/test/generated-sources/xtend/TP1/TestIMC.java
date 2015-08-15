package TP1;

import cosasUsuario.Usuario;
import excepcion.UsuarioInvalidoExcepcion;
import org.junit.Assert;
import org.junit.Test;
import testeo.UsuariosExtras;

/**
 * Casos de Prueba
 * 
 * IMC con Peso y Altura correctos		Equals	(x5)
 * IMC con Altura = 0					UsuarioInvalidoExcepcion
 * IMC con Peso = 0					UsuarioInvalidoExcepcion
 */
@SuppressWarnings("all")
public class TestIMC extends UsuariosExtras {
  @Test
  public void leandroCalculaSuIMC() {
    Usuario _leandro = this.getLeandro();
    double _calculaIMC = _leandro.calculaIMC();
    double _delta = this.getDelta();
    Assert.assertEquals(23.1206235962, _calculaIMC, _delta);
  }
  
  @Test
  public void eriCalculaSuIMC() {
    Usuario _eri = this.getEri();
    double _calculaIMC = _eri.calculaIMC();
    double _delta = this.getDelta();
    Assert.assertEquals(25.9695290859, _calculaIMC, _delta);
  }
  
  @Test
  public void diegoCalculaSuIMC() {
    Usuario _diego = this.getDiego();
    double _calculaIMC = _diego.calculaIMC();
    double _delta = this.getDelta();
    Assert.assertEquals(22.4913494809, _calculaIMC, _delta);
  }
  
  @Test
  public void nicolasCalculaSuIMC() {
    Usuario _nicolas = this.getNicolas();
    double _calculaIMC = _nicolas.calculaIMC();
    double _delta = this.getDelta();
    Assert.assertEquals(19.8176773682, _calculaIMC, _delta);
  }
  
  @Test
  public void pabloCalculaSuIMC() {
    Usuario _pablo = this.getPablo();
    double _calculaIMC = _pablo.calculaIMC();
    double _delta = this.getDelta();
    Assert.assertEquals(22.4712087637, _calculaIMC, _delta);
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void usrInval3CalculaSuIMC() {
    Usuario _usuarioSinAltura = this.getUsuarioSinAltura();
    _usuarioSinAltura.validar();
    Usuario _usuarioSinAltura_1 = this.getUsuarioSinAltura();
    _usuarioSinAltura_1.calculaIMC();
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void usrInval4CalculaSuIMC() {
    Usuario _usuarioSinPeso = this.getUsuarioSinPeso();
    _usuarioSinPeso.validar();
    Usuario _usuarioSinPeso_1 = this.getUsuarioSinPeso();
    _usuarioSinPeso_1.calculaIMC();
  }
}
