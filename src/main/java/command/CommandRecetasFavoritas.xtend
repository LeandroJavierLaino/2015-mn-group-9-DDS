package command

import consulta.Consulta

class CommandRecetasFavoritas implements CommandConsulta {

	override execute(Consulta consulta) {
		for (receta : consulta.recetas) {
			if (consulta.usuario.recetasFavoritas.contains(receta) || !consulta.usuario.quiereMarcarComoFavoritas) {
			}
			consulta.usuario.recetasFavoritas.add(receta)
		}
	}
}
