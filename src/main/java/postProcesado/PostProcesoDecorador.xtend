package postProcesado

import receta.Receta
import java.util.List

abstract class PostProcesoDecorador implements PostProceso {
	public PostProceso decorado
	
	new(PostProceso postProceso){
		decorado = postProceso
	}
	
	override postProcesar(List <Receta> recetasAMostrar){
		decorado.postProcesar(recetasAMostrar)
	}
	
}