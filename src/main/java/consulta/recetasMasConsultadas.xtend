package consulta

import java.util.List
import java.util.Map
import java.util.HashMap
import receta.Receta

class recetasMasConsultadas {
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	Consulta consultaActual
	
	def void activarRecetasMasConsultadas(List<Consulta> posteos){
		while(true){
			if(!posteos.isEmpty)
			{
				consultaActual = posteos.remove(0)
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
		def String mostrarResultados() {
//		System.out.println(contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato)
		contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato
		}
	
}