package condicion

import cosasUsuario.Usuario
import javax.persistence.Entity
import receta.Receta

@Entity
class CondicionCeliaco extends CondicionPreexistente {
	
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