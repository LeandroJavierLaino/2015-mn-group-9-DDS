package postProcesado

import java.util.List
import receta.Receta

class PostProcesoOrdenadoCalor extends PostProcesoDecorador {
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		recetasAMostrar.sortBy[receta|receta.cantidadMaximaCalorias]
		decorado.postProcesar(recetasAMostrar.sortBy[receta|receta.cantidadMaximaCalorias].toList)
	}
}