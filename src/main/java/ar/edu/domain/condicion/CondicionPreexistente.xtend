package ar.edu.domain.condicion

import ar.edu.domain.cosasUsuario.Usuario
import ar.edu.domain.receta.Receta

interface CondicionPreexistente {
	def boolean valido(Usuario unUsusario)

	def boolean tieneRutinaSaludable(Usuario unUsuario)

	def boolean tolera(Receta unaReceta)

	def Boolean esCondicionVegana()

}
