package TP1

import org.junit.Test
import org.junit.Assert
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
		Assert.assertTrue(receta2.puedeVerReceta(leandro))
	}

	@Test
	def void eriNoPuedeVerRecetaLean() {
		Assert.assertFalse(receta2.puedeVerReceta(eri))
	}


/*	TODO: No se cumple este caso
	@Test
	def void leandroPuedeVerReceta1() {
		Assert.assertTrue(receta1.puedeVerReceta(leandro))
	}
*/
}