package TP2xDecorator

import java.util.List
import org.junit.Assert
import org.junit.Test
import receta.Receta
import testeo.TestFiltersAndPostProc

//Tests del Decorator

	/* 
	Casos de Prueba
	
	Lista de Recetas								Filtro/PostProceso						Resultado
	[antiVegano, antiDiabetico, paraCualquiera] 	filtroPosta	   							devuelve la misma lista
	[antiVegano, antiDiabetico, paraCualquiera]		filtroCondicionPreex					quita el antiDiabetico
	[antiVegano, antiDiabetico, paraCualquiera]		filtroSobrepeso							quita el antiDiabetico
	[antiVegano, antiDiabetico, paraCualquiera]		filtroSobrepeso/postProcesoPosta		solo filtra al antiDiabetico
	[antiVegano, antiDiabetico, paraCualquiera]		filtroSobrepeso/postProcesoCalorias		filtra al antiDiabetico y ordena por calorias (igual)
	[paraCualquiera, antiVegano]					filtroSobrepeso/postProcesoCalorias		ordena por calorias (dado vuelta)
	[antiVegano, paraCualquiera, paraCualquiera]	filtroSobrepeso/postProcesoPosta		filtra y no postProcesa
	[antiVegano, paraCualquiera, paraCualquiera]	filtroSobrepeso/postProcesoResultPares	quita a los resultados pares (paraCualquiera)
	*/


class TestDecorator extends TestFiltersAndPostProc{
	
	@Test
	def void filtroBasico() { //No filtra nada, es el filtro Posta
		var List<Receta> result = filtroPosta.filtrar(listaRecetasVeganoDiabeticoYCualquiera, usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoDiabeticoYCualquiera , result)
		
	
	}
	
	@Test
	def void filtroConCondicionesPreex() { //Al ser un user diabetico filtra la receta antiDiabetico
		var List<Receta> result = filtroCondicionPreex.filtrar(listaRecetasVeganoDiabeticoYCualquiera, usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera, result)
	}
	
	@Test
	def void filtroConCondicionesPreexYSobrepeso() { //Al ser un user diabetico filtra la receta antiDiabetico
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasVeganoDiabeticoYCualquiera,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , result)
	}
	
	
	@Test
	def void postProcesPostaYfiltroConCondicionesPreexYSobrepeso() { //Solo lo filtra, no PostProcesa, es el postProcesoPosta
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasVeganoDiabeticoYCualquiera,usrDiabetico3)
		result = postProcesoPosta.postProcesar(result)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , result)
}
	
	@Test
	def void postProcesOrdenadoCaloriasYfiltroConCondicionesPreexYSobrepeso() { //Filtra y luego ordena por calorias minimas (igual)
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasVeganoDiabeticoYCualquiera,usrDiabetico3)
		result = postProcesoOrdenadoCalorias.postProcesar(result)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , result)
	}
	
	
	@Test
	def void postProcesOrdenadoCaloriasYfiltroConCondicionesPreexYSobrepesoDadoVuelta() { //Filtra y ordena por calorias minimas (dado vuelta)
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasCualquieraYVegano,usrDiabetico3)
		result = postProcesoOrdenadoCalorias.postProcesar(result)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , result)
	}
	
	@Test
	def void postProcesPostaInutilYfiltroConCondicionesPreexYSobrepeso() { //Filtra por Condicion y Sobrepeso y postProcesoPosta no hace nada
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasVeganoYDobleCualquiera,usrDiabetico3)
		result = postProcesoPosta.postProcesar(result)
		Assert.assertArrayEquals(listaRecetasVeganoYDobleCualquiera , result)
	}
	
	@Test
	def void postProcesResultParesYfiltroConCondicionesPreexYSobrepeso() { //Filtra y quita de la lista los resultados Pares
		var List<Receta> result = filtroSobrepeso.filtrar(listaRecetasVeganoYDobleCualquiera,usrDiabetico3)
		result = postProcesoResultadosPares.postProcesar(result)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , result)
	}
}
