package TP2

import org.junit.Test
import filtro.FiltroPorExcesoDeCalorias
import java.util.HashSet
import receta.Receta
import testeo.UsuariosPrincipales
import org.junit.Assert
import java.util.Set

class TestFiltros extends UsuariosPrincipales{
	
	FiltroPorExcesoDeCalorias filtroExcesoCalorias
	Set<Receta> recetasFiltradas = new HashSet<Receta>
				
	@Test
	def void aplicarFiltroUnicoPorExcesoDeCalorias(){
		filtroExcesoCalorias = new FiltroPorExcesoDeCalorias
		diego.filtrosAAplicar.add(filtroExcesoCalorias)
		recetasFiltradas = diego.aplicarFiltros
		Assert.assertArrayEquals(diego.recetas,recetasFiltradas)
	}
	
		
	def void aplicarFiltroPorExcesoDeCaloriasCuandoNoTieneRecetaConExceso(){
		filtroExcesoCalorias = new FiltroPorExcesoDeCalorias
		leandro.agregarReceta(getRecetaCaloriasBajoRango)
		leandro.filtrosAAplicar.add(filtroExcesoCalorias)
		recetasFiltradas = leandro.aplicarFiltros
		Assert.assertNotEquals(diego.recetas,recetasFiltradas)
	}
	
	
	
	
	
}