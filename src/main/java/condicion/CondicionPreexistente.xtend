package condicion

import cosasUsuario.Usuario
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
interface CondicionPreexistente {
	def boolean valido(Usuario unUsusario)

	def boolean tieneRutinaSaludable(Usuario unUsuario)

	def boolean tolera(Receta unaReceta)

	def Boolean esCondicionVegana()

}
