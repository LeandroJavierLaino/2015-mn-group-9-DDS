import CondicionPreexistente

class CondicionVegano implements CondicionPreexistente{

	override valido(Usuario unUsuario) {
		
	!(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") || unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori"))

	}
	override tieneRutinaSaludable(Usuario unUsuario) {	
	
		if(unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")
			
		unUsuario.comidaPreferida.contains("Fruta")
			
	}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override tolera (Receta unaReceta) {
		!(unaReceta.ingredientes.containsKey("Carne") || unaReceta.ingredientes.containsKey("Pollo") || unaReceta.ingredientes.containsKey("Chivito") || unaReceta.ingredientes.containsKey("Chori"))
	}
}