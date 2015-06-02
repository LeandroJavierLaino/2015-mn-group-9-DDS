package consulta

class MonitorVegano implements Monitor {
	
	int contador = 0
	
	override monitorear(Consulta consulta) {
		
		if(consulta.usuario.esVegano && consulta.recetas.exists[it.dificultad.equalsIgnoreCase("Alta")]) {
			contador++
			
			System.out.println(contador.toString)
		}
	}
	
	override mostrarResultados() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
}