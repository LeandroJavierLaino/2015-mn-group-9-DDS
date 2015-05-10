package TP1

import excepcion.BusinessException
import org.junit.Test
import testeo.TestInstances

//Punto 5 RECETA CON SUBRECETAS
	
	/* 
	Casos de Prueba
	
	Usuario crea Receta con SubRecetas sin permisos			BusinessException
	Usuario crea Receta con SubRecetas						Good
	*/
	
	
class TestRecetaConSubrecetas extends TestInstances{
	
	@Test(expected = typeof(BusinessException)) //no tiene Permisos
	def void construirRecetasConSubRecetasSinPermisos(){
		receta1.crearReceta(diego)
		receta3.crearReceta(eri)
		diego.agregarRecetaAUnaPrincipal(receta1, receta3)		
	}
	
	@Test
	def void construirRecetasConSubRecetasConPermisos(){
		receta1.crearReceta(diego)
		receta3.crearReceta(diego)
		diego.agregarRecetaAUnaPrincipal(receta1, receta3)
	}
}