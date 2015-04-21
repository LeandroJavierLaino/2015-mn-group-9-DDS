
interface CondicionPreexistente {
		def Boolean valido(Usuario unUsusario)
		def Boolean alimentoInadecuado()
		def Boolean tieneRutinaSaludable(Usuario unUsuario)
		def Boolean tolera(Receta unaReceta)
}