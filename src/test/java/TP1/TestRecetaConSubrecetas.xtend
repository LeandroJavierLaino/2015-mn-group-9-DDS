package TP1

import ar.edu.domain.excepcion.SinPermisosExcepcion
import org.junit.Before
import org.junit.Test
import testeo.Grupos

//Punto 5 RECETA CON SUBRECETAS
	
	/* 
	Casos de Prueba
	
	Usuario crea Receta con SubRecetas sin permisos			SinPermisosExcepcion
	Usuario crea Receta con SubRecetas						Good
	*/

//Nuevas excepciones modificadas
		
class TestRecetaConSubrecetas extends Grupos{
	
	@Before
	override void init() {
		super.init()
		recetaAntiVegano.crearReceta(diego)
	}
	
	@Test(expected = typeof(SinPermisosExcepcion)) //no tiene Permisos
	def void construirRecetasConSubRecetasSinPermisos(){
		getRecetaParaCualquiera.crearReceta(eri)
		diego.agregarRecetaAUnaPrincipal(getRecetaAntiVegano, getRecetaParaCualquiera)		
	}
	
	@Test
	def void construirRecetasConSubRecetasConPermisos(){
		getRecetaParaCualquiera.crearReceta(diego)
		diego.agregarRecetaAUnaPrincipal(getRecetaAntiVegano, getRecetaParaCualquiera)
	}
}