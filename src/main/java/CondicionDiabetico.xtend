

import CondicionPreexistente

class CondicionDiabetico implements CondicionPreexistente {
	
	override Boolean valido(Usuario unUsuario) {
		
		unUsuario.comidaPreferida.length() > 0 && (unUsuario.sexo.equals("M") || unUsuario.sexo.equals("F")) //el chequeo del char no funciona
		
	}
	
	override tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.class.equals(RutinaActiva) || unUsuario.peso <= 70
		}
	
	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	override tolera (Receta unaReceta) {
		if(unaReceta.condimentos.containsKey("Azucar") && unaReceta.condimentos.get("Azucar") >100)
			false
		else true
	}
}