package condicion
import cosasUsuario.Usuario
import receta.Receta

class CondicionCeliaco implements CondicionPreexistente {
	
	override valido(Usuario unUsuario) {
		true
	}
	override tieneRutinaSaludable(Usuario unUsuario) {
		true
	}
	
	override tolera (Receta unaReceta) {
		true
	}
}