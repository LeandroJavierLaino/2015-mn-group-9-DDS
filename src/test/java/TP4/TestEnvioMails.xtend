package TP4

import command.CommandEmailSender
import consulta.GestorDeConsultas
import emailSender.EmailSender
import filtro.FiltroPorExcesoDeCalorias
import filtro.FiltroPorGusto
import org.junit.Before
import org.junit.Test
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN
import testeo.UsuariosExtras
import static org.mockito.Mockito.*
import static org.mockito.Matchers.*

class TestEnvioMails extends UsuariosExtras{
	
	FiltroPorGusto filtroGusto = new FiltroPorGusto
	FiltroPorExcesoDeCalorias filtroCalorias = new FiltroPorExcesoDeCalorias
	GestorDeConsultas gestor = GestorDeConsultas.getInstance
	
	@Before
	override void init(){
		super.init()
		diego.agregarReceta(recetaAntiDiabetico)
		diego.agregarReceta(recetaCaloriasBajoRango)
		leandro.agregarReceta(recetaParaCualquiera)
	}
	
	@Test
	def void testEnvioMailsLuegoDeQueDiegoHaceConsulta(){
		var mockedMailSender = mock(typeof(EmailSender))
		var commandEmail = new CommandEmailSender
		commandEmail.psender = mockedMailSender
		gestor.commands.add(commandEmail)
		diego.agregarFiltro(filtroGusto)
		diego.agregarFiltro(filtroCalorias)
		diego.procesamiento = new ProcesamientoParaTomarLosPrimerosN
		diego.postProcesarRecetas
		gestor.ejecutarJob
		verify(mockedMailSender, times(1)).send(any(typeof(String)))
	}
	
	@Test
	def void testNoEnviaMailPorqueLeandroNoEstaConfiguradoParaSerEnviado(){
		var mockedMailSender = mock(typeof(CommandEmailSender))
		gestor.commands.add(mockedMailSender)
		leandro.agregarFiltro(filtroGusto)
		leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
		leandro.postProcesarRecetas
		gestor.ejecutarJob
		verify(mockedMailSender, times(0)).send()
	}
	
}