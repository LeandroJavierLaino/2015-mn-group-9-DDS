package TP1


import org.junit.Assert
import org.junit.Test
import testeo.TestUsers

//Punto 3 CONDICIONES PREEX

	/* 
	Casos de Prueba
	
	Receta con Chori 		-> Vegano		False
	Receta con Azucar(150)	-> Diabetico	False
	Receta sin problemas	-> Vegano		True
	Receta sin problemas	-> Diabetico	True
	Receta sin problemas	-> Hipertenso	True
	Receta sin problemas	-> Celiaco		True
	*/

//Nuevas excepciones modificadas

class TestCondicionesPreexistentes extends TestUsers{
	@Test
	def void Receta1NoAdecuadaParaVegano() {
		Assert.assertFalse(recetaAntiVegano.esRecomendablePara(usrVegano1))
	}

	@Test
	def void Receta2NoAdecuadaParaDiabetico() {
		Assert.assertFalse(recetaAntiDiabetico.esRecomendablePara(usrDiabetico1))
	}

	@Test
	def void Receta3AdecuadaParaTodosEjVegano() {
		Assert.assertTrue(recetaParaCualquiera.esRecomendablePara(usrVegano1))
	}	

	@Test
	def void Receta3AdecuadaParaTodosEjDiabetico() {
		Assert.assertTrue(recetaParaCualquiera.esRecomendablePara(usrDiabetico1))
	}
	
	@Test
	def void Receta3AdecuadaParaTodosEjHipertenso() {
		Assert.assertTrue(recetaParaCualquiera.esRecomendablePara(usrHipertenso1))
	}
	
	@Test
	def void Receta3AdecuadaParaTodosEjCeliaco() {
		Assert.assertTrue(recetaParaCualquiera.esRecomendablePara(usrCeliaco))
	}
}