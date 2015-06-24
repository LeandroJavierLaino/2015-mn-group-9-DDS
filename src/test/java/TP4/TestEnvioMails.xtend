package TP4

import testeo.UsuariosExtras
import org.junit.Test
import mailSender.MailSender
import static org.mockito.Matchers.*
import static org.mockito.Mockito.* 
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN

class TestEnvioMails extends UsuariosExtras {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroCalorias
	
	@Test
	def void testEnvioMailsLuegoDe5ConsultasDeUsuariosQueEstanConfiguradosParaNotificarMail(){
		var mockedMailSender = mock(typeof(MailSender))
		diego.emailSender = new MailSender(mockedMailSender)
		diego.agregarFiltro(filtroGusto)
		diego.agregarFiltro(filtroCalorias)
		diego.procesamiento = new ProcesamientoParaTomarLosPrimerosN
		verify(mockedMailSender, times(1)).enviarMail(any(typeof()))
	}
	
}