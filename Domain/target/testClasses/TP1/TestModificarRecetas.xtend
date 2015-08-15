package TP1

import excepcion.SinPermisosExcepcion
import org.junit.Test
import testeo.Grupos

//Punto 4 MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Modifica Receta Propia					Good
	Usuario Modifica Receta Ajena					SinPermisosExcepcion
	Usuario Modifica Receta y no da Nombre			RecetaInvalidaExcepcion 
	*/

//Nuevas excepciones modificadas

class TestModificarRecetas extends Grupos{
	
		@Test
	def void leandroModificaRecetaAntiVegano() {
		getRecetaAntiDiabetico.modificarReceta(leandro,getRecetaAntiVegano)
	}

		@Test(expected=typeof(SinPermisosExcepcion)) //no Tiene Permitido Modificar
	def void leandroModificaRecetaParaCualquiera() {
		getRecetaParaCualquiera.modificarReceta(leandro,getRecetaAntiVegano)
	}
	
}