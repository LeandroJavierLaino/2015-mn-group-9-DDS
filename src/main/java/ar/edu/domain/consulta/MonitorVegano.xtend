package ar.edu.domain.consulta

class MonitorVegano implements Monitor {
	
	int contador = 0
	
	override monitorear(Consulta consulta) {
		
		if(consulta.usuario.esVegano && consulta.recetas.exists[it.esDificil]) {
			contador++
		}
	}
	
	override mostrarResultados() {
		contador.toString
		
	}
	
	
	
}