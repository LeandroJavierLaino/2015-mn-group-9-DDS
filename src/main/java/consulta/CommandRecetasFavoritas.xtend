package consulta

class CommandRecetasFavoritas implements CommandMonitor {
	Consulta consulta
	
	override execute() {
		consulta.usuario.agregarRecetasAFavoritas(consulta.recetas)
	}
	
	def agregarConsulta(Consulta unaConsulta){
		consulta=unaConsulta
	}
}