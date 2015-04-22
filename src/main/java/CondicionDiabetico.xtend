

class CondicionDiabetico implements CondicionPreexistente {

	override Boolean valido(Usuario unUsuario) {

		if (unUsuario.sexo == "")
			throw new ExcepcionUsuario("El campo sexo no se declaro esta vacio")
			
		else if(!(unUsuario.sexo.equals("M") || unUsuario.sexo.equals("F")))
			throw new ExcepcionUsuario("El campo sexo es dintinto de 'M' y 'F'")
			
		if(unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")
						
		(unUsuario.sexo.equals("M") || unUsuario.sexo.equals("F")) //el chequeo del char no funciona

	}

	override def tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.class.equals(RutinaActiva) || unUsuario.peso <= 70
	}

	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override def tolera(Receta unaReceta) {
		!(unaReceta.tieneAzucarMayorA100(unaReceta.condimentos))
	}
}
