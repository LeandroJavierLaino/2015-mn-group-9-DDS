package postProcesado

import java.util.List
import receta.Receta

interface PostProceso {
	def List<Receta> postProcesar(List<Receta> recetasAMostrar)
}