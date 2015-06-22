package consulta

import consulta.MonitorRecetas
import java.util.Map
import receta.Receta
import java.util.HashMap
import command.CommandLogger

class MonitorRecetasF extends MonitorRecetas {
	
	Map<Receta, Integer> contadorDeRecetas = new HashMap<Receta, Integer>
	
	CommandLogger loguear
		
	override monitorear(Consulta consulta) {
		
		if(consulta.usuario.sexo != null && consulta.usuario.sexo.equalsIgnoreCase('F')) {
			consulta.recetas.forEach[ receta |
			
			
				if(contadorDeRecetas.containsKey(receta)) {
					
					contadorDeRecetas.replace(receta, contadorDeRecetas.get(receta), contadorDeRecetas.get(receta) + 1) 			
				}else {
					contadorDeRecetas.put(receta, 1)
				}
			]
		}
		
		if(resultadoDeConsultaMayorA100(contadorDeRecetas)){
				loguear.execute()
				//commandMonitor.execute()
		}
		
	}
		
	override mostrarResultados() {
			
		contadorDeRecetas.filter[p1, p2| p2.equals(contadorDeRecetas.values.max)].keySet.head.nombrePlato
		
			
	}
	
	
	//cantidad de recetas
	def resultadoDeConsultaMayorA100(Map <Receta,Integer> contadorDeRecetas){
		//acá hay que sacar el segundo campo y ver si supera a 100 
		
	}
}