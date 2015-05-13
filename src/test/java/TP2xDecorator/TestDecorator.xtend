package TP2xDecorator


import org.junit.Assert
import org.junit.Test
import testeo.TestInstances

class TestDecorator extends TestInstances{
	
	@Test
	def void filtroBasico() {
		usrDiabetico3.filtro = filtroPos
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetas1 , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondic() {
		usrDiabetico3.filtro = filtroCond
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondicySobrep() {
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		usrDiabetico3.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	
/*	@Test
	def void filtroConCondicySobrepNoCumple() {
		usrInval2.filtro = filtroSobrep
		usrInval2.recetas = listaRecetas1.toSet
		usrInval2.recetasPorFiltros = listaRecetas1
		usrInval2.filtrarRecetas()
		Assert.assertArrayEquals(listaRecetas2 , usrInval2.recetasPorFiltros)
	}*/
	
	@Test
	def void postProcesPostaYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoPosta
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoOrdenadoCalor
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrepDadoVuelta() {
		usrDiabetico3.postProceso = postProcesoOrdenadoCalor
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas3.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas3
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesResultParesYfiltroConCondicySobrep() {
		usrDiabetico3.postProceso = postProcesoResultadosPares
		usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas4.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas4
		usrDiabetico3.filtrarRecetas()
		usrDiabetico3.postProcesar()
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
}