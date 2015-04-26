package TP1

import org.junit.Test
import org.junit.Assert
import testeo.TestInstances

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

class TestCondicionesPreexistentes extends TestInstances{
	@Test
	def void Receta1NoAdecuadaParaVegano() {
		Assert.assertFalse(receta1.esRecomendablePara(usrVegano1))
	}

	@Test
	def void Receta2NoAdecuadaParaDiabetico() {
		Assert.assertFalse(receta2.esRecomendablePara(usrDiabetico1))
	}

	@Test
	def void Receta3AdecuadaParaTodosEjVegano() {
		Assert.assertTrue(receta3.esRecomendablePara(usrVegano1))
	}	

	@Test
	def void Receta3AdecuadaParaTodosEjDiabetico() {
		Assert.assertTrue(receta3.esRecomendablePara(usrDiabetico1))
	}
	
	@Test
	def void Receta3AdecuadaParaTodosEjHipertenso() {
		Assert.assertTrue(receta3.esRecomendablePara(usrHipertenso1))
	}
	
	@Test
	def void Receta3AdecuadaParaTodosEjCeliaco() {
		Assert.assertTrue(receta3.esRecomendablePara(usrCeliaco))
	}
}