package TP2

import org.junit.Test
import testeo.UsuariosPrincipales
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import java.util.HashSet
import receta.Receta
import java.util.Set
import org.junit.Assert

class TestFiltros extends UsuariosPrincipales {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	@Test
	def void aplicarVariosFiltros(){
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		eri.filtrosAAplicar.add(filtroGusto)
		eri.filtrosAAplicar.add(filtroExceso)
		recetasFiltradas = eri.aplicarFiltros
		Assert.assertNotEquals(eri.recetas,recetasFiltradas)
	}
	
	@Test
	def void aplicarUnicoFiltroParaNicolas(){
		filtroGusto = new FiltroPorGusto
		nicolas.comidasQueDisgustan.add(chori)
		nicolas.agregarReceta(getRecetaAntiVegano)
		nicolas.agregarFiltro(filtroGusto)
		recetasFiltradas = nicolas.aplicarFiltros
		Assert.assertEquals(recetasFiltradas,nicolas.recetas)
	}
	
	@Test
	def void filtroPorExcesoDeCalorias() {
		filtroExceso = new FiltroPorExcesoDeCalorias
		nicolas.comidasQueDisgustan.add(chori)
		nicolas.agregarReceta(getRecetaCaloriasMayorRango)
		nicolas.agregarFiltro(filtroExceso)
		recetasFiltradas = nicolas.aplicarFiltros
		Assert.assertEquals(recetasFiltradas,nicolas.recetas)
		
	}	
	
}