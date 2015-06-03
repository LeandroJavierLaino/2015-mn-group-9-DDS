package TP2

import org.junit.Assert
import org.junit.Test
import testeo.Grupos

class TestAccesoARecetasPorUsuario extends Grupos {

	@Test
	def void diegoTieneAccesoARecetaAntiDiabetico() {
		
		recetaAntiDiabetico.crearReceta(leandro)
		
		Assert.assertTrue(recetaAntiDiabetico.puedeVerReceta(diego))
		
	}
	@Test
	def void peroNicolasNo() {
		
		recetaAntiDiabetico.crearReceta(leandro)
		
		Assert.assertFalse(recetaAntiDiabetico.puedeVerReceta(nicolas))
		
	}
}
