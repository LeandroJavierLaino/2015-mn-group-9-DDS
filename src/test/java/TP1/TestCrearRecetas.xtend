package TP1

import ar.edu.domain.excepcion.RecetaInvalidaExcepcion
import org.junit.Test
import testeo.UsuariosExtras

//Punto 3 CREAR RECETAS

	/* 
	Casos de Prueba
	
	Receta s/ingrediente						RecetaInvalidaExcepcion
	Receta c/ingrediente y CALORIAS<10			CondPreexistenteExcepcion
	Receta c/ingrediente y 5000<CALORIAS		CondPreexistenteExcepcion
	Receta c/ingrediente y 10<CALORIAS<5000		Good	(x2)
	*/

//Nuevas excepciones modificadas
	
class TestCrearRecetas extends UsuariosExtras{
	
	@Test(expected=typeof(RecetaInvalidaExcepcion)) //sin Ingrediente
	def void leandroCreaReceta() {
		recetaSinIngrediente.crearReceta(leandro)
	}

	@Test(expected=typeof(RecetaInvalidaExcepcion)) //calorias Fuera de Rango (menor)
	def void eriCreaReceta() {
		recetaCaloriasBajoRango.crearReceta(eri)
	}

	@Test(expected=typeof(RecetaInvalidaExcepcion)) //calorias Fuera de Rango (mayor)
	def void crearReceta() {
		
		recetaCaloriasMayorRango.crearReceta(diego)
	}

	@Test
	def void nicolasCreaReceta() {
		getRecetaAntiVegano.crearReceta(nicolas)
	}

	@Test
	def void pabloCreaReceta() {
		getRecetaAntiDiabetico.crearReceta(pablo)
	}
}