

import CondicionPreexistente

class CondicionDiabetico implements CondicionPreexistente {
	
	override Boolean valido(Usuario unUsuario) {
		
		unUsuario.comidaPreferida.length() > 0
	}
	
	override tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.esActiva
		}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}