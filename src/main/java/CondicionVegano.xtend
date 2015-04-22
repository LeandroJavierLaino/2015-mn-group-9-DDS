class CondicionVegano implements CondicionPreexistente {

	override valido(Usuario unUsuario) {

		!(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") ||
			unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori"))

	}

	override tieneRutinaSaludable(Usuario unUsuario) {

		if (unUsuario.comidaPreferida.nullOrEmpty)
			throw new ExcepcionUsuario("La lista comidaPreferida no se declaro o esta vacia")

		unUsuario.comidaPreferida.contains("Fruta")

	}

	override alimentoInadecuado() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override tolera(Receta unaReceta) {
		!(unaReceta.ingredientes.exists[it.nombre.equalsIgnoreCase("Carne")] ||
			unaReceta.ingredientes.exists[it.nombre.equalsIgnoreCase("Pollo")] ||
			unaReceta.ingredientes.exists[it.nombre.equalsIgnoreCase("Chivito")] ||
			unaReceta.ingredientes.exists[it.nombre.equalsIgnoreCase("Chori")])
	}
}
