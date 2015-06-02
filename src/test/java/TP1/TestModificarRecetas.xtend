package TP1

import excepcion.SinPermisosExcepcion
import org.junit.Test
import testeo.TestUsers

//Punto 4 MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Modifica Receta Propia					Good
	Usuario Modifica Receta Ajena					SinPermisosExcepcion
	Usuario Modifica Receta y no da Nombre			RecetaInvalidaExcepcion 
	*/

//Nuevas excepciones modificadas

class TestModificarRecetas extends TestUsers{
	
		@Test
	def void leandroModificaReceta2() {
		recetaAntiDiabetico.modificarReceta(leandro,recetaAntiVegano)
	}

		@Test(expected=typeof(SinPermisosExcepcion)) //no Tiene Permitido Modificar
	def void leandroModificaReceta3() {
		recetaParaCualquiera.modificarReceta(leandro,recetaAntiVegano)
	}
	
}