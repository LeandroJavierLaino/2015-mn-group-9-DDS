package TP1

import org.junit.Test
import testeo.TestUsers
import excepcion.SinPermisosExcepcion

//Punto 5 RECETA CON SUBRECETAS
	
	/* 
	Casos de Prueba
	
	Usuario crea Receta con SubRecetas sin permisos			SinPermisosExcepcion
	Usuario crea Receta con SubRecetas						Good
	*/

//Nuevas excepciones modificadas
		
class TestRecetaConSubrecetas extends TestUsers{
	
	@Test(expected = typeof(SinPermisosExcepcion)) //no tiene Permisos
	def void construirRecetasConSubRecetasSinPermisos(){
		recetaAntiVegano.crearReceta(diego)
		recetaParaCualquiera.crearReceta(eri)
		diego.agregarRecetaAUnaPrincipal(recetaAntiVegano, recetaParaCualquiera)		
	}
	
	@Test
	def void construirRecetasConSubRecetasConPermisos(){
		recetaAntiVegano.crearReceta(diego)
		recetaParaCualquiera.crearReceta(diego)
		diego.agregarRecetaAUnaPrincipal(recetaAntiVegano, recetaParaCualquiera)
	}
}