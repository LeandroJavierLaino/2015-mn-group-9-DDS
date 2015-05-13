package postProcesado

import java.util.List
import receta.Receta
import excepcion.ExceptionReceta
import cosasUsuario.Usuario

class PostProcesoPosta implements PostProceso {
	
	override postProcesar(Usuario unUsuario, List <Receta> recetasAMostrar) {
		if(recetasAMostrar.isEmpty){
		throw new ExceptionReceta("no se obtuvo ninguna receta")
		}
	}
}