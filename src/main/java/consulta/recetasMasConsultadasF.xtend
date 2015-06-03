package consulta

import java.util.Map
import java.util.HashMap
import receta.Receta
import java.util.List

class recetasMasConsultadasF {
	boolean encendido = false
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	Consulta consultaActual
	
	def void activarRecetasMasConsultadasF(List<Consulta> posteos){
		while(encendido){
			if(!posteos.isEmpty)
			{
				consultaActual = posteos.remove(0)
				
			if(consultaActual.usuario.sexo != null && consultaActual.usuario.sexo.equalsIgnoreCase('F')) {
			
			consultaActual.recetas.forEach[ receta |
			
			
				if(contadorDeRecetas.containsKey(receta)) {
					
					contadorDeRecetas.put(receta, contadorDeRecetas.get(receta) + 1) 
				}
				else {
					contadorDeRecetas.put(receta, 1)
				}
							]
		}
		}
		}
	}
		
	def String mostrarResultados() {	
	encendido = true	
	contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato			
	}
}