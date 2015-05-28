package postProcesado

import java.util.List
import receta.Receta

interface PostProceso {
	def void postProcesar(List<Receta> recetasAMostrar)
}