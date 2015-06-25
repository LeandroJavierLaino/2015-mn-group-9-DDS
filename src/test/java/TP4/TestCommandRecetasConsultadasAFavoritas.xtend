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
import command.CommandLogger
import filtro.FiltroPorGusto
import consulta.GestorDeConsultas
import static org.mockito.Mockito.*
import consulta.Consulta
import org.apache.log4j.Logger

class TestCommandRecetasConsultadasAFavoritas extends UsuariosExtras {	
	

	Set<Receta> recetasFavoritas = new HashSet<Receta>
	Set<Receta> listaRecetasFicticias = new HashSet<Receta>
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
	
	@Test
	def void seCreaUnLogPor101Recetas(){
		//var commandLoggerMocked = mock(typeof(CommandLogger))
		var commandLoggerMocked = new CommandLogger
		var Consulta hayMasde100 = mock(typeof(Consulta))
		hayMasde100.usuario = leandro
		hayMasde100.recetas = listaRecetasFicticias
		var mockedLogger = mock(typeof(Logger))
		commandLoggerMocked.logger = mockedLogger
		leandro.agregarFiltro = filtroGusto
		leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
		leandro.postProcesarRecetas
		gestor = GestorDeConsultas.newInstance
		gestor.commands.add(commandLoggerMocked)
		gestor.monitorear(hayMasde100)
		when(hayMasde100.cantRecetas()).thenReturn(new Integer(101))
		gestor.ejecutarJob
		verify(commandLoggerMocked.logger, times(1)).info(any(typeof(String)))
	}
	
	@Test
	def void noSeCreaUnLogPor99Recetas(){
		//var commandLoggerSinLogMocked = mock(typeof(CommandLogger))
		var commandLoggerSinLogMocked = new CommandLogger
		var Consulta hayMenosde100 = mock(typeof(Consulta))
		hayMenosde100.usuario = pablo
		hayMenosde100.recetas = listaRecetasFicticias
		var mockedLoggerSinLog = mock(typeof(Logger))
		commandLoggerSinLogMocked.logger = mockedLoggerSinLog
		pablo.agregarFiltro = filtroGusto
		pablo.procesamiento = new ProcesamientoOrdenarlosPorNombre
		pablo.postProcesarRecetas
		gestor = GestorDeConsultas.newInstance
		gestor.commands.add(commandLoggerSinLogMocked)
		gestor.monitorear(hayMenosde100)
		when(hayMenosde100.cantRecetas()).thenReturn(new Integer(99))
		gestor.ejecutarJob
		verify(commandLoggerSinLogMocked.logger, times(0)).info(any(typeof(String)))
	}
}

