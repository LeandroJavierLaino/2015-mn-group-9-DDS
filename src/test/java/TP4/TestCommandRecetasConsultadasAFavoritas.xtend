package TP4

import org.junit.Before
import testeo.UsuariosExtras
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import receta.Receta
import java.util.HashSet
import java.util.Set
import org.junit.Assert
import org.junit.Test
import command.CommandRecetasFavoritas
import filtro.FiltroPorGusto
import consulta.GestorDeConsultas

class TestCommandRecetasConsultadasAFavoritas extends UsuariosExtras {
	Set<Receta> recetasFavoritas = new HashSet<Receta>
	FiltroPorGusto filtroGusto = new FiltroPorGusto 
	GestorDeConsultas gestor = GestorDeConsultas.getInstance
	
	@Before
	override void init() {
		super.init()
		
		nicolas.agregarReceta(recetaAntiVegano)
		nicolas.agregarReceta(recetaParaCualquiera)			
	}
	
	
	@Test
	def	void NicolasConsultaRecetasYLasAgregaComoFavoritas(){
		var commandFavoritas = new CommandRecetasFavoritas
		gestor.commands.add(commandFavoritas)
		nicolas.agregarFiltro(filtroGusto)
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		gestor.ejecutarJob
		recetasFavoritas = nicolas.postProcesarRecetas
		Assert.assertEquals(2,nicolas.recetasFavoritas.size)
	}
	
}

