package TP1;

import cosasUsuario.Usuario;
import org.junit.Assert;
import org.junit.Test;
import testeo.UsuariosExtras;

/**
 * Casos de Prueba
 * 
 * Usuario con 18<IMC<30 y sin Condiciones		True	(x5)
 * Usuario con IMC<18							False
 * Usuario con 30<IMC							False
 * Usuario Vegano sin Fruta					False
 * Usuario Vegano con Fruta					True
 * Usuario Hipertenso Rutina Activa intensiva	True
 * Usuario Hipertenso Rutina Activa leve		False
 * Usuario Hipertenso Rutina Sedentaria		False
 * Usuario Diabetico Rutina Activa >70kg		True
 * Usuario Diabetico Rutina Activa <70gk		True
 * Usuario Diabetico Rutina Sedentaria >70kg	False
 * Usuario Diabetico Rutina Sedentaria <70kg	True
 * Usuario Celiaco								True
 */
@SuppressWarnings("all")
public class TestRutinaSaludable extends UsuariosExtras {
  @Test
  public void leandroSigueUnaRutinaSaludable() {
    Usuario _leandro = this.getLeandro();
    Boolean _sigueUnaRutinaSaludable = _leandro.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void erikaSigueUnaRutinaSaludable() {
    Usuario _eri = this.getEri();
    Boolean _sigueUnaRutinaSaludable = _eri.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void diegoSigueUnaRutinaSaludable() {
    Usuario _diego = this.getDiego();
    Boolean _sigueUnaRutinaSaludable = _diego.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void nicolasSigueUnaRutinaSaludable() {
    Usuario _nicolas = this.getNicolas();
    Boolean _sigueUnaRutinaSaludable = _nicolas.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void pabloSigueUnaRutinaSaludable() {
    Usuario _pablo = this.getPablo();
    Boolean _sigueUnaRutinaSaludable = _pablo.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioFechaFuturaEIMCMenorA18SigueUnaRutinaSaludable() {
    Usuario _usuarioFechaFuturaEIMCMenorA18 = this.getUsuarioFechaFuturaEIMCMenorA18();
    Boolean _sigueUnaRutinaSaludable = _usuarioFechaFuturaEIMCMenorA18.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioNombreCortoEIMCMayorA30SigueUnaRutinaSaludable() {
    Usuario _usuarioNombreCortoEIMCMayorA30 = this.getUsuarioNombreCortoEIMCMayorA30();
    Boolean _sigueUnaRutinaSaludable = _usuarioNombreCortoEIMCMayorA30.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void VeganoCaretaNoSigueUnaRutinaSaludable() {
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    Boolean _sigueUnaRutinaSaludable = _usuarioVeganoLeGustaPolloYNoLaFruta.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioVeganoValidoYLeGustaLaFrutaSigueUnaRutinaSaludable() {
    Usuario _usuarioVeganoValidoYLeGustaLaFruta = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    Boolean _sigueUnaRutinaSaludable = _usuarioVeganoValidoYLeGustaLaFruta.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicioSigueUnaRutinaSaludable() {
    Usuario _usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = this.getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio();
    Boolean _sigueUnaRutinaSaludable = _usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioHipertensoValidoConRutinaActivaYSinEjercicioNoSigueUnaRutinaSaludable() {
    Usuario _usuarioHipertensoValidoConRutinaActivaYSinEjercicio = this.getUsuarioHipertensoValidoConRutinaActivaYSinEjercicio();
    Boolean _sigueUnaRutinaSaludable = _usuarioHipertensoValidoConRutinaActivaYSinEjercicio.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioHipertensoValidoConRutinaSedentariaNoSigueUnaRutinaSaludable() {
    Usuario _usuarioHipertensoValidoConRutinaSedentaria = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Boolean _sigueUnaRutinaSaludable = _usuarioHipertensoValidoConRutinaSedentaria.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioDiabeticoSinSexoMasDe70KgYActivoSigueUnaRutinaSaludable() {
    Usuario _usuarioDiabeticoSinSexoMasDe70KgYActivo = this.getUsuarioDiabeticoSinSexoMasDe70KgYActivo();
    Boolean _sigueUnaRutinaSaludable = _usuarioDiabeticoSinSexoMasDe70KgYActivo.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioDiabeticoSinPreferenciaMenosDe70KgYActivoSigueUnaRutinaSaludable() {
    Usuario _usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo = this.getUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo();
    Boolean _sigueUnaRutinaSaludable = _usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioDiabeticoValidoMasDe70KgYSedentarioSigueUnaRutinaSaludable() {
    Usuario _usuarioDiabeticoValidoMasDe70KgYSedentario = this.getUsuarioDiabeticoValidoMasDe70KgYSedentario();
    Boolean _sigueUnaRutinaSaludable = _usuarioDiabeticoValidoMasDe70KgYSedentario.sigueUnaRutinaSaludable();
    Assert.assertFalse((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioDiabeticoValidoMenosDe70KgYSedentarioSigueUnaRutinaSaludable() {
    Usuario _usuarioDiabeticoValidoMenosDe70KgYSedentario = this.getUsuarioDiabeticoValidoMenosDe70KgYSedentario();
    Boolean _sigueUnaRutinaSaludable = _usuarioDiabeticoValidoMenosDe70KgYSedentario.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
  
  @Test
  public void UsuarioCeliacoValidoSigueUnaRutinaSaludable() {
    Usuario _usuarioCeliacoValido = this.getUsuarioCeliacoValido();
    Boolean _sigueUnaRutinaSaludable = _usuarioCeliacoValido.sigueUnaRutinaSaludable();
    Assert.assertTrue((_sigueUnaRutinaSaludable).booleanValue());
  }
}
