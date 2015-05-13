package filtro

import cosasUsuario.Usuario
import receta.Receta

interface Filtro {
	 	def void filtrar(Usuario usuario,Receta receta)
}