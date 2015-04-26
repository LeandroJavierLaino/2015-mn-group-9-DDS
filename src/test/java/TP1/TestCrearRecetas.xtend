package TP1

import org.junit.Test
import java.util.Set
import java.util.List
import java.util.HashSet
import java.util.ArrayList
import receta.Condimento
import receta.Ingrediente
import testeo.TestInstances
import excepcion.RecetaInvalidaExcepcion

//Punto 3 CREAR RECETAS

	/* 
	Casos de Prueba
	
	Receta s/ingrediente						RecetaInvalidaExcepcion
	Receta c/ingrediente y CALORIAS<10			CondPreexistenteExcepcion
	Receta c/ingrediente y 5000<CALORIAS		CondPreexistenteExcepcion
	Receta c/ingrediente y 10<CALORIAS<5000		Good	(x2)
	*/
	
class TestCrearRecetas extends TestInstances{
	
	@Test(expected=typeof(RecetaInvalidaExcepcion)) //sin Ingrediente
	def void leandroCreaReceta() {
		var Set<Condimento> condimentos = new HashSet<Condimento>
		var Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		var List<String> procesoPreparacion = new ArrayList<String>
		ingredientes = emptySet
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		leandro.crearReceta("RecetaLean", ingredientes, condimentos, procesoPreparacion, 450, "Media", "Verano")
	}

	@Test(expected=typeof(RecetaInvalidaExcepcion)) //calorias Fuera de Rango (menor)
	def void eriCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		eri.crearReceta("RecetaEri", ingredientes, condimentos, procesoPreparacion, 8, "Media", "Invierno")
	}

	@Test(expected=typeof(RecetaInvalidaExcepcion)) //calorias Fuera de Rango (mayor)
	def void crearReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		diego.crearReceta("RecetaDiego", ingredientes, condimentos, procesoPreparacion, 30000, "Media", "Verano")
	}

	@Test
	def void nicolasCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		nicolas.crearReceta("RecetaNico", ingredientes, condimentos, procesoPreparacion, 120, "Media", "Verano")
	}

	@Test
	def void pabloCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		pablo.crearReceta("RecetaPablo", ingredientes, condimentos, procesoPreparacion, 110, "Media", "Verano")
	}
}