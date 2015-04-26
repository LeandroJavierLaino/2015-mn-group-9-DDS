package TP1

import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

//Punto 2 RUTINA SALUDABLE

	/* 
	Casos de Prueba
	
	Usuario con 18<IMC<30 y sin Condiciones		True	(x5)
	Usuario con IMC<18							False
	Usuario con 30<IMC							False
	Usuario Vegano sin Fruta					False
	Usuario Vegano con Fruta					True
	Usuario Hipertenso Rutina Activa intensiva	True
	Usuario Hipertenso Rutina Activa leve		False
	Usuario Hipertenso Rutina Sedentaria		False
	Usuario Diabetico Rutina Activa >70kg		True
	Usuario Diabetico Rutina Activa <70gk		True
	Usuario Diabetico Rutina Sedentaria >70kg	False
	Usuario Diabetico Rutina Sedentaria <70kg	True
	Usuario Celiaco								True
	*/

//Nuevas excepciones modificadas	

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

	@Test	//el IMC le da fuera de rango (<18)
	def void usrInval5SigueUnaRutinaSaludable() {
		Assert.assertFalse(usrInval5.sigueUnaRutinaSaludable())
	}
	
	@Test	//el IMC le da fuera de rango (>30)
	def void usrInval2SigueUnaRutinaSaludable() {
		Assert.assertFalse(usrInval2.sigueUnaRutinaSaludable())
	}

	@Test	//No le gusta la Fruta para Vegano
	def void usrVeganoNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrVegano1.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrVeganoSigueUnaRutinaSaludable() {
		Assert.assertTrue(usrVegano2.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrHipertenso1SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrHipertenso1.sigueUnaRutinaSaludable())
	}
	
	@Test	//Rutina Activa de Poco Ejercicio para Hipertenso
	def void usrHipertenso2NoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrHipertenso2.sigueUnaRutinaSaludable())
	}
	
	@Test	//Rutina Sedentaria para Hipertenso
	def void usrHipertenso3NoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrHipertenso3.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico1SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrDiabetico2SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico2.sigueUnaRutinaSaludable())
	}
	
	@Test	//No tiene rutina Activa y pesa mas de 70kg para Diabetico
	def void usrDiabetico3SigueUnaRutinaSaludable() {
		Assert.assertFalse(usrDiabetico3.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico4SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico4.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrCeliacoSigueUnaRutinaSaludable() {
		Assert.assertTrue(usrCeliaco.sigueUnaRutinaSaludable())
	}
}