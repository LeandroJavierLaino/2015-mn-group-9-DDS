package TP4

import org.junit.Before
import testeo.UsuariosExtras
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import receta.Receta
import java.util.HashSet
import java.util.Set
import consulta.CommandRecetasFavoritas
import org.junit.Assert
import org.junit.Test

class TestCommandRecetasConsultadasAFavoritas extends UsuariosExtras {
	
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	@Before
	override void init() {
		super.init()
		
		commandRecetasFavoritas = new CommandRecetasFavoritas => [] 	
	}
	
	@Test
	def	void NicolasConsultaRecetasYLasAgregaComoFavoritas(){
		nicolas.agregarReceta(recetaAntiVegano)
		nicolas.agregarReceta(recetaAntiDiabetico)
		commandRecetasFavoritas.agregarConsulta()
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

}