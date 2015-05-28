package postProcesado

import java.util.List
import receta.Receta

class PostProcesoResultadosPares extends PostProcesoDecorador{
	
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		var i = 1 as int
		var esPar=false
		while(i<recetasAMostrar.size()){
			if(esPar){
			recetasAMostrar.get(i)
			esPar=false
			}
			else{
				esPar=true
			}
		}
		decorado.postProcesar(recetasAMostrar)
	}
	
}