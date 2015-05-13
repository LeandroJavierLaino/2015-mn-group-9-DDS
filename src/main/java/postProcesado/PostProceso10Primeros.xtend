package postProcesado

import java.util.List
import receta.Receta
import cosasUsuario.Usuario

class PostProceso10Primeros extends PostProcesoDecorador {
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(Usuario unUsuario, List<Receta> recetasAMostrar){
		val i = 10 as int
		while(i < recetasAMostrar.size()){
		unUsuario.filtrar(recetasAMostrar.get(i))
		}
		decorado.postProcesar(unUsuario, recetasAMostrar)
	}
}