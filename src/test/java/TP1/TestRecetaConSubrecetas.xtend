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