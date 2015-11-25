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
import receta.CondimentoBuilder
import receta.IngredienteBuilder
import receta.Palabras

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
	
	List<Palabras> preparacionDefault = new ArrayList<Palabras>
	
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
		azucar = new CondimentoBuilder("Azucar", 150, "grs").build
		chori = new IngredienteBuilder("Chori", 2, "unidades").build
		caldo = new CondimentoBuilder("Caldo", 0, "cantidad necesaria").build
		ajiMolido = new CondimentoBuilder("Aji Molido", 0, "cantidad necesaria").build
		pimienta = new CondimentoBuilder("Pimienta", 0, "cantidad necesaria").build
		cuadril = new IngredienteBuilder("Cuadril", 3, "kgs").build
		huevos = new IngredienteBuilder("Huevos", 20, "unidades").build
		cebollas = new IngredienteBuilder("Cebollas", 1, "kgs").build
		condimentosParaCualquiera.add(ajiMolido)
		condimentosAntiDiabetico.add(azucar)
		ingredientesParaCualquiera.add(cebollas)
		ingredientesAntiVegano.add(chori)

		recetaAntiVegano = new RecetaBuilder()
		.nombre("antiVegano")
		.ingredientes(ingredientesAntiVegano)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build
		
		recetaAntiDiabetico = new RecetaBuilder()
		.nombre("antiDiabetico")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosAntiDiabetico)
		.instrucciones(preparacionDefault)
		.conCalorias(250)
		.dificultad("Media")
		.temporada("Invierno")
		.build
		
		recetaParaCualquiera = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build
		
		recetaSinIngrediente = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesVacios)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build
		
		recetaCaloriasBajoRango = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(0)
		.dificultad("Baja")
		.temporada("Verano")
		.build
		
		recetaCaloriasMayorRango = new RecetaBuilder()
		.nombre("default")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(100000000)
		.dificultad("Baja")
		.temporada("Verano")
		.build
		
		recetaSalchiPapa = new RecetaBuilder()
		.nombre("SalchiPapa")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Baja")
		.temporada("Verano")
		.build
				
		recetaPolloAlOreganato = new RecetaBuilder()
		.nombre("Pollo al Oreganato")
		.ingredientes(ingredientesAntiVegano)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("Alta")
		.temporada("Invierno")
		.build
		
		recetaLaComidaMasOrganicaDelMundo = new RecetaBuilder()
		.nombre("Ensalada")
		.ingredientes(ingredientesParaCualquiera)
		.condimentos(condimentosParaCualquiera)
		.instrucciones(preparacionDefault)
		.conCalorias(150)
		.dificultad("D")
		.temporada("Invierno")
		.build
			
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