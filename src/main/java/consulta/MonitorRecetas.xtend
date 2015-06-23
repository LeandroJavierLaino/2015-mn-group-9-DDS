package consulta

import java.util.HashMap
import java.util.Map
import receta.Receta

class MonitorRecetas implements Monitor {
	
//	Set<Receta> contadorDeRecetas
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	
	
	override monitorear(Consulta consulta) {
		consulta.recetas.forEach[ receta |		
			if(contadorDeRecetas.containsKey(receta)) {
				contadorDeRecetas.replace(receta, contadorDeRecetas.get(receta), contadorDeRecetas.get(receta) + 1) 
			}
			else {
				contadorDeRecetas.put(receta, 1)
			}
		]
			
	}
		
		override mostrarResultados() {
			//System.out.println(contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato)
			contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato
			
		}
		
}