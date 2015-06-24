package mailSender

import cosasUsuario.Usuario
import java.util.HashSet
import java.util.Set
import procesamientoPosterior.ProcesamientoPosterior
import java.util.List
import filtro.Filtro
import org.apache.log4j.Logger

class MailSender implements Sender {
	
	static Logger logMails = Logger.getLogger(typeof(Usuario).getName)
	Set<Usuario> usuariosAEnviarMail = new HashSet<Usuario>
	Sender psender
	
	new(MailSender sender) {
		psender = sender
	}
	
	def almacenarUsuarioParaEnvioMail(Usuario usuario) {
		usuariosAEnviarMail.add(usuario)
	}
	
	def enviarMail(){
		for(usuario : usuariosAEnviarMail){
			var String mailArmado
			mailArmado = armarMail(usuario, usuario.indicarProcesamientoPosterior,usuario.filtrosAAplicar)
			logMails.info("Se envío el siguiente mail:" + mailArmado)
		}
	}
	
	def armarMail(Usuario usuario, ProcesamientoPosterior posterior, List<Filtro> filtros) {
		"Se ejecuto la consulta del usuario:" + usuario.nombre + "con estos parámetros de búsqueda:" + posterior + "y" + filtros
	}
	
}