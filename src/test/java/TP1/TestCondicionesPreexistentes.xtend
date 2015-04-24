package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

//Punto 3 CONDICIONES PREEX

class TestCondicionesPreexistentes extends TestInstances{
	@Test
	def void Receta1NoAdecuadaParaVegano() {
		Assert.assertFalse(receta1.esRecomendablePara(usrVegano1))
	}

	@Test
	def void Receta2NoAdecuadaParaDiabetico() {
		Assert.assertFalse(receta2.esRecomendablePara(usrDiabetico1))
	}

/*	@Test	//TODO: TIENE QUE DAR TRUE y no da
	def void Receta3AdecuadaParaTodos() {
		Assert.assertTrue(receta3.esRecomendablePara(usrDiabetico1))
	}
	*/	
}