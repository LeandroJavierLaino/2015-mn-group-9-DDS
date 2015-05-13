package postProcesado

import java.util.List
import receta.Receta
import cosasUsuario.Usuario

class PostProcesoOrdenadoCantIng extends PostProcesoDecorador {
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(Usuario unUsuario, List<Receta> recetasAMostrar){
		unUsuario.recetasPorFiltros = recetasAMostrar.sortBy[receta|receta.ingredientes.size()]
		decorado.postProcesar(unUsuario, recetasAMostrar)
	}
}