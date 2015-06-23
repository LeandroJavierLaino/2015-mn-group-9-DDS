package TP2;

import cosasUsuario.Usuario;
import org.junit.Assert;
import org.junit.Test;
import receta.Receta;
import testeo.Grupos;

@SuppressWarnings("all")
public class TestAccesoARecetasPorUsuario extends Grupos {
  @Test
  public void diegoTieneAccesoARecetaAntiDiabetico() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _leandro = this.getLeandro();
    _recetaAntiDiabetico.crearReceta(_leandro);
    Receta _recetaAntiDiabetico_1 = this.getRecetaAntiDiabetico();
    Usuario _diego = this.getDiego();
    boolean _puedeVerReceta = _recetaAntiDiabetico_1.puedeVerReceta(_diego);
    Assert.assertTrue(_puedeVerReceta);
  }
  
  @Test
  public void nicolasNoTieneAccesoARecetaAntidiabetico() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _leandro = this.getLeandro();
    _recetaAntiDiabetico.crearReceta(_leandro);
    Receta _recetaAntiDiabetico_1 = this.getRecetaAntiDiabetico();
    Usuario _nicolas = this.getNicolas();
    boolean _puedeVerReceta = _recetaAntiDiabetico_1.puedeVerReceta(_nicolas);
    Assert.assertFalse(_puedeVerReceta);
  }
}
