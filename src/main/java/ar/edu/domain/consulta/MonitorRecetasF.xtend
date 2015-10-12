package ar.edu.domain.consulta

/*import consulta.MonitorRecetas*/
import java.util.Map
import ar.edu.domain.receta.Receta
import java.util.HashMap

class MonitorRecetasF extends MonitorRecetas {
	
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
		
	override monitorear(Consulta consulta) {
		
		if(consulta.usuario.sexo != null && consulta.usuario.sexo.equalsIgnoreCase('F')) {
			consulta.recetas.forEach[ receta |
	
				if(contadorDeRecetas.containsKey(receta)) {
					
					contadorDeRecetas.replace(receta, contadorDeRecetas.get(receta), contadorDeRecetas.get(receta) + 1) 
				}
				else {
					contadorDeRecetas.put(receta, 1)
				}
			]
		}
		
	}
		
	override mostrarResultados() {
			
		contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato
			
	}
}