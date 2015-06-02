package postProcesado

import java.util.List
import receta.Receta
import excepcion.ExceptionReceta

class PostProcesoPosta implements PostProceso {

	override postProcesar(List <Receta> recetasAMostrar) {
		if(recetasAMostrar.isEmpty){
		throw new ExceptionReceta("no se obtuvo ninguna receta")
		}
		else{
			recetasAMostrar.toList
		}
	}
}