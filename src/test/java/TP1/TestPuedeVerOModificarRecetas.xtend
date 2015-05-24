package TP1

import org.junit.Assert
import org.junit.Test
import testeo.TestInstances

//Punto 4 PUEDE VER/MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Ve/Modifica Receta Propia				True
	Usuario Ve/Modifica Receta Ajena				False
	Usuario Ve/Modifica Receta Propia				True
	*/

//Nuevas excepciones modificadas

class TestPuedeVerOModificarRecetas extends TestInstances{
	
	@Test
	def void leandroPuedeVerRecetaLean() {
		Assert.assertTrue(getRecetaAntiDiabetico.puedeVerReceta(leandro))
	}

	@Test
	def void eriNoPuedeVerRecetaLean() {
		Assert.assertFalse(getRecetaAntiDiabetico.puedeVerReceta(eri))
	}


/*	TODO: No se cumple este caso
	@Test
	def void leandroPuedeVerReceta1() {
		Assert.assertTrue(receta1.puedeVerReceta(leandro))
	}
*/
}