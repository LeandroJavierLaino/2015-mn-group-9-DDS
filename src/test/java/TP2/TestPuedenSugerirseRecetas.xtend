package TP2

import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

class TestPuedenSugerirseRecetas extends TestInstances{
	
	@Test
	def void puedeSugerirseRecetaAntiVeganoADiego(){
		Assert.assertTrue(repo.puedeSugerirseAUsuario(diego,getRecetaAntiVegano))
	}
	
	@Test
	def void noPuedeSugerirseRecetaAntiVeganoANicolas(){
		Assert.assertFalse(repo.puedeSugerirseAUsuario(nicolas,getRecetaAntiVegano))
	}
	
	@Test
	def void noPuedeSugerirseRecetaAntiVeganoAGrupoFlojito(){
		Assert.assertFalse(repo.puedeSugerirseAGrupo(grupoFlojito,getRecetaAntiVegano))
	}
	
	@Test
	def void puedeSugerirseRecetaAntiveganoAGrupoDeLaMuertePorqueLeGustanLasCebollas(){
		Assert.assertTrue(repo.puedeSugerirseAGrupo(grupoDeLaMuerte,getRecetaAntiVegano))
	}
}