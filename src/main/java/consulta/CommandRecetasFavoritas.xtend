package consulta

class CommandRecetasFavoritas implements CommandMonitor {
	Consulta consulta
	
	override execute() {
		consulta.usuario.agregarRecetasAFavoritas(consulta.recetas)
	}
	
	def comandRecetasFavoritas(Consulta unaConsulta){
		consulta=unaConsulta
	}
}