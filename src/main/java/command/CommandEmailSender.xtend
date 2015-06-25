package command

import consulta.Consulta
import cosasUsuario.Usuario
import emailSender.EmailSender
import filtro.Filtro
import java.util.HashSet
import java.util.List
import java.util.Set
import org.apache.log4j.Logger
import procesamientoPosterior.ProcesamientoPosterior
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CommandEmailSender implements CommandConsulta{

	EmailSender psender = new EmailSender
	Set<Usuario> usuariosAEnviarMail = new HashSet<Usuario>
	static Logger logMails = Logger.getLogger(typeof(Usuario).getName)


	def almacenarUsuarioParaEnvioEmail(Usuario usuario) {
		usuariosAEnviarMail.add(usuario)
	}

	override execute(Consulta consulta) {
		almacenarUsuarioParaEnvioEmail(consulta.usuario)
	}

	def void enviarMail() {
		for (usuario : usuariosAEnviarMail) {
			if (usuario.esUnUsuarioAAvisarPorMail()) {
				var String mailArmado
				mailArmado = armarMail(usuario, usuario.indicarProcesamientoPosterior, usuario.filtrosAAplicar)
				logMails.info("Se envío el siguiente mail:" + mailArmado)
				psender.send(mailArmado)
			}
		
		}
	}

	def armarMail(Usuario usuario, ProcesamientoPosterior posterior, List<Filtro> filtros) {
		"Se ejecuto la consulta del usuario:" + usuario.nombre + "con estos parámetros de búsqueda:" + posterior + "y" +
			filtros
	}

}
