package TP1

import org.junit.Assert
import org.junit.Test
import testeo.TestUsers

//Punto 4 PUEDE VER/MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Ve/Modifica Receta Propia				True
	Usuario Ve/Modifica Receta Ajena				False
	Usuario Ve/Modifica Receta Propia				True
	*/

//Nuevas excepciones modificadas

class TestPuedeVerOModificarRecetas extends TestUsers{
	
	@Test
	def void leandroPuedeVerRecetaLean() {
		Assert.assertTrue(recetaAntiDiabetico.puedeVerReceta(leandro))
	}

	@Test
	def void eriNoPuedeVerRecetaLean() {
		Assert.assertFalse(recetaAntiDiabetico.puedeVerReceta(eri))
	}


/*	TODO: No se cumple este caso
	@Test
	def void leandroPuedeVerReceta1() {
		Assert.assertTrue(recetaAntiVegano.puedeVerReceta(leandro))
	}
*/
}