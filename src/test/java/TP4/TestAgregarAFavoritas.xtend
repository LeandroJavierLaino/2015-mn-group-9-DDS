package TP4

import testeo.UsuariosExtras
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Test
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import java.util.HashSet
import java.util.Set
import receta.Receta
import org.junit.Assert

@Accessors
class TestAgregarAFavoritas extends UsuariosExtras {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	Set<Receta> recetasFavoritas = new HashSet<Receta>
	
	@Test
	def void agregarTodasLasRecetasDeDiegoAFavoritas(){
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		diego.filtrosAAplicar.add(filtroGusto)
		diego.filtrosAAplicar.add(filtroExceso)
		diego.agregarReceta(recetaSalchiPapa)
		diego.agregarReceta(recetaAntiVegano)
		recetasFiltradas = diego.aplicarFiltros
		Assert.assertEquals(recetasFiltradas,diego.recetasFavoritas)
	}
	
	
}