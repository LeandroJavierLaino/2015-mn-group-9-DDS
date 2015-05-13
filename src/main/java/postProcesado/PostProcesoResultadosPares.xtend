package postProcesado

import java.util.List
import receta.Receta
import cosasUsuario.Usuario

class PostProcesoResultadosPares extends PostProcesoDecorador{
	
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(Usuario unUsuario, List<Receta> recetasAMostrar){
		val i = 1 as int
		while(i<recetasAMostrar.size()){
		unUsuario.filtrar(recetasAMostrar.get(i))
		}
		decorado.postProcesar(unUsuario, recetasAMostrar)
	}
	
}