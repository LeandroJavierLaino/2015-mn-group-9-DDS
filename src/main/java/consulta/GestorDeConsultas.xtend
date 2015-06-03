package consulta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class GestorDeConsultas {
	public List<Consulta> consultasRecetasPorHora = new ArrayList<Consulta>()
	public List<Consulta> consultasRecetasMasConsultadas = new ArrayList<Consulta>()
	public List<Consulta> consultasRecetasMasConsultadasM = new ArrayList<Consulta>()
	public List<Consulta> consultasRecetasMasConsultadasF = new ArrayList<Consulta>()
	public List<Consulta> consultasRecetasVeganos = new ArrayList<Consulta>()
	
	
	static GestorDeConsultas instance = null
	
	static def getInstance() {
		if(instance == null) {
			instance = new GestorDeConsultas()
		}
		else {
			instance
		}
	}
	
		def void realizar(Consulta post){
		consultasRecetasPorHora.add(post)
		consultasRecetasMasConsultadas.add(post)
		consultasRecetasMasConsultadasM.add(post)
		consultasRecetasMasConsultadasF.add(post)
		consultasRecetasVeganos.add(post)
	}
}