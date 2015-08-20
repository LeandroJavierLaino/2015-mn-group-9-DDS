package TP1;

import cosasUsuario.Usuario;
import excepcion.SinPermisosExcepcion;
import org.junit.Before;
import org.junit.Test;
import receta.Receta;
import testeo.Grupos;

/**
 * Casos de Prueba
 * 
 * Usuario crea Receta con SubRecetas sin permisos			SinPermisosExcepcion
 * Usuario crea Receta con SubRecetas						Good
 */
@SuppressWarnings("all")
public class TestRecetaConSubrecetas extends Grupos {
  @Before
  public void init() {
    super.init();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    Usuario _diego = this.getDiego();
    _recetaAntiVegano.crearReceta(_diego);
  }
  
  @Test(expected = SinPermisosExcepcion.class)
  public void construirRecetasConSubRecetasSinPermisos() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _eri = this.getEri();
    _recetaParaCualquiera.crearReceta(_eri);
    Usuario _diego = this.getDiego();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    Receta _recetaParaCualquiera_1 = this.getRecetaParaCualquiera();
    _diego.agregarRecetaAUnaPrincipal(_recetaAntiVegano, _recetaParaCualquiera_1);
  }
  
  @Test
  public void construirRecetasConSubRecetasConPermisos() {
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    Usuario _diego = this.getDiego();
    _recetaParaCualquiera.crearReceta(_diego);
    Usuario _diego_1 = this.getDiego();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    Receta _recetaParaCualquiera_1 = this.getRecetaParaCualquiera();
    _diego_1.agregarRecetaAUnaPrincipal(_recetaAntiVegano, _recetaParaCualquiera_1);
  }
}
