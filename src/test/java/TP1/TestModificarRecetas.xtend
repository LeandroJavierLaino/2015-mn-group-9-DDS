package TP1

import org.junit.Test
import java.util.ArrayList
import java.util.HashSet
import receta.Condimento
import receta.Ingrediente
import testeo.TestInstances
import excepcion.SinPermisosExcepcion
import excepcion.RecetaInvalidaExcepcion

//Punto 4 MODIFICAR RECETAS

	/* 
	Casos de Prueba
	
	Usuario Modifica Receta Propia					Good
	Usuario Modifica Receta Ajena					SinPermisosExcepcion
	Usuario Modifica Receta y no da Nombre			RecetaInvalidaExcepcion 
	*/

//Nuevas excepciones modificadas

class TestModificarRecetas extends TestInstances{
	
		@Test
	def void leandroModificaReceta2() {
		val preparacionDefaultLean2 = new ArrayList<String>
		val condimentosLean2 = new HashSet<Condimento>
		val ingredientesLean2 = new HashSet<Ingrediente>
		ingredientesLean2.add(chori)
		condimentosLean2.add(caldo)
		preparacionDefaultLean2.add("pasoLean")
		leandro.modificarReceta(receta2,"defaultALaLean",ingredientesLean2,condimentosLean2,preparacionDefaultLean2,150,"Baja","Verano")
	}

		@Test(expected=typeof(SinPermisosExcepcion)) //no Tiene Permitido Modificar
	def void leandroModificaReceta3() {
		val preparacionDefaultLean3 = new ArrayList<String>
		val condimentosLean3 = new HashSet<Condimento>
		val ingredientesLean3 = new HashSet<Ingrediente>
		ingredientesLean3.add(chori)
		ingredientesLean3.add(cebollas)
		condimentosLean3.add(ajiMolido)
		preparacionDefaultLean3.add("pasoLean")
		leandro.modificarReceta(receta3,"antiDiabeticoPlus",ingredientesLean3,condimentosLean3,preparacionDefaultLean3,250,"Media","Invierno")
	}
	
		@Test(expected=typeof(RecetaInvalidaExcepcion)) //no Tiene Nombre. Receta sin nombre
	def void eriModificaReceta3() {
		val preparacionDefaultEri3 = new ArrayList<String>
		val condimentosEri3 = new HashSet<Condimento>
		val ingredientesEri3 = new HashSet<Ingrediente>
		ingredientesEri3.add(chori)
		condimentosEri3.add(ajiMolido)
		preparacionDefaultEri3.add("pasoEri")
		leandro.modificarReceta(receta3,"",ingredientesEri3,condimentosEri3,preparacionDefaultEri3,250,"Media","Invierno")
	}
	
}