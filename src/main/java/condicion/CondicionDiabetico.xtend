package condicion
import cosasUsuario.Usuario
import excepcion.ExcepcionUsuario
import rutina.RutinaActiva
import receta.Receta

class CondicionDiabetico implements CondicionPreexistente {

	override def valido(Usuario unUsuario) {

		if (unUsuario.sexo.nullOrEmpty)
			throw new ExcepcionUsuario("El campo sexo no se declaro esta vacio")
		else if (!(unUsuario.sexo.equalsIgnoreCase("M") || unUsuario.sexo.equalsIgnoreCase("F")))
			throw new ExcepcionUsuario("El campo sexo es dintinto de 'M' y 'F'")

		if (unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")

		(unUsuario.sexo.equalsIgnoreCase("M") || unUsuario.sexo.equalsIgnoreCase("F")) //el chequeo del char no funciona

	}

	override def tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.class.equals(RutinaActiva) || unUsuario.peso <= 70
	}

	override def tolera(Receta unaReceta) {
		!(unaReceta.tieneAzucarMayorA100(unaReceta.condimentos))
	}
}
