package consulta

class MonitorVegano implements Monitor {
	
	int contador = 0
	
	override monitorear(Consulta consulta) {
		
		if(consulta.usuario.esVegano && consulta.recetas.exists[it.veryDifficult]) {
			contador++
		}
	}
	
	override mostrarResultados() {
		contador.toString
	}
	
	
	
}