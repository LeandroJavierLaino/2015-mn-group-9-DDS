package TP1

import excepcion.BusinessException
import org.junit.Test
import testeo.TestInstances

//Punto 4 MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Modifica Receta Propia					Good
	Usuario Modifica Receta Ajena					BusinessException
	Usuario Modifica Receta y no da Nombre			BusinessException 
	*/

class TestModificarRecetas extends TestInstances{
	
		@Test
	def void leandroModificaReceta2() {
		receta2.modificarReceta(leandro,receta1)
	}

		@Test(expected=typeof(BusinessException)) //no Tiene Permitido Modificar
	def void leandroModificaReceta3() {
		receta3.modificarReceta(leandro,receta1)
	}
	
		
}