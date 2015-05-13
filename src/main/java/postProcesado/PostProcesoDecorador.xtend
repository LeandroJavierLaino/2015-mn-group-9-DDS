package postProcesado

import receta.Receta
import java.util.List
import cosasUsuario.Usuario

abstract class PostProcesoDecorador implements PostProceso {
	public PostProceso decorado
	
	new(PostProceso postProceso){
		decorado = postProceso
	}
	
	override postProcesar(Usuario unUsuario, List <Receta> recetasAMostrar){
		decorado.postProcesar(unUsuario, recetasAMostrar)
	}
	
}