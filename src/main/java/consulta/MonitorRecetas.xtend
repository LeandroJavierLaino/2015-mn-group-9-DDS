package consulta

import java.util.Set
import javax.json.JsonObject
import queComemos.entrega3.dominio.Receta

class MonitorRecetas implements Monitor {
	
	Set<Receta> contadorDeRecetas
//	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	JsonObject jsonReceta
		
	override monitorear(Consulta consulta) {
		
		consulta.recetas.forEach[ receta |
			
			
			
			/*if(contadorDeRecetas.exists[par | par.key.equals(receta)]) {
				parDeR = contadorDeRecetas.findFirst[par | par.key.equals(receta)]
				
				contadorDeRecetas.remove(parDeR)
				contadorDeRecetas.add(parDeR)
				
				var pos = contadorDeRecetas.size -1
				var nCant = parDeR.value + 1
				var <Receta, Integer> lpm = <receta, nCant>
				
				contadorDeRecetas.set(pos, nCant)
				
				
	
				
			}*/
			
			/*if(contadorDeRecetas.containsKey(it)) {
				
				contadorDeRecetas.replace(it, contadorDeRecetas.get(it), contadorDeRecetas.get(it) + 1) 
				
			}
			else {
				contadorDeRecetas.put(it, 1)
			}*/
		]
		
		
//		contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].forEach[p1, p2| p1.nombre].
		}
		
		override mostrarResultados() {
			throw new UnsupportedOperationException("TODO: auto-generated method stub")
		}
	
}