package TP1;

import cosasUsuario.Usuario;
import excepcion.SinPermisosExcepcion;
import org.junit.Test;
import receta.Receta;
import testeo.Grupos;

/**
 * Casos de Prueba
 * 
 * Usuario Modifica Receta Propia					Good
 * Usuario Modifica Receta Ajena					SinPermisosExcepcion
 * Usuario Modifica Receta y no da Nombre			RecetaInvalidaExcepcion
 */
@SuppressWarnings("all")
public class TestModificarRecetas extends Grupos {
  @Test
  public void leandroModificaRecetaAntiVegano() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _leandro = this.getLeandro();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    _recetaAntiDiabetico.modificarReceta(_leandro, _recetaAntiVegano);
  }
  
  @Test(expected = SinPermisosExcepcion.class)
  public void leandroModificaRecetaParaCualquiera() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _leandro = this.getLeandro();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    _recetaParaCualquiera.modificarReceta(_leandro, _recetaAntiVegano);
  }
}
