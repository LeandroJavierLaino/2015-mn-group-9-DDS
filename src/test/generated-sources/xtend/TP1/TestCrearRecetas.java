package TP1;

import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.excepcion.RecetaInvalidaExcepcion;
import ar.edu.domain.receta.Receta;
import org.junit.Test;
import testeo.UsuariosExtras;

/**
 * Casos de Prueba
 * 
 * Receta s/ingrediente						RecetaInvalidaExcepcion
 * Receta c/ingrediente y CALORIAS<10			CondPreexistenteExcepcion
 * Receta c/ingrediente y 5000<CALORIAS		CondPreexistenteExcepcion
 * Receta c/ingrediente y 10<CALORIAS<5000		Good	(x2)
 */
@SuppressWarnings("all")
public class TestCrearRecetas extends UsuariosExtras {
  @Test(expected = RecetaInvalidaExcepcion.class)
  public void leandroCreaReceta() {
    Receta _recetaSinIngrediente = this.getRecetaSinIngrediente();
    Usuario _leandro = this.getLeandro();
    _recetaSinIngrediente.crearReceta(_leandro);
  }
  
  @Test(expected = RecetaInvalidaExcepcion.class)
  public void eriCreaReceta() {
    Receta _recetaCaloriasBajoRango = this.getRecetaCaloriasBajoRango();
    Usuario _eri = this.getEri();
    _recetaCaloriasBajoRango.crearReceta(_eri);
  }
  
  @Test(expected = RecetaInvalidaExcepcion.class)
  public void crearReceta() {
    Receta _recetaCaloriasMayorRango = this.getRecetaCaloriasMayorRango();
    Usuario _diego = this.getDiego();
    _recetaCaloriasMayorRango.crearReceta(_diego);
  }
  
  @Test
  public void nicolasCreaReceta() {
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    Usuario _nicolas = this.getNicolas();
    _recetaAntiVegano.crearReceta(_nicolas);
  }
  
  @Test
  public void pabloCreaReceta() {
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    Usuario _pablo = this.getPablo();
    _recetaAntiDiabetico.crearReceta(_pablo);
  }
}
