package TP1;

import cosasUsuario.Usuario;
import excepcion.CondPreexistenteExcepcion;
import excepcion.FechaInvalidaExcepcion;
import excepcion.UsuarioInvalidoExcepcion;
import org.junit.Test;
import testeo.UsuariosExtras;

/**
 * Casos de Prueba
 * 
 * Usuario con Nombre, Altura, Peso, FechaPasada y Rutina			Good	(x5)
 * Usuario con Nombre, Altura, Peso, FechaPasada y Rutina s/Sexo	Good
 * Usuarios sin Nombre, Altura, Peso, FechaPasada o Rutina			UsuarioInvalidoExcepcion
 * Usuario con Nombre <4 digitos									UsuarioInvalidoExcepcion
 * Usuario con Altura = 0											UsuarioInvalidoExcepcion
 * Usuario con Peso = 0											UsuarioInvalidoExcepcion
 * Usuario con FechaFutura											UsuarioInvalidoExcepcion
 * Usuario Vegano con gustos: Pollo								CondPreexistenteExcepcion
 * Usuario Vegano con gustos: Fruta								Good
 * Usuario Hipertenso sin gustos									CondPreexistenteExcepcion
 * Usuario Hipertenso con gustos									Good
 * Usuario Diabetico sin Sexo										CondPreexistenteExcepcion
 * Usuario Diabetico sin gustos									CondPreexistenteExcepcion
 * Usuario Diabetico con Sexo y gustos								Good
 * Usuario Celiaco													Good
 */
@SuppressWarnings("all")
public class TestValidez extends UsuariosExtras {
  @Test
  public void eriEsUnUsuarioValido() {
    Usuario _eri = this.getEri();
    _eri.validar();
  }
  
  @Test
  public void diegoEsUnUsuarioValido() {
    Usuario _diego = this.getDiego();
    _diego.validar();
  }
  
  @Test
  public void nicolasEsUnUsuarioValido() {
    Usuario _nicolas = this.getNicolas();
    _nicolas.validar();
  }
  
  @Test
  public void pabloEsUnUsuarioValido() {
    Usuario _pablo = this.getPablo();
    _pablo.validar();
  }
  
  @Test
  public void leandroEsUnUsuarioValido() {
    Usuario _leandro = this.getLeandro();
    _leandro.validar();
  }
  
  @Test
  public void UsuarioSinSexoEsUnUsuarioValidoSinSexo() {
    Usuario _usuarioSinSexo = this.getUsuarioSinSexo();
    _usuarioSinSexo.validar();
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void UsuarioSinDatosNoValidoFaltanDatos() {
    Usuario _usuarioSinDatos = this.getUsuarioSinDatos();
    _usuarioSinDatos.validar();
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void UsuarioNombreCortoEIMCMayorA30NoValidoNombreCorto() {
    Usuario _usuarioNombreCortoEIMCMayorA30 = this.getUsuarioNombreCortoEIMCMayorA30();
    _usuarioNombreCortoEIMCMayorA30.validar();
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void UsuarioSinAlturaNoValidoSinAltura() {
    Usuario _usuarioSinAltura = this.getUsuarioSinAltura();
    _usuarioSinAltura.validar();
  }
  
  @Test(expected = UsuarioInvalidoExcepcion.class)
  public void UsuarioSinPesoNoValidoSinPeso() {
    Usuario _usuarioSinPeso = this.getUsuarioSinPeso();
    _usuarioSinPeso.validar();
  }
  
  @Test(expected = FechaInvalidaExcepcion.class)
  public void UsuarioFechaFuturaEIMCMenorA18NoValidoFechaFutura() {
    Usuario _usuarioFechaFuturaEIMCMenorA18 = this.getUsuarioFechaFuturaEIMCMenorA18();
    _usuarioFechaFuturaEIMCMenorA18.validar();
  }
  
  @Test(expected = CondPreexistenteExcepcion.class)
  public void VeganoCaretaUnoNoValidoPorGustos() {
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    _usuarioVeganoLeGustaPolloYNoLaFruta.validar();
  }
  
  @Test
  public void UsuarioVeganoValidoYLeGustaLaFrutaValido() {
    Usuario _usuarioVeganoValidoYLeGustaLaFruta = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    _usuarioVeganoValidoYLeGustaLaFruta.validar();
  }
  
  @Test(expected = CondPreexistenteExcepcion.class)
  public void UsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicioNoValidoPorGustos() {
    Usuario _usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = this.getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio();
    _usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio.validar();
  }
  
  @Test
  public void UsuarioHipertensoValidoConRutinaActivaYSinEjercicioValido() {
    Usuario _usuarioHipertensoValidoConRutinaActivaYSinEjercicio = this.getUsuarioHipertensoValidoConRutinaActivaYSinEjercicio();
    _usuarioHipertensoValidoConRutinaActivaYSinEjercicio.validar();
  }
  
  @Test(expected = CondPreexistenteExcepcion.class)
  public void UsuarioDiabeticoSinSexoMasDe70KgYActivoNoValido() {
    Usuario _usuarioDiabeticoSinSexoMasDe70KgYActivo = this.getUsuarioDiabeticoSinSexoMasDe70KgYActivo();
    _usuarioDiabeticoSinSexoMasDe70KgYActivo.validar();
  }
  
  @Test(expected = CondPreexistenteExcepcion.class)
  public void UsuarioDiabeticoSinPreferenciaMenosDe70KgYActivoNoValidoPorGustos() {
    Usuario _usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo = this.getUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo();
    _usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo.validar();
  }
  
  @Test
  public void UsuarioDiabeticoValidoMasDe70KgYSedentarioValido() {
    Usuario _usuarioDiabeticoValidoMasDe70KgYSedentario = this.getUsuarioDiabeticoValidoMasDe70KgYSedentario();
    _usuarioDiabeticoValidoMasDe70KgYSedentario.validar();
  }
  
  @Test
  public void usrCeliacoValido() {
    Usuario _usuarioCeliacoValido = this.getUsuarioCeliacoValido();
    _usuarioCeliacoValido.validar();
  }
}
