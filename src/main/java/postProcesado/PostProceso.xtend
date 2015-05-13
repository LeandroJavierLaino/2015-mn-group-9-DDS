package postProcesado

import java.util.List
import receta.Receta
import cosasUsuario.Usuario

interface PostProceso {
	def void postProcesar(Usuario unUsuario, List<Receta> recetasAMostrar)
}