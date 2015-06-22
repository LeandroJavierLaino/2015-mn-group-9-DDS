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
import consulta.Consulta

class TestCommandRecetasConsultadasAFavoritas extends UsuariosExtras {
	CommandRecetasFavoritas commandRecetasFavoritas
	
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	Set<Receta> recetasAConsultar 
	
	Consulta consulta
	
	@Before
	override void init() {
		super.init()
		
		commandRecetasFavoritas = new CommandRecetasFavoritas => [] 	
	}
	
	@Test
	def	void NicolasConsultaRecetasYLasAgregaComoFavoritas(){
		nicolas.agregarReceta(recetaAntiVegano)
		nicolas.agregarReceta(recetaAntiDiabetico)
		//Falta hacer la consulta
		recetasAConsultar.addAll(recetaAntiVegano,recetaAntiDiabetico)
		commandRecetasFavoritas.agregarConsulta(consulta)
		nicolas.agregarUnCommandMonitor(commandRecetasFavoritas)
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		recetasFiltradas = nicolas.postProcesarRecetas
		Assert.assertEquals(3,nicolas.recetasFavoritas.size)
	}

	/*@Test
	def	void usuarioConsultaRecetasYNoLasAgregaComoFavoritas(){
		Assert.assertEquals(0,usuario.recetasFavoritas.size)
	}
	
	@Test
	def	void usuarioConsultaRecetassAgregaAlgunasComoFavoritas(){
		Assert.assertEquals(v,usuario.recetasFavoritas.size)//v es parte de las recetas consultadas
	}*/		
}

