package ar.edu.domain.condicion
import ar.edu.domain.cosasUsuario.Usuario
import ar.edu.domain.receta.Receta

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
	
	override esCondicionVegana(){
		false
	}
}