package consulta

import java.util.Map
import java.util.HashMap
import receta.Receta
import java.util.List

class recetasMasConsultadasM {
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	Consulta consultaActual
	
	def void activarRecetasMasConsultadasM(List<Consulta> posteos){
		while(true){
			if(!posteos.isEmpty)
			{
				consultaActual = posteos.remove(0)
				
			if(consultaActual.usuario.sexo != null && consultaActual.usuario.sexo.equalsIgnoreCase('M')) {
			
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
	contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato			
	}
}