package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import testeo.TestInstances

//Punto 1 VALIDEZ
	//testeados sin datos, nombre corto, sin altura, sin peso, fecha futura, sin rutina
	// sin sexo (valido)

class TestValidez extends TestInstances{

	@Test
	def void eriEsUnUsuarioValido() {
		eri.validar
	}

 @Test
	def void diegoEsUnUsuarioValido() {
		diego.validar
	}

	@Test
	def void nicolasEsUnUsuarioValido() {
		nicolas.validar
	}

	@Test
	def void pabloEsUnUsuarioValido() {
		pablo.validar
	}

	@Test
	def void leandroEsUnUsuarioValido() {
		leandro.validar
	}

	@Test
	def void usrValid1EsUnUsuarioValidoSinSexo() {
		usrValid1.validar
	}

	@Test(expected=typeof(BusinessException))
	def void usrInvalido1NoValidoFaltanDatos() {
		usrInval1.validar
	}

	@Test(expected=typeof(BusinessException))
	def void usrInvalido2NoValidoNombreCorto() {
		usrInval2.validar
	}

	@Test(expected=typeof(BusinessException))
	def void usrInvalido3NoValidoSinAltura() {
		usrInval3.validar
	}

	@Test(expected=typeof(BusinessException))
	def void usrInvalido4NoValidoSinPeso() {
		usrInval4.validar
	}

	@Test(expected=typeof(BusinessException))
	def void usrInvalido5NoValidoFechaFutura() {
		usrInval5.validar
	}

	@Test
	def void usrVeganoUnoValidoPorGustos() {
		usrVegano1.validar
	}

	@Test
	def void usrVeganoDosValido() {
		usrVegano2.validar
	}

	@Test(expected=typeof(ExcepcionUsuario))
	def void usrHipertensoUnoNoValidoPorGustos() {
		usrHipertenso1.validar
	}

	@Test
	def void usrHipertensoDosValido() {
		usrHipertenso2.validar
	}

	@Test(expected=typeof(ExcepcionUsuario))
	def void usrDiabeticoUnoNoValidoSinSexo() {
		usrDiabetico1.validar
	}

	@Test(expected=typeof(ExcepcionUsuario))
	def void usrDiabeticoDosNoValidoPorGustos() {
		usrDiabetico2.validar
	}

	@Test
	def void usrDiabeticoTresValido() {
		usrDiabetico3.validar
	}

	@Test
	def void usrCeliacoValido() {
		usrCeliaco.validar
	}
}