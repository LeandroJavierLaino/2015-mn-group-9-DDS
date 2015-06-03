package TP2xDecorator


import org.junit.Assert
import org.junit.Test
import testeo.TestFiltersAndPostProc

class TestDecorator extends TestFiltersAndPostProc{
	
	
	
	@Test
	def void filtroBasico() {
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		filtroPos.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasTriple , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondic() {
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		filtroCond.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)//se espera que no devuelva la misma lista
	}
	
	@Test
	def void filtroConCondicySobrep() {
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , usrDiabetico3.recetasPorFiltros)//se espera que no devuelva la misma lista
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
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)//el postProceso tiene que recibir una lista pero hay que cambiar algo para que reciba un List en ves de un Set.
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , postProcesoPosta.postProcesar(usrDiabetico3.recetasPorFiltros))
}
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrep() {
		usrDiabetico3.recetas = listaRecetasTriple.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasTriple
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , postProcesoOrdenadoCalor.postProcesar(usrDiabetico3.recetasPorFiltros))
	}
	
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrepDadoVuelta() {
	//	usrDiabetico3.postProceso = postProcesoOrdenadoCalor
	//	usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasCualquieraYVegano.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasCualquieraYVegano
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , postProcesoOrdenadoCalor.postProcesar(usrDiabetico3.recetasPorFiltros))
	}
	
	
	@Test
	def void postProcesResultParesYfiltroConCondicySobrep() {
	//	usrDiabetico3.postProceso = postProcesoResultadosPares
	//	usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetasVeganoYDobleCualquiera.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetasVeganoYDobleCualquiera
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetasVeganoYCualquiera , postProcesoResultadosPares.postProcesar(usrDiabetico3.recetasPorFiltros))
	}
}
