package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

//Punto 2 RUTINA SALUDABLE

class TestRutinaSaludable extends TestInstances{
	@Test
	def void leandroSigueUnaRutinaSaludable() {
		Assert.assertTrue(leandro.sigueUnaRutinaSaludable())
	}

	@Test
	def void erikaSigueUnaRutinaSaludable() {
		Assert.assertTrue(eri.sigueUnaRutinaSaludable())
	}

	@Test
	def void diegoSigueUnaRutinaSaludable() {
		Assert.assertTrue(diego.sigueUnaRutinaSaludable())
	}

	@Test
	def void nicolasSigueUnaRutinaSaludable() {
		Assert.assertTrue(nicolas.sigueUnaRutinaSaludable())
	}

	@Test
	def void pabloSigueUnaRutinaSaludable() {
		Assert.assertTrue(pablo.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrInval2SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrInval2.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrVeganoNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrVegano1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrHipertenso2NoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrHipertenso2.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrDiabetico1SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrDiabetico2SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico2.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrCeliacoSigueUnaRutinaSaludable() {
		Assert.assertTrue(usrCeliaco.sigueUnaRutinaSaludable())
	}
}