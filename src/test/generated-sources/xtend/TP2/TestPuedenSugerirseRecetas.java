package TP2;

import cosasUsuario.GrupoUsuario;
import cosasUsuario.Usuario;
import org.junit.Assert;
import org.junit.Test;
import receta.Receta;
import testeo.Grupos;

@SuppressWarnings("all")
public class TestPuedenSugerirseRecetas extends Grupos {
  @Test
  public void puedeSugerirseRecetaAntiVeganoADiego() {
    Usuario _diego = this.getDiego();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    boolean _puedeSerSugeridaUnaReceta = _diego.puedeSerSugeridaUnaReceta(_recetaAntiVegano);
    Assert.assertTrue(_puedeSerSugeridaUnaReceta);
  }
  
  @Test
  public void noPuedeSugerirseRecetaAntiVeganoANicolas() {
    Usuario _nicolas = this.getNicolas();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    boolean _puedeSerSugeridaUnaReceta = _nicolas.puedeSerSugeridaUnaReceta(_recetaAntiVegano);
    Assert.assertFalse(_puedeSerSugeridaUnaReceta);
  }
  
  @Test
  public void noPuedeSugerirseRecetaAntiVeganoAGrupoFlojito() {
    GrupoUsuario _grupoFlojito = this.getGrupoFlojito();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    boolean _puedeSerSugeridaRecetaAlGrupo = _grupoFlojito.puedeSerSugeridaRecetaAlGrupo(_recetaAntiVegano);
    Assert.assertFalse(_puedeSerSugeridaRecetaAlGrupo);
  }
  
  @Test
  public void puedeSugerirseRecetaAntiveganoAGrupoDeLaMuertePorqueLeGustanLasCebollas() {
    GrupoUsuario _grupoDeLaMuerte = this.getGrupoDeLaMuerte();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    boolean _puedeSerSugeridaRecetaAlGrupo = _grupoDeLaMuerte.puedeSerSugeridaRecetaAlGrupo(_recetaAntiVegano);
    Assert.assertTrue(_puedeSerSugeridaRecetaAlGrupo);
  }
}
