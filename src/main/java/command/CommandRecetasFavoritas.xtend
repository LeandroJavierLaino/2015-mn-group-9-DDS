package command

import consulta.Consulta

class CommandRecetasFavoritas implements CommandConsulta {
	Consulta consulta
	
	override execute() {
		consulta.usuario.agregarRecetasAFavoritas(consulta.recetas)
	}
	
	def agregarConsulta(Consulta unaConsulta){
		consulta=unaConsulta
	}
}