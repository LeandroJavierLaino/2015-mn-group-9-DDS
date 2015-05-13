package TP2

import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

class TestPuedenSugerirseRecetas extends TestInstances{
	
	@Test
	def void puedeSugerirseRecetaUnoADiego(){
		Assert.assertTrue(repo.puedeSugerirseAUsuario(diego,receta1))
	}
	
	@Test
	def void noPuedeSugerirseRecetaUnoANicolas(){
		Assert.assertFalse(repo.puedeSugerirseAUsuario(nicolas,receta1))
	}
	
	@Test
	def void noPuedeSugerirseRecetaUnoAGrupoFlojito(){
		Assert.assertFalse(repo.puedeSugerirseAGrupo(grupoFlojito,receta1))
	}
	
	@Test
	def void puedeSugerirseRecetaUnoAGrupoDeLaMuertePorqueLeGustanLasCebollas(){
		Assert.assertTrue(repo.puedeSugerirseAGrupo(grupoDeLaMuerte,receta1))
	}
}