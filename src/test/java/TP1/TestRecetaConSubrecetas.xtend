package TP1

import org.junit.Test
import testeo.TestInstances
import excepcion.SinPermisosExcepcion

//Punto 5 RECETA CON SUBRECETAS
	
	/* 
	Casos de Prueba
	
	Usuario crea Receta con SubRecetas sin permisos			SinPermisosExcepcion
	Usuario crea Receta con SubRecetas						Good
	*/

//Nuevas excepciones modificadas
		
class TestRecetaConSubrecetas extends TestInstances{
	
	@Test(expected = typeof(SinPermisosExcepcion)) //no tiene Permisos
	def void construirRecetasConSubRecetasSinPermisos(){
		getRecetaAntiVegano.crearReceta(diego)
		getRecetaParaCualquiera.crearReceta(eri)
		diego.agregarRecetaAUnaPrincipal(getRecetaAntiVegano, getRecetaParaCualquiera)		
	}
	
	@Test
	def void construirRecetasConSubRecetasConPermisos(){
		getRecetaAntiVegano.crearReceta(diego)
		getRecetaParaCualquiera.crearReceta(diego)
		diego.agregarRecetaAUnaPrincipal(getRecetaAntiVegano, getRecetaParaCualquiera)
	}
}