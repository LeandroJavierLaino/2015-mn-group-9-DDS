package consulta

import java.util.List
import org.joda.time.DateTime

class recetasPorHora {
	
	DateTime localtime = new DateTime()
	int hora = localtime.getHourOfDay()
	
	int[] contadorHoras = newIntArrayOfSize(24)
	Consulta consultaActual
	
	def void activarRecetasPorHora(List<Consulta> posteos){
		while(true){
			if(!posteos.isEmpty)
			{
				consultaActual = posteos.remove(0)
				
		localtime = DateTime.now
		hora = localtime.getHourOfDay()
		
		if(contadorHoras.indexOf(hora).equals(null) ) {
			contadorHoras.set(hora, 1)
						
//			System.out.println(contadorHoras.indexOf(contadorHoras.max).toString)
		}
		else {
			contadorHoras.set(hora, contadorHoras.get(hora) + 1)
			
			
//			System.out.println(contadorHoras.indexOf(contadorHoras.max).toString)
		}
		}
		}
	}
		def String  mostrarResultados() {
		contadorHoras.indexOf(contadorHoras.max).toString
	}
}