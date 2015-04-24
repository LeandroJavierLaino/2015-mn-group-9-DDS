package condicion
import cosasUsuario.Usuario
import excepcion.ExcepcionUsuario
import receta.Receta


class CondicionHipertenso implements CondicionPreexistente {

	override boolean valido(Usuario unUsuario) {

		if (unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")

		unUsuario.comidaPreferida.length() > 0
	}

	override tieneRutinaSaludable(Usuario unUsuario) {
		unUsuario.rutina.activaIntensa
	}

	override tolera(Receta unaReceta) {
		(!unaReceta.contieneComida("Sal",0) && !unaReceta.contieneComida("Caldo",0))
	}
}
