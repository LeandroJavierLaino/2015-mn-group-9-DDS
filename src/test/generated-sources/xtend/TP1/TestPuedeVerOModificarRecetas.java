package TP1;

import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.receta.Receta;
import org.junit.Assert;
import org.junit.Test;
import testeo.Grupos;

/**
 * Casos de Prueba
 * 
 * Usuario Ve/Modifica Receta Propia				True
 * Usuario Ve/Modifica Receta Ajena				False
 * Usuario Ve/Modifica Receta Propia				True
 */
@SuppressWarnings("all")
public class TestPuedeVerOModificarRecetas extends Grupos {
  @Test
  public void leandroPuedeVerRecetaLean() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _leandro = this.getLeandro();
    boolean _puedeVerReceta = _recetaAntiDiabetico.puedeVerReceta(_leandro);
    Assert.assertTrue(_puedeVerReceta);
  }
  
  @Test
  public void eriNoPuedeVerRecetaLean() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _eri = this.getEri();
    boolean _puedeVerReceta = _recetaAntiDiabetico.puedeVerReceta(_eri);
    Assert.assertFalse(_puedeVerReceta);
  }
}
