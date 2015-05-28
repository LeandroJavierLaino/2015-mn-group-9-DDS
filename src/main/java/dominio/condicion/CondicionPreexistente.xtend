package condicion
import cosasUsuario.Usuario
import receta.Receta

interface CondicionPreexistente {
		def boolean valido(Usuario unUsusario)
		def boolean tieneRutinaSaludable(Usuario unUsuario)
		def boolean tolera(Receta unaReceta)
}