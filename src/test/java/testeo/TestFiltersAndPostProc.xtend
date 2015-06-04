package testeo

import filtro.FiltroPosta
import filtro.FiltroConCondicion
import filtro.FiltroSobrepeso
import postProcesado.PostProcesoPosta
import postProcesado.PostProcesoOrdenadoCalor
import postProcesado.PostProcesoResultadosPares
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before

@Accessors
class TestFiltersAndPostProc extends TestUsers{
	FiltroPosta filtroPos
	FiltroConCondicion filtroCond
	FiltroSobrepeso filtroSobrep
	PostProcesoPosta postProcesoPosta
	PostProcesoOrdenadoCalor postProcesoOrdenadoCalor
	PostProcesoResultadosPares postProcesoResultadosPares
		
@Before
	override void init() {
		super.init()
		
		filtroPos = new FiltroPosta
		filtroCond = new FiltroConCondicion(new FiltroPosta)
		filtroSobrep = new FiltroSobrepeso(new FiltroConCondicion(new FiltroPosta))
		
		postProcesoPosta = new PostProcesoPosta
		postProcesoOrdenadoCalor = new PostProcesoOrdenadoCalor(new PostProcesoPosta)
		postProcesoResultadosPares = new PostProcesoResultadosPares(new PostProcesoPosta)
	}
}