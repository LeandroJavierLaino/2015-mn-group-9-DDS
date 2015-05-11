package TP1

import excepcion.SinPermisosExcepcion
import org.junit.Test
import testeo.TestInstances

//Punto 4 MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Modifica Receta Propia					Good
	Usuario Modifica Receta Ajena					SinPermisosExcepcion
	Usuario Modifica Receta y no da Nombre			RecetaInvalidaExcepcion 
	*/

//Nuevas excepciones modificadas

class TestModificarRecetas extends TestInstances{
	
		@Test
	def void leandroModificaReceta2() {
		receta2.modificarReceta(leandro,receta1)
	}

		@Test(expected=typeof(SinPermisosExcepcion)) //no Tiene Permitido Modificar
	def void leandroModificaReceta3() {
		receta3.modificarReceta(leandro,receta1)
	}
	
}