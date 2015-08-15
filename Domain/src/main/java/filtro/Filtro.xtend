package filtro

import java.util.Set
import receta.Receta
import cosasUsuario.Usuario

interface Filtro {
	def Set<Receta> filtrar(Set<Receta> recetas,Usuario usuario)
}