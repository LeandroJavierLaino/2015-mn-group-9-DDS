

import CondicionPreexistente

class CondicionCeliaco implements CondicionPreexistente {
	
	override valido(Usuario unUsuario) {
		true
	}
	override tieneRutinaSaludable(Usuario unUsuario) {
		true
	}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override tolera (Receta unaReceta) {
		true
	}
}