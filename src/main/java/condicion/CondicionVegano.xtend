package condicion
import cosasUsuario.Usuario
import receta.Receta
import excepcion.CondPreexistenteExcepcion

//Nuevas excepciones modificadas

class CondicionVegano implements CondicionPreexistente {

	override valido(Usuario unUsuario) {
		if(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") ||
			unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori"))
		{
		throw new CondPreexistenteExcepcion("Le gusta una comida no valida para el vegano")
		}
	(unUsuario.sexo.equalsIgnoreCase("M") || unUsuario.sexo.equalsIgnoreCase("F")) //el chequeo del char no funciona
}

	override tieneRutinaSaludable(Usuario unUsuario) {

		if (unUsuario.comidaPreferida.nullOrEmpty) throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia")

		unUsuario.comidaPreferida.contains("Fruta")
	}

	override tolera(Receta unaReceta) {
		(!unaReceta.contieneComida("carne",1) && !unaReceta.contieneComida("pollo",1) && !unaReceta.contieneComida ("chivito",1) &&
			!unaReceta.contieneComida("chori",1))
	}
}
