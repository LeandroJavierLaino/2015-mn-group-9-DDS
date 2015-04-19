import CondicionPreexistente

class CondicionVegano implements CondicionPreexistente{

	override valido(Usuario unUsuario) {
		
		if(unUsuario.comidaPreferida.contains('Carne') || unUsuario.comidaPreferida.contains('Pollo') || unUsuario.comidaPreferida.contains('Chivito') || unUsuario.comidaPreferida.contains('Chori'))
			false
		else true
		
	}
	override tieneRutinaSaludable(Usuario unUsuario) {	
		unUsuario.comidaPreferida.contains('Fruta')
	}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}