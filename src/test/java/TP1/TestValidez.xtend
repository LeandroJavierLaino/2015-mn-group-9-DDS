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


//Nuevas excepciones modificadas

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
	def void UsuarioSinSexoEsUnUsuarioValidoSinSexo() {
		getUsuarioSinSexo.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //solo tiene Nombre
	def void UsuarioSinDatosNoValidoFaltanDatos() {
		getUsuarioSinDatos.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Nombre <4 digitos
	def void UsuarioNombreCortoEIMCMayorA30NoValidoNombreCorto() {
		getUsuarioNombreCortoEIMCMayorA30.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Altura =0
	def void UsuarioSinAlturaNoValidoSinAltura() {
		getUsuarioSinAltura.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Peso = 0
	def void UsuarioSinPesoNoValidoSinPeso() {
		getUsuarioSinPeso.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //Fecha futura
	def void UsuarioFechaFuturaEIMCMenorA18NoValidoFechaFutura() {
		getUsuarioFechaFuturaEIMCMenorA18.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //le gusta el pollo
	def void VeganoCaretaUnoNoValidoPorGustos() {
		getUsuarioVeganoLeGustaPolloYNoLaFruta.validar
	}

	@Test
	def void UsuarioVeganoValidoYLeGustaLaFrutaValido() {
		getUsuarioVeganoValidoYLeGustaLaFruta.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //sin Preferencias
	def void UsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicioNoValidoPorGustos() {
		getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio.validar
	}

	@Test
	def void UsuarioHipertensoValidoConRutinaActivaYSinEjercicioValido() {
		getUsuarioHipertensoValidoConRutinaActivaYSinEjercicio.validar
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //sin Sexo
	def void UsuarioDiabeticoSinSexoMasDe70KgYActivoNoValido() {
		getUsuarioDiabeticoSinSexoMasDe70KgYActivo.validar
	}

	@Test(expected=typeof(CondPreexistenteExcepcion)) //sin Preferencias
	def void UsuarioDiabeticoSinPreferenciaMenosDe70KgYActivoNoValidoPorGustos() {
		getUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo.validar
	}

	@Test
	def void UsuarioDiabeticoValidoMasDe70KgYSedentarioValido() {
		getUsuarioDiabeticoValidoMasDe70KgYSedentario.validar
	}

	@Test
	def void usrCeliacoValido() {
		getUsuarioCeliacoValido.validar
	}
}