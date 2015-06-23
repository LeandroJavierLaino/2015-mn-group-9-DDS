package consulta

import consulta.Monitor
import org.joda.time.DateTime

class MonitorHora implements Monitor {
	
	DateTime localtime = new DateTime()
	int hora = localtime.getHourOfDay()
	
	int[] contadorHoras = newIntArrayOfSize(24)

	
	override monitorear(Consulta consulta) {
		
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
	
	override mostrarResultados() {
		contadorHoras.indexOf(contadorHoras.max).toString
	}
	
}