package TP1

import org.junit.Assert
import org.junit.Test
import testeo.UsuariosExtras
import org.junit.Before

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

class TestCondicionesPreexistentes extends UsuariosExtras{
	
	@Before
	override init() {
		super.init
		
		usuarioVeganoLeGustaPolloYNoLaFruta.comidaPreferida.add("Pollo")
		usuarioVeganoLeGustaPolloYNoLaFruta.agregarCondicion(vegano)
	}
	@Test
	def void RecetaAntiveganoNoAdecuadaParaVegano() {
		Assert.assertFalse(getRecetaAntiVegano.esRecomendablePara(getUsuarioVeganoLeGustaPolloYNoLaFruta))
	}

	@Test
	def void RecetaAntiDiabeticoNoAdecuadaParaDiabetico() {
		Assert.assertFalse(getRecetaAntiDiabetico.esRecomendablePara(getUsuarioDiabeticoSinSexoMasDe70KgYActivo))
	}

	@Test
	def void RecetaParaCualquieraAdecuadaParaVeganoCareta() {
		Assert.assertTrue(getRecetaParaCualquiera.esRecomendablePara(getUsuarioVeganoLeGustaPolloYNoLaFruta))
	}	

	@Test
	def void RecetaParaCualquieraAdecuadaParaDiabetico() {
		Assert.assertTrue(getRecetaParaCualquiera.esRecomendablePara(getUsuarioDiabeticoSinSexoMasDe70KgYActivo))
	}
	
	@Test
	def void RecetaParaCualquieraAdecuadaParaHipertenso() {
		Assert.assertTrue(getRecetaParaCualquiera.esRecomendablePara(getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio))
	}
	
	@Test
	def void RecetaParaCualquieraAdecuadaParaCeliaco() {
		Assert.assertTrue(getRecetaParaCualquiera.esRecomendablePara(getUsuarioCeliacoValido))
	}
}