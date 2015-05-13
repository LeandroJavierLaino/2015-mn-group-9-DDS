package TP2

import org.junit.Test
import testeo.TestInstances
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import org.junit.Assert
import java.util.HashSet
import receta.Receta
import java.util.Set

class TestFiltrosYProcesamientoOrdenamiento extends TestInstances {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	@Test
	def void filtroAnidado(){
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		diego.filtrosAAplicar.add(filtroGusto)
		diego.filtrosAAplicar.add(filtroExceso)
		recetasFiltradas = repo.aplicarFiltro(diego)
		Assert.assertArrayEquals(diego.recetas,recetasFiltradas)
	}
	
	@Test
	def void filtroSimple(){
		
	}
}