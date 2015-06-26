package consulta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import java.util.Set
import java.util.ArrayList
import java.util.List
import command.CommandConsulta

@Accessors
class GestorDeConsultas {
	
	static GestorDeConsultas instance = null
	
	static def getInstance() {
		if(instance == null) {
			instance = new GestorDeConsultas()
		}
		else {
			instance
		}
	}
	
	Set<Monitor> monitores = new HashSet<Monitor>
	List<CommandConsulta> commands = new ArrayList<CommandConsulta>
	List<Consulta> consultasAEjecutar = new ArrayList<Consulta>
	
	def void monitorear(Consulta post){
		monitores.forEach[monitorear(post)]
		consultasAEjecutar.add(post)
	}
	
	def void ejecutarJob(){
		consultasAEjecutar.forEach [ consulta |
			commands.forEach[command | command.execute(consulta)]
		]
		consultasAEjecutar.clear
	}
}