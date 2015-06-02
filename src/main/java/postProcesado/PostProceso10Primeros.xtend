package postProcesado

import java.util.List
import receta.Receta

class PostProceso10Primeros extends PostProcesoDecorador {
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		val i = 10 as int
		while(i < recetasAMostrar.size()){
		 recetasAMostrar.get(i)
		}
		decorado.postProcesar(recetasAMostrar)
	}
}