package condicion
import cosasUsuario.Usuario
import receta.Receta
import excepcion.ExcepcionUsuario
class CondicionVegano implements CondicionPreexistente {

	override valido(Usuario unUsuario) {

		!(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") ||
			unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori"))

	}

	override tieneRutinaSaludable(Usuario unUsuario) {

		if (unUsuario.comidaPreferida.nullOrEmpty) throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")

		unUsuario.comidaPreferida.contains("Fruta")

	}

	override tolera(Receta unaReceta) {
		!(unaReceta.contieneComida("carne",1) || unaReceta.contieneComida("pollo",1) || unaReceta.contieneComida ("chivito",1) ||
			unaReceta.contieneComida("chori",1))
	}
}
