package command

import consulta.Consulta

class CommandRecetasFavoritas implements CommandConsulta {

	override execute(Consulta consulta) {
		if (consulta.usuario.quiereMarcarComoFavoritas) {			
			for (receta : consulta.recetas) {
				consulta.usuario.recetasFavoritas.add(receta)
			}
		}
	}
}
