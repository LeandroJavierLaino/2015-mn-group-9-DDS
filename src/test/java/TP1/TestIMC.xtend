package TP1

import excepcion.BusinessException
import excepcion.ExcepcionUsuario
import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

//Punto 2 IMC

	/* 
	Casos de Prueba
	
	IMC con Peso y Altura correctos		Equals	(x5)
	IMC con Altura = 0					BusinessException
	IMC con Peso = 0					BusinessException
	*/

class TestIMC extends TestInstances{

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

	@Test (expected=typeof(BusinessException)) //sin altura
	def void usrInval3CalculaSuIMC() {
		usrInval3.validar
		usrInval3.calculaIMC
	}

	@Test(expected=typeof(BusinessException)) //sin peso
	def void usrInval4CalculaSuIMC() {
		usrInval4.validar
		usrInval4.calculaIMC
	}
}