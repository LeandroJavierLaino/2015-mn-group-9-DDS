

import CondicionPreexistente

class CondicionHipertenso implements CondicionPreexistente {
	
	override Boolean valido(Usuario unUsuario) {
		
		unUsuario.comidaPreferida.length() > 0
	}
	
	override tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.activaIntensa
		}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override tolera (Receta unaReceta) {
		if(unaReceta.condimentos.containsKey("Sal") || unaReceta.ingredientes.containsKey("Caldo"))
			false
		else true
	}
}