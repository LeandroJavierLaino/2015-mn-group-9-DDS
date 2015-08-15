package consulta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import java.util.Set

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
	
	def void monitorear(Consulta post){
		monitores.forEach[monitorear(post)]
	}
}