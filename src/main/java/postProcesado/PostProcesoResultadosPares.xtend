package postProcesado

import java.util.List
import receta.Receta

class PostProcesoResultadosPares extends PostProcesoDecorador{
	
	int i
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		i=1
		while(i<recetasAMostrar.size()){
			recetasAMostrar.remove(i)
			i = i + 2
		}
		decorado.postProcesar(recetasAMostrar)
	}
	
}
