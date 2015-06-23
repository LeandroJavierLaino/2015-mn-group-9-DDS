package consulta

interface Monitor {
	def void monitorear(Consulta consulta)
	def String mostrarResultados()
}