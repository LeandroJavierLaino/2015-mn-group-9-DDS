package TP2

import org.junit.Test
import testeo.TestInstances
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import org.junit.Assert
import java.util.HashSet
import receta.Receta
import java.util.Set
import procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN

class TestFiltrosYProcesamientoOrdenamiento extends TestInstances {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	@Test
	def void aplicarVariosFiltros(){
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		diego.filtrosAAplicar.add(filtroGusto)
		diego.filtrosAAplicar.add(filtroExceso)
		recetasFiltradas = diego.aplicarFiltros
		Assert.assertArrayEquals(diego.recetas,recetasFiltradas)
	}
	
	@Test
	def void aplicarFiltroUnico(){
		filtroGusto = new FiltroPorGusto
		leandro.comidasQueDisgustan.add(chori)
		leandro.agregarReceta(getRecetaAntiVegano)
		leandro.agregarFiltro(filtroGusto)
		recetasFiltradas = leandro.aplicarFiltros
		Assert.assertNotEquals(recetasFiltradas,leandro.recetas)
	}
	
	@Test
	def void listarTrasFiltrarPorVariosFiltrosYPedirLosDiezPrimeros(){
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		diego.filtrosAAplicar.add(filtroGusto)
		diego.filtrosAAplicar.add(filtroExceso)
		diego.recetasFavoritas.add(getRecetaAntiDiabetico)
		diego.comidasQueDisgustan.add(chori)
		diego.procesamiento = new ProcesamientoParaTomarLosPrimerosN
		recetasFiltradas = diego.postProcesarRecetas
		Assert.assertEquals(1,recetasFiltradas.size)
		
	}
}