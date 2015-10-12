package TP1

import org.junit.Assert
import org.junit.Test
import ar.edu.domain.excepcion.UsuarioInvalidoExcepcion
import testeo.UsuariosExtras


//Punto 2 IMC

	/* 
	Casos de Prueba
	
	IMC con Peso y Altura correctos		Equals	(x5)
	IMC con Altura = 0					UsuarioInvalidoExcepcion
	IMC con Peso = 0					UsuarioInvalidoExcepcion
	*/

//Nuevas excepciones modificadas

class TestIMC extends UsuariosExtras{

	@Test
	def void leandroCalculaSuIMC() {
		/** Cuando usamos un assertEquals para un float o un double se tiene que tener en cuenta un tercer parametro que es el delta. */
		Assert.assertEquals(23.1206235962, leandro.calculaIMC, delta)
	}

	@Test
	def void eriCalculaSuIMC() {
		Assert.assertEquals(25.9695290859, eri.calculaIMC, delta)
	}

	@Test
	def void diegoCalculaSuIMC() {
		Assert.assertEquals(22.4913494809, diego.calculaIMC, delta)
	}

	@Test
	def void nicolasCalculaSuIMC() {
		Assert.assertEquals(19.8176773682, nicolas.calculaIMC, delta)
	}

	@Test
	def void pabloCalculaSuIMC() {
		Assert.assertEquals(22.4712087637, pablo.calculaIMC, delta)
	}

	@Test (expected=typeof(UsuarioInvalidoExcepcion)) //sin altura
	def void usrInval3CalculaSuIMC() {
		getUsuarioSinAltura.validar
		getUsuarioSinAltura.calculaIMC
	}

	@Test(expected=typeof(UsuarioInvalidoExcepcion)) //sin peso
	def void usrInval4CalculaSuIMC() {
		getUsuarioSinPeso.validar
		getUsuarioSinPeso.calculaIMC
	}
}