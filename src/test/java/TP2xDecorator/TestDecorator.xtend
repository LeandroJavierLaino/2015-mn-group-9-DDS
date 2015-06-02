package TP2xDecorator


import org.junit.Assert
import org.junit.Test
import testeo.TestFiltersAndPostProc

class TestDecorator extends TestFiltersAndPostProc{
	
	
	
	@Test
	def void filtroBasico() {
		usrDiabetico3.filtro = filtroPos
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetasTriple, usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondic() {
		usrDiabetico3.filtro = filtroCond
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondicySobrep() {
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
	
	
/*	@Test
	def void filtroConCondicySobrepNoCumple() {
		usrInval2.filtro = filtroSobrep
		usrInval2.recetas = listaRecetasTriple.toSet
		usrInval2.recetasPorFiltros = listaRecetasTriple
		usrInval2.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrInval2.recetasPorFiltros)
	}*/
	
	@Test
	def void postProcesPostaYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoPosta
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoOrdenadoCalor
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrepDadoVuelta() {
		usrDiabetico3.postProceso = postProcesoOrdenadoCalor
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasCualquieraYDiabetico.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasCualquieraYDiabetico
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetasDiabeticoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesResultParesYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoResultadosPares
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasVeganoYDobleCualquiera.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasVeganoYDobleCualquiera
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)
	}
}