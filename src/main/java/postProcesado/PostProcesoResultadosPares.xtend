package postProcesado

import java.util.List
import receta.Receta
import cosasUsuario.Usuario

class PostProcesoResultadosPares extends PostProcesoDecorador{
	
	
	int i
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(Usuario unUsuario, List<Receta> recetasAMostrar){
		i=1
		while(i<recetasAMostrar.size()){
		unUsuario.filtrar(recetasAMostrar.get(i))
		i = i+2
		}
		decorado.postProcesar(unUsuario, recetasAMostrar)
	}
	
}