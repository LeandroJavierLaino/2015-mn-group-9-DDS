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
	

	//Set<Receta> recetasFavoritas = new HashSet<Receta>
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
		Assert.assertEquals(0,nicolas.recetasFavoritas.size)
		var commandFavoritas = new CommandRecetasFavoritas
		gestor.commands.add(commandFavoritas)
		nicolas.agregarFiltro(filtroGusto)
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		gestor.ejecutarJob
		//recetasFavoritas = nicolas.postProcesarRecetas
		Assert.assertEquals(2,nicolas.recetasFavoritas.size)
	}
	
	@Test
	def void seCreaUnLogPor101Recetas(){
		//Configuro
		var Consulta hayMasde100 = mock(typeof(Consulta))
		hayMasde100.recetas = listaRecetasFicticias
		when(hayMasde100.cantRecetas()).thenReturn(new Integer(101))
		
		var mockedLogger = mock(typeof(Logger))
		var commandLogger = new CommandLogger
		commandLogger.logger = mockedLogger
		gestor = GestorDeConsultas.newInstance
		gestor.commands.add(commandLogger)
		
		//Consulta
		hayMasde100.usuario = leandro
		gestor.monitorear(hayMasde100)
		gestor.ejecutarJob
		verify(commandLogger.logger, times(1)).info(any(typeof(String)))
	}
	
	
	@Test
	def void noSeCreaUnLogPor99Recetas(){
		//Configuro
		var Consulta hayMenosde100 = mock(typeof(Consulta))
		hayMenosde100.recetas = listaRecetasFicticias
		when(hayMenosde100.cantRecetas()).thenReturn(new Integer(99))
		
		var mockedLoggerSinLog = mock(typeof(Logger))
		var commandLoggerSinLog = new CommandLogger
		commandLoggerSinLog.logger = mockedLoggerSinLog
		gestor = GestorDeConsultas.newInstance
		gestor.commands.add(commandLoggerSinLog)
		
		//Consulta
		hayMenosde100.usuario = pablo
		gestor.monitorear(hayMenosde100)
		gestor.ejecutarJob
		verify(commandLoggerSinLog.logger, times(0)).info(any(typeof(String)))
	}
	
	
	@Test
	def void seCreanDosLogsPor101Recetas(){
		//Configuro
		var Consulta hayMasde100 = mock(typeof(Consulta))
		hayMasde100.recetas = listaRecetasFicticias
		when(hayMasde100.cantRecetas()).thenReturn(new Integer(101))
		
		var mockedLoggerCon2Log = mock(typeof(Logger))
		var commandLoggerCon2Log = new CommandLogger
		commandLoggerCon2Log.logger = mockedLoggerCon2Log
		gestor = GestorDeConsultas.newInstance
		gestor.commands.add(commandLoggerCon2Log)
		
		//Consulta 1
		hayMasde100.usuario = pablo
		gestor.monitorear(hayMasde100)
		gestor.ejecutarJob
		verify(commandLoggerCon2Log.logger, times(1)).info(any(typeof(String)))
		Assert.assertEquals(gestor.consultasAEjecutar.size, 0)
		
		//Consulta 2
		hayMasde100.usuario = eri
		gestor.monitorear(hayMasde100)
		gestor.ejecutarJob
		verify(commandLoggerCon2Log.logger, times(2)).info(any(typeof(String)))
	}
}

