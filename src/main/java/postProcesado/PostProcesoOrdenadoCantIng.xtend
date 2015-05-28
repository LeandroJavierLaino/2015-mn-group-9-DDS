package postProcesado

import java.util.List
import receta.Receta

class PostProcesoOrdenadoCantIng extends PostProcesoDecorador {
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		decorado.postProcesar(recetasAMostrar.sortBy[receta|receta.ingredientes.size()])
	}
}