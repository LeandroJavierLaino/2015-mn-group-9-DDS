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
		!(unaReceta.condimentos.exists[it.nombre.equalsIgnoreCase("Sal")] ||
			unaReceta.ingredientes.exists[it.nombre.equalsIgnoreCase("Caldo")])
	}
}
