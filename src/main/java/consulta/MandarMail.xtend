package consulta

import consulta.Monitor
import email.Email

class MandarMail implements Monitor {
	
	static String NOMBRE = "Jcontardo"
	static String ADMIN
	
	override monitorear(Consulta consulta) {
		if(consulta.usuario.nombre == NOMBRE) {
			
			val String filtros = obtenerNombresDeClases(consulta)
			
			var correo = new Email() => [
				from = "Sistema"
				to = ADMIN
				subject = "Resultados de consulta del usuario " + NOMBRE
				content = "Nombre de Usuario: " + NOMBRE + "\nFiltros y Procesamiento: " + filtros
			]
		}
	}
	
	override mostrarResultados() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def String obtenerNombresDeClases(Consulta consulta) {
		var String nombresClaseFiltros
		
		for(filtro: consulta.usuario.filtrosAAplicar) {
			nombresClaseFiltros = nombresClaseFiltros + ", " + (filtro.class.toString)
		}
		nombresClaseFiltros + consulta.usuario.procesamiento.toString
	}
	
}