package TP1

import org.junit.Assert
import org.junit.Test
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
	def void UsuarioFechaFuturaEIMCMenorA18SigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioFechaFuturaEIMCMenorA18.sigueUnaRutinaSaludable())
	}
	
	@Test	//el IMC le da fuera de rango (>30)
	def void UsuarioNombreCortoEIMCMayorA30SigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioNombreCortoEIMCMayorA30.sigueUnaRutinaSaludable())
	}

	@Test	//No le gusta la Fruta para Vegano
	def void VeganoCaretaNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioVeganoLeGustaPolloYNoLaFruta.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void UsuarioVeganoValidoYLeGustaLaFrutaSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioVeganoValidoYLeGustaLaFruta.sigueUnaRutinaSaludable())
	}

	@Test
	def void UsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicioSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio.sigueUnaRutinaSaludable())
	}
	
	@Test	//Rutina Activa de Poco Ejercicio para Hipertenso
	def void UsuarioHipertensoValidoConRutinaActivaYSinEjercicioNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioHipertensoValidoConRutinaActivaYSinEjercicio.sigueUnaRutinaSaludable())
	}
	
	@Test	//Rutina Sedentaria para Hipertenso
	def void UsuarioHipertensoValidoConRutinaSedentariaNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioHipertensoValidoConRutinaSedentaria.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void UsuarioDiabeticoSinSexoMasDe70KgYActivoSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioDiabeticoSinSexoMasDe70KgYActivo.sigueUnaRutinaSaludable())
	}

	@Test
	def void UsuarioDiabeticoSinPreferenciaMenosDe70KgYActivoSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo.sigueUnaRutinaSaludable())
	}
	
	@Test	//No tiene rutina Activa y pesa mas de 70kg para Diabetico
	def void UsuarioDiabeticoValidoMasDe70KgYSedentarioSigueUnaRutinaSaludable() {
		Assert.assertFalse(getUsuarioDiabeticoValidoMasDe70KgYSedentario.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void UsuarioDiabeticoValidoMenosDe70KgYSedentarioSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioDiabeticoValidoMenosDe70KgYSedentario.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void UsuarioCeliacoValidoSigueUnaRutinaSaludable() {
		Assert.assertTrue(getUsuarioCeliacoValido.sigueUnaRutinaSaludable())
	}
}