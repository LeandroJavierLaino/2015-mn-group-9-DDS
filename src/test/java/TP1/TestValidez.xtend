package TP1

import excepcion.CondPreexistenteExcepcion
import org.junit.Test
import testeo.TestInstances
import excepcion.UsuarioInvalidoExcepcion

//Punto 1 VALIDEZ

	/* 
	Casos de Prueba
	
	Usuario con Nombre, Altura, Peso, FechaPasada y Rutina			Good	(x5)
	Usuario con Nombre, Altura, Peso, FechaPasada y Rutina s/Sexo	Good
	Usuarios sin Nombre, Altura, Peso, FechaPasada o Rutina			UsuarioInvalidoExcepcion
	Usuario con Nombre <4 digitos									UsuarioInvalidoExcepcion
	Usuario con Altura = 0											UsuarioInvalidoExcepcion
	Usuario con Peso = 0											UsuarioInvalidoExcepcion
	Usuario con FechaFutura											UsuarioInvalidoExcepcion
	Usuario Vegano con gustos: Pollo								CondPreexistenteExcepcion
	Usuario Vegano con gustos: Fruta								Good
	Usuario Hipertenso sin gustos									CondPreexistenteExcepcion
	Usuario Hipertenso con gustos									Good
	Usuario Diabetico sin Sexo										CondPreexistenteExcepcion
	Usuario Diabetico sin gustos									CondPreexistenteExcepcion
	Usuario Diabetico con Sexo y gustos								Good
	Usuario Celiaco													Good
	*/

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

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //solo tiene Nombre
	def void usrInvalido1NoValidoFaltanDatos() {
		usrInval1.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Nombre <4 digitos
	def void usrInvalido2NoValidoNombreCorto() {
		usrInval2.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Altura =0
	def void usrInvalido3NoValidoSinAltura() {
		usrInval3.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Peso = 0
	def void usrInvalido4NoValidoSinPeso() {
		usrInval4.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Fecha futura
	def void usrInvalido5NoValidoFechaFutura() {
		usrInval5.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //le gusta el pollo
	def void usrVeganoUnoNoValidoPorGustos() {
		usrVegano1.validar
	}

	@Test
	def void usrVeganoDosValido() {
		usrVegano2.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //sin Preferencias
	def void usrHipertensoUnoNoValidoPorGustos() {
		usrHipertenso1.validar
	}

	@Test
	def void usrHipertensoDosValido() {
		usrHipertenso2.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //sin Sexo
	def void usrDiabeticoUnoNoValidoSinSexo() {
		usrDiabetico1.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //sin Preferencias
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