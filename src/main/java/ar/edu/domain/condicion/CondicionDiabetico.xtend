package ar.edu.domain.condicion
import ar.edu.domain.cosasUsuario.Usuario
import ar.edu.domain.receta.Receta
import ar.edu.domain.excepcion.CondPreexistenteExcepcion

//Nuevas excepciones modificadas

class CondicionDiabetico implements CondicionPreexistente {

	override def valido(Usuario unUsuario) {

		if (unUsuario.sexo.nullOrEmpty)
			throw new CondPreexistenteExcepcion("El campo sexo no se declaro esta vacio")
		else if (!(unUsuario.sexo.equalsIgnoreCase("M") || unUsuario.sexo.equalsIgnoreCase("F")))
			throw new CondPreexistenteExcepcion("El campo sexo es dintinto de 'M' y 'F'")

		if (unUsuario.comidaPreferida.nullOrEmpty)
			throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia")

		(unUsuario.sexo.equalsIgnoreCase("M") || unUsuario.sexo.equalsIgnoreCase("F")) //el chequeo del char no funciona

	}

	override def tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.esActiva || unUsuario.peso <= 70
	}

	override def tolera(Receta unaReceta) {
		(!unaReceta.contieneComida("Azucar",100))
	}
	
	override def esCondicionVegana(){
		false
	}
}
