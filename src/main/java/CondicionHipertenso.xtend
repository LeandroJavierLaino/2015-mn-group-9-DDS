

import CondicionPreexistente

class CondicionHipertenso implements CondicionPreexistente {
	
	override Boolean valido(Usuario unUsuario) {
		
		if(unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")
			
		unUsuario.comidaPreferida.length() > 0
	}
	
	override tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.activaIntensa
		}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override tolera (Receta unaReceta) {
		!(unaReceta.condimentos.containsKey("Sal") || unaReceta.ingredientes.containsKey("Caldo"))
	}
}