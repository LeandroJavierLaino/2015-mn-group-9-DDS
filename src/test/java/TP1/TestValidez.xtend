package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import testeo.TestInstances

//Punto 1 VALIDEZ

	/* 
	Casos de Prueba
	
	Usuario con Nombre, Altura, Peso, FechaPasada y Rutina			Good	(x5)
	Usuario con Nombre, Altura, Peso, FechaPasada y Rutina s/Sexo	Good
	Usuarios sin Nombre, Altura, Peso, FechaPasada o Rutina			BusinessException
	Usuario con Nombre <4 digitos									BusinessException
	Usuario con Altura = 0											BusinessException
	Usuario con Peso = 0											BusinessException
	Usuario con FechaFutura											BusinessException
	Usuario Vegano con gustos: Pollo								BusinessException
	Usuario Vegano con gustos: Fruta								Good
	Usuario Hipertenso sin gustos									BusinessException
	Usuario Hipertenso con gustos									Good
	Usuario Diabetico sin Sexo										BusinessException
	Usuario Diabetico sin gustos									BusinessException
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

	@Test(expected=typeof(BusinessException)) //solo tiene Nombre
	def void usrInvalido1NoValidoFaltanDatos() {
		usrInval1.validar
	}

	@Test(expected=typeof(BusinessException)) //Nombre <4 digitos
	def void usrInvalido2NoValidoNombreCorto() {
		usrInval2.validar
	}

	@Test(expected=typeof(BusinessException)) //Altura =0
	def void usrInvalido3NoValidoSinAltura() {
		usrInval3.validar
	}

	@Test(expected=typeof(BusinessException)) //Peso = 0
	def void usrInvalido4NoValidoSinPeso() {
		usrInval4.validar
	}

	@Test(expected=typeof(BusinessException)) //Fecha futura
	def void usrInvalido5NoValidoFechaFutura() {
		usrInval5.validar
	}

	@Test(expected=typeof(BusinessException)) //le gusta el pollo
	def void usrVeganoUnoNoValidoPorGustos() {
		usrVegano1.validar
	}

	@Test
	def void usrVeganoDosValido() {
		usrVegano2.validar
	}

	@Test(expected=typeof(ExcepcionUsuario)) //sin Preferencias
	def void usrHipertensoUnoNoValidoPorGustos() {
		usrHipertenso1.validar
	}

	@Test
	def void usrHipertensoDosValido() {
		usrHipertenso2.validar
	}

	@Test(expected=typeof(ExcepcionUsuario)) //sin Sexo
	def void usrDiabeticoUnoNoValidoSinSexo() {
		usrDiabetico1.validar
	}

	@Test(expected=typeof(ExcepcionUsuario)) //sin Preferencias
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