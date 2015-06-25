package command

import consulta.Consulta

interface CommandConsulta {
	def void execute(Consulta consulta)
}