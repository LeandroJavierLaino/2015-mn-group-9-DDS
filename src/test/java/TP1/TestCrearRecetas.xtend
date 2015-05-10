package TP1

import excepcion.BusinessException
import org.junit.Test
import testeo.TestInstances

//Punto 3 CREAR RECETAS

	/* 
	Casos de Prueba
	
	Receta s/ingrediente						BusinessException
	Receta c/ingrediente y CALORIAS<10			BusinessException
	Receta c/ingrediente y 5000<CALORIAS		BusinessException
	Receta c/ingrediente y 10<CALORIAS<5000		Good	(x2)
	*/
	
class TestCrearRecetas extends TestInstances{
	
	@Test(expected=typeof(BusinessException)) //sin Ingrediente
	def void leandroCreaReceta() {
		recetaSinIngrediente.crearReceta(leandro)
	}

	@Test(expected=typeof(BusinessException)) //calorias Fuera de Rango (menor)
	def void eriCreaReceta() {
		recetaCaloriasBajoRango.crearReceta(eri)
	}

	@Test(expected=typeof(BusinessException)) //calorias Fuera de Rango (mayor)
	def void crearReceta() {
		
		recetaCaloriasMayorRango.crearReceta(diego)
	}

	@Test
	def void nicolasCreaReceta() {
		receta1.crearReceta(nicolas)
	}

	@Test
	def void pabloCreaReceta() {
		receta2.crearReceta(pablo)
	}
}