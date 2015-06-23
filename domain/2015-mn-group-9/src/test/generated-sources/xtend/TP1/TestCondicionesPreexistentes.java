package TP1;

import condicion.CondicionVegano;
import cosasUsuario.Usuario;
import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import receta.Receta;
import testeo.UsuariosExtras;

/**
 * Casos de Prueba
 * 
 * Receta con Chori 		-> Vegano		False
 * Receta con Azucar(150)	-> Diabetico	False
 * Receta sin problemas	-> Vegano		True
 * Receta sin problemas	-> Diabetico	True
 * Receta sin problemas	-> Hipertenso	True
 * Receta sin problemas	-> Celiaco		True
 */
@SuppressWarnings("all")
public class TestCondicionesPreexistentes extends UsuariosExtras {
  @Before
  public void init() {
    super.init();
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    List<String> _comidaPreferida = _usuarioVeganoLeGustaPolloYNoLaFruta.getComidaPreferida();
    _comidaPreferida.add("Pollo");
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta_1 = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    CondicionVegano _vegano = this.getVegano();
    _usuarioVeganoLeGustaPolloYNoLaFruta_1.agregarCondicion(_vegano);
  }
  
  @Test
  public void RecetaAntiveganoNoAdecuadaParaVegano() {
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    boolean _esRecomendablePara = _recetaAntiVegano.esRecomendablePara(_usuarioVeganoLeGustaPolloYNoLaFruta);
    Assert.assertFalse(_esRecomendablePara);
  }
  
  @Test
  public void RecetaAntiDiabeticoNoAdecuadaParaDiabetico() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _usuarioDiabeticoSinSexoMasDe70KgYActivo = this.getUsuarioDiabeticoSinSexoMasDe70KgYActivo();
    boolean _esRecomendablePara = _recetaAntiDiabetico.esRecomendablePara(_usuarioDiabeticoSinSexoMasDe70KgYActivo);
    Assert.assertFalse(_esRecomendablePara);
  }
  
  @Test
  public void RecetaParaCualquieraAdecuadaParaVeganoCareta() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _usuarioVeganoLeGustaPolloYNoLaFruta = this.getUsuarioVeganoLeGustaPolloYNoLaFruta();
    boolean _esRecomendablePara = _recetaParaCualquiera.esRecomendablePara(_usuarioVeganoLeGustaPolloYNoLaFruta);
    Assert.assertTrue(_esRecomendablePara);
  }
  
  @Test
  public void RecetaParaCualquieraAdecuadaParaDiabetico() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _usuarioDiabeticoSinSexoMasDe70KgYActivo = this.getUsuarioDiabeticoSinSexoMasDe70KgYActivo();
    boolean _esRecomendablePara = _recetaParaCualquiera.esRecomendablePara(_usuarioDiabeticoSinSexoMasDe70KgYActivo);
    Assert.assertTrue(_esRecomendablePara);
  }
  
  @Test
  public void RecetaParaCualquieraAdecuadaParaHipertenso() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = this.getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio();
    boolean _esRecomendablePara = _recetaParaCualquiera.esRecomendablePara(_usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio);
    Assert.assertTrue(_esRecomendablePara);
  }
  
  @Test
  public void RecetaParaCualquieraAdecuadaParaCeliaco() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _usuarioCeliacoValido = this.getUsuarioCeliacoValido();
    boolean _esRecomendablePara = _recetaParaCualquiera.esRecomendablePara(_usuarioCeliacoValido);
    Assert.assertTrue(_esRecomendablePara);
  }
}
