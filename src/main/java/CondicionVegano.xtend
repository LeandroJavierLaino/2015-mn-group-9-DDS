import CondicionPreexistente

class CondicionVegano implements CondicionPreexistente{

	override valido(Usuario unUsuario) {
		
		if(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") || unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori"))
			false
		else true
		
	}
	override tieneRutinaSaludable(Usuario unUsuario) {	
		unUsuario.comidaPreferida.contains("Fruta")
	}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override tolera (Receta unaReceta) {
		if(unaReceta.ingredientes.containsKey("Carne") || unaReceta.ingredientes.containsKey("Pollo") || unaReceta.ingredientes.containsKey("Chivito") || unaReceta.ingredientes.containsKey("Chori"))
			false
		else true
	}
}