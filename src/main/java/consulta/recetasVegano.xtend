package consulta

import java.util.List

class recetasVegano {
	int contador = 0
	Consulta consultaActual
	
	def void activarRecetasVegano(List<Consulta> posteos){
		while(true){
			if(!posteos.isEmpty)
			{
				consultaActual = posteos.remove(0)
		if(consultaActual.usuario.esVegano && consultaActual.recetas.exists[it.veryDifficult]) {
		contador++
		}
	}
	}
	}
	
	def String mostrarResultados() {
		contador.toString
	}
}