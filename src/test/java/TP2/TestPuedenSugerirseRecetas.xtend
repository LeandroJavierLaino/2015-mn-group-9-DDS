package TP2

import org.junit.Test
import org.junit.Assert
import testeo.Grupos

class TestPuedenSugerirseRecetas extends Grupos{
	
	@Test
	def void puedeSugerirseRecetaAntiVeganoADiego(){
		Assert.assertTrue(diego.puedeSerSugeridaUnaReceta(getRecetaAntiVegano))
	}
	
	@Test
	def void noPuedeSugerirseRecetaAntiVeganoANicolas(){
		Assert.assertFalse(nicolas.puedeSerSugeridaUnaReceta(getRecetaAntiVegano))
	}
	
	@Test
	def void noPuedeSugerirseRecetaAntiVeganoAGrupoFlojito(){
		Assert.assertFalse(grupoFlojito.puedeSerSugeridaRecetaAlGrupo(getRecetaAntiVegano))
	}
	
	@Test
	def void puedeSugerirseRecetaAntiveganoAGrupoDeLaMuertePorqueLeGustanLasCebollas(){
		Assert.assertTrue(grupoDeLaMuerte.puedeSerSugeridaRecetaAlGrupo(getRecetaAntiVegano))
	}
}