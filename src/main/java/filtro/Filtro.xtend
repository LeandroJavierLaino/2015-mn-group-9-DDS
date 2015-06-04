package filtro

import receta.Receta
import java.util.List
import cosasUsuario.Usuario

interface Filtro {
	 	def List<Receta> filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario)
}