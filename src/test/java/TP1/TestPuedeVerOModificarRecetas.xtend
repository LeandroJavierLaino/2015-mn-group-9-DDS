package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

//Punto 4 PUEDE VER/MODIFICAR RECETAS

class TestPuedeVerOModificarRecetas extends TestInstances{
	@Test
	def void leandroPuedeVerRecetaLean() {
		Assert.assertTrue(receta2.puedeVerReceta(leandro))
	}

	@Test
	def void eriNoPuedeVerRecetaLean() {
		Assert.assertFalse(receta2.puedeVerReceta(eri))
	}


/*	@Test
	def void leandroPuedeVerReceta1() {
		Assert.assertTrue(receta1.puedeVerReceta(leandro))
	}
*/
}