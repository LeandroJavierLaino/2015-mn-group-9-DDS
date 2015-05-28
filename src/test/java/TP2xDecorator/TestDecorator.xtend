package TP2xDecorator


import org.junit.Assert
import org.junit.Test
import testeo.TestInstances

class TestDecorator extends TestInstances{
	
	@Test
	def void filtroBasico() {
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		filtroPos.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetas1 , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void filtroConCondic() {
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		filtroCond.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)//se espera que no devuelva la misma lista
	}
	
	@Test
	def void filtroConCondicySobrep() {
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3)
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)//se espera que no devuelva la misma lista
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
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		postProcesoPosta.postProcesar(filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3))//el postProceso tiene que recibir una lista pero hay que cambiar algo para que reciba un List en ves de un Set.
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrep() {
		usrDiabetico3.recetas = listaRecetas1.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas1
		postProcesoOrdenadoCalor.postProcesar(filtroSobrep.filtrar(usrDiabetico3.recetasPorFiltros,usrDiabetico3))
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesOrdenadoCalorYfiltroConCondicySobrepDadoVuelta() {
	//	usrDiabetico3.postProceso = postProcesoOrdenadoCalor
	//	usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas3.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas3
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
	
	
	@Test
	def void postProcesResultParesYfiltroConCondicySobrep() {
	//	usrDiabetico3.postProceso = postProcesoResultadosPares
	//	usrDiabetico3.filtro = filtroSobrep
		usrDiabetico3.recetas = listaRecetas4.toSet
		usrDiabetico3.recetasPorFiltros = listaRecetas4
		Assert.assertArrayEquals(listaRecetas2 , usrDiabetico3.recetasPorFiltros)
	}
}