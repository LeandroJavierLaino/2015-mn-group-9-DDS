package TP1

import org.junit.Test
import java.util.Set
import java.util.List
import java.util.HashSet
import java.util.ArrayList
import receta.Condimento
import receta.Ingrediente
import testeo.TestInstances
import excepcion.SinPermisosExcepcion

//Punto 5 RECETA CON SUBRECETAS
	
	/* 
	Casos de Prueba
	
	Usuario crea Receta con SubRecetas sin permisos			SinPermisosExcepcion
	Usuario crea Receta con SubRecetas						Good
	*/
		
class TestRecetaConSubrecetas extends TestInstances{
	
	@Test(expected = typeof(SinPermisosExcepcion)) //no tiene Permisos
	def void construirRecetasConSubRecetasSinPermisos(){
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		var recetaCompuesta = diego.crearReceta("RecetaDiego", ingredientes, condimentos, procesoPreparacion, 300, "Media", "Verano")
		var recetaSimple = eri.crearReceta("Pure", ingredientes, condimentos, procesoPreparacion, 300, "Media", "Verano")
		diego.agregarRecetaAUnaPrincipal(recetaCompuesta, recetaSimple)		
	}
	
	@Test
	def void construirRecetasConSubRecetasConPermisos(){
		val Set<Condimento> condimentos = new HashSet<Condimento>
		val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		val List<String> procesoPreparacion = new ArrayList<String>
		ingredientes.add(huevos)
		ingredientes.add(cebollas)
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		var recetaCompuesta = diego.crearReceta("RecetaDiego", ingredientes, condimentos, procesoPreparacion, 300, "Media", "Verano")
		var recetaSimple = diego.crearReceta("Pure", ingredientes, condimentos, procesoPreparacion, 300, "Media", "Verano")
		diego.agregarRecetaAUnaPrincipal(recetaCompuesta, recetaSimple)
	}
}