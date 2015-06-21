package testeo

import condicion.CondicionCeliaco
import condicion.CondicionDiabetico
import condicion.CondicionHipertenso
import condicion.CondicionVegano
import cosasUsuario.GrupoUsuario
import filtro.FiltroPorCondicionesPreexistentes
import filtro.FiltroPorExcesoDeCalorias
import filtro.FiltroPorGusto
import filtro.FiltroPorSerCaros
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before
import receta.Condimento
import receta.Ingrediente
import receta.Receta
import repositorioRecetas.RepositorioRecetas
import rutina.RutinaActiva
import rutina.RutinaSedentaria
import receta.RecetaBuilder

@Accessors
class TestInstances {
	
		
	Receta recetaAntiVegano //antiVegano
	Receta recetaAntiDiabetico //antiDiabetico
	Receta recetaParaCualquiera //Apta para Todo Publico
	Receta recetaSinIngrediente
	Receta recetaCaloriasBajoRango
	Receta recetaCaloriasMayorRango
	
	Receta recetaSalchiPapa
	Receta recetaPolloAlOreganato
	Receta recetaLaComidaMasOrganicaDelMundo
	
	RutinaActiva rutinaActivaCorta
	RutinaActiva rutinaActivaLarga
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
	
	CondicionCeliaco celiaco
	CondicionDiabetico diabetico
	CondicionHipertenso hipertenso
	CondicionVegano vegano
	
	Set<Condimento> condimentosParaCualquiera = new HashSet<Condimento>
	Set<Condimento> condimentosAntiDiabetico = new HashSet<Condimento>
	Set<Ingrediente> ingredientesParaCualquiera = new HashSet<Ingrediente>
	Set<Ingrediente> ingredientesAntiVegano = new HashSet<Ingrediente>
	
	List<String> preparacionDefault = new ArrayList<String>
	
	GrupoUsuario grupoDeLaMuerte
	GrupoUsuario grupoFlojito
	
	RepositorioRecetas repo = RepositorioRecetas.getInstance
	
	FiltroPorCondicionesPreexistentes filtroPorCondicionesPreexistentes
	FiltroPorExcesoDeCalorias filtroPorExcesoCalorias
	FiltroPorGusto filtroPorGusto
	FiltroPorSerCaros filtroPorCaros

	double delta = 0.0000000001

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

		recetaAntiVegano = new RecetaBuilder()
		.nombre("antiVegano")
		.ingredientes(ingredientesAntiVegano)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("antiVegano", ingredientesAntiVegano, condimentosParaCualquiera, preparacionDefault,150, "Baja","Verano")
		
		recetaAntiDiabetico = new RecetaBuilder()
		.nombre("antiDiabetico")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosAntiDiabetico)
		.instrucciones(preparacionDefault)
		.conCalorias(250)
		.dificultad("Media")
		.temporada("Invierno")
		.build//new Receta("antiDiabetico", ingredientesParaCualquiera, condimentosAntiDiabetico, preparacionDefault,250, "Media","Invierno")
		
		recetaParaCualquiera = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,150, "Baja","Verano")
		
		recetaSinIngrediente = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesVacios)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("default",ingredientesVacios,condimentosParaCualquiera,preparacionDefault,150, "Baja","Verano")
		
		recetaCaloriasBajoRango = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(0)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,0, "Baja","Verano")
		
		recetaCaloriasMayorRango = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(100000000)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,100000000, "Baja","Verano")

		recetaSalchiPapa = new RecetaBuilder()
		.nombre("SalchiPapa")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build//new Receta("SalchiPapa", ingredientesParaCualquiera, condimentosParaCualquiera, preparacionDefault, 150, "Baja", "Verano")
		
		recetaPolloAlOreganato = new RecetaBuilder()
		.nombre("Pollo al Oreganato")
		.ingredientes(ingredientesAntiVegano)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Alta")
		.temporada("Invierno")
		.build//new Receta("Pollo al Oreganato", ingredientesAntiVegano, condimentosParaCualquiera, preparacionDefault, 150, "Alta", "Invierno")	
		
		recetaLaComidaMasOrganicaDelMundo = new RecetaBuilder()
		.nombre("Ensalada")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("D")
		.temporada("Invierno")
		.build//new Receta("Ensalada", ingredientesParaCualquiera, condimentosParaCualquiera, preparacionDefault, 150, "D", "Invierno")
			
		rutinaActivaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaActivaLarga = new RutinaActiva => [
			tiempo = 40
		]
		
		rutinaSedentaria = new RutinaSedentaria => [
			tiempo = 10
		]

		
	}
}