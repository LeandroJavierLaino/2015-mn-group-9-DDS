package testeo

import java.util.Set
import java.util.List
import java.util.HashSet
import java.util.ArrayList
import org.junit.Before
import receta.Receta
import receta.Condimento
import receta.Ingrediente
import condicion.CondicionCeliaco
import condicion.CondicionDiabetico
import condicion.CondicionHipertenso
import condicion.CondicionVegano
import rutina.RutinaActiva
import rutina.RutinaSedentaria
import repositorioRecetas.RepositorioRecetas
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class TestInstances{
	Receta recetaAntiVegano //antiVegano
	Receta recetaAntiDiabetico //antiDiabetico
	Receta recetaParaCualquiera //Apta para Todo Publico
	Receta recetaSinIngrediente
	Receta recetaCaloriasBajoRango
	Receta recetaCaloriasMayorRango
	RutinaActiva rutinaCorta
	RutinaActiva rutinaLarga
	RutinaSedentaria rutinaSedentaria
	Condimento azucar
	Condimento caldo
	Condimento ajiMolido
	Condimento pimienta
	Ingrediente cuadril
	Ingrediente huevos
	Ingrediente cebollas
	Ingrediente chori
	Set<Ingrediente> ingredientesVacios = emptySet
	RepositorioRecetas repo	//TODO: todavia sin uso definido
	CondicionCeliaco celiaco
	CondicionDiabetico diabetico
	CondicionHipertenso hipertenso
	CondicionVegano vegano
	Set<Condimento> condimentosParaCualquiera = new HashSet<Condimento>
	Set<Condimento> condimentosAntiDiabetico = new HashSet<Condimento>
	Set<Ingrediente> ingredientesParaCualquiera = new HashSet<Ingrediente>
	Set<Ingrediente> ingredientesAntiVegano = new HashSet<Ingrediente>
	List<String> preparacionDefault = new ArrayList<String>
	List<Receta> listaRecetasTriple = new ArrayList<Receta>
	List<Receta> listaRecetasVeganoYCualquiera = new ArrayList<Receta>
	List<Receta> listaRecetasCualquieraYVegano = new ArrayList<Receta>
	List<Receta> listaRecetasCualquieraYDiabetico = new ArrayList<Receta>
	List<Receta> listaRecetasDiabeticoYCualquiera = new ArrayList<Receta>
	List<Receta> listaRecetasVeganoYDobleCualquiera = new ArrayList<Receta>
	



	@Before
	def void init() {
		celiaco = new CondicionCeliaco
		diabetico = new CondicionDiabetico
		hipertenso = new CondicionHipertenso
		vegano = new CondicionVegano
		azucar = new Condimento("Azucar", 150, "grs")
		chori = new Ingrediente("Chori", 2, "unidades")
		caldo = new Condimento("Caldo", 0, "cantidad necesaria")
		ajiMolido = new Condimento("Aji Molido", 0, "cantidad necesaria")
		pimienta = new Condimento("Pimienta", 0, "cantidad necesaria")
		cuadril = new Ingrediente("Cuadril", 3, "kgs")
		huevos = new Ingrediente("Huevos", 20, "unidades")
		cebollas = new Ingrediente("Cebollas", 1, "kgs")
		condimentosParaCualquiera.add(ajiMolido)
		condimentosAntiDiabetico.add(azucar)
		ingredientesParaCualquiera.add(cebollas)
		ingredientesAntiVegano.add(chori)
		preparacionDefault.add("paso")

		recetaAntiVegano = new Receta("antiVegano",ingredientesAntiVegano,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		recetaAntiVegano.cantidadMinimaCalorias = 2 //esta hardcodeado
		recetaAntiDiabetico = new Receta("antiDiabetico",ingredientesParaCualquiera,condimentosAntiDiabetico,preparacionDefault,250,
			"Media","Invierno")
		recetaParaCualquiera = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		recetaSinIngrediente = new Receta("default",ingredientesVacios,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		recetaCaloriasBajoRango = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,0,
			"Baja","Verano")
		recetaCaloriasMayorRango = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,100000000,
			"Baja","Verano")
			
		listaRecetasTriple.add(recetaAntiVegano)
		listaRecetasTriple.add(recetaAntiDiabetico)
		listaRecetasTriple.add(recetaParaCualquiera)
		
		listaRecetasVeganoYCualquiera.add(recetaAntiVegano)
		listaRecetasVeganoYCualquiera.add(recetaParaCualquiera)
		
		listaRecetasCualquieraYVegano.add(recetaParaCualquiera)
		listaRecetasCualquieraYVegano.add(recetaAntiVegano)
		
		listaRecetasDiabeticoYCualquiera.add(recetaAntiDiabetico)
		listaRecetasDiabeticoYCualquiera.add(recetaParaCualquiera)
		
		listaRecetasVeganoYDobleCualquiera.add(recetaAntiVegano)
		listaRecetasVeganoYDobleCualquiera.add(recetaParaCualquiera)
		listaRecetasVeganoYDobleCualquiera.add(recetaParaCualquiera)
		
			
		rutinaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaLarga = new RutinaActiva => [
			tiempo = 40
		]
		
		rutinaSedentaria = new RutinaSedentaria => [
			tiempo = 10
		]
		

		}
}