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
	FiltroPosta filtroPosta
	FiltroConCondicion filtroCondicionPreex
	FiltroSobrepeso filtroSobrepeso
	PostProcesoPosta postProcesoPosta
	PostProcesoOrdenadoCalor postProcesoOrdenadoCalorias
	PostProcesoResultadosPares postProcesoResultadosPares
		
@Before
	override void init() {
		super.init()
		
		filtroPosta = new FiltroPosta
		filtroCondicionPreex = new FiltroConCondicion(new FiltroPosta)
		filtroSobrepeso = new FiltroSobrepeso(new FiltroConCondicion(new FiltroPosta))
		
		postProcesoPosta = new PostProcesoPosta
		postProcesoOrdenadoCalorias = new PostProcesoOrdenadoCalor(new PostProcesoPosta)
		postProcesoResultadosPares = new PostProcesoResultadosPares(new PostProcesoPosta)
	}
}