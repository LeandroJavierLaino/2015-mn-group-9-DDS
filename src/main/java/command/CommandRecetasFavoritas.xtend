package command

import consulta.Consulta

class CommandRecetasFavoritas implements CommandConsulta {
	
	override execute(Consulta consulta) {
		consulta.usuario.agregarRecetasAFavoritas(consulta.recetas)
	}
	
}