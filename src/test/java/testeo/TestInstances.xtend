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
import cosasUsuario.Usuario
import org.joda.time.LocalDate

@Accessors
class TestInstances {
	Usuario eri
	Usuario leandro
	Usuario diego
	Usuario nicolas
	Usuario pablo
	
	Usuario usuarioSinSexo //sin sexo
	Usuario usuarioSinDatos //sin datos
	Usuario usuarioNombreCortoEIMCMayorA30 //nombre corto		//IMC > 30
	Usuario usuarioSinAltura //sin altura
	Usuario usuarioSinPeso //sin peso
	Usuario usuarioFechaFuturaEIMCMenorA18 //fecha futura		//IMC < 18
	Usuario usuarioSinRutina //sin rutina
	Usuario usuarioVeganoLeGustaPolloYNoLaFruta //le gusta el pollo	//no le gusta la fruta
	Usuario usuarioVeganoValidoYLeGustaLaFruta //valido				//le gusta la fruta
	Usuario usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio //sin preferen	//tiene rutina activa c/ej adicional
	Usuario usuarioHipertensoValidoConRutinaActivaYSinEjercicio //valido			//tiene rutina activa s/ej adicional
	Usuario usuarioHipertensoValidoConRutinaSedentaria //valido			//tiene rutina sedentaria
	Usuario usuarioDiabeticoSinSexoMasDe70KgYActivo //sin sexo 		//mas de 70kg pero activo
	Usuario usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo //sin preferen 	//menos de 70kg y activo
	Usuario usuarioDiabeticoValidoMasDe70KgYSedentario //valido			//mas de 70kg y sedentario
	Usuario usuarioDiabeticoValidoMenosDe70KgYSedentario //valido			//menos de 70kg y sedentario
	Usuario usuarioCeliacoValido //valido
		
	Receta recetaAntiVegano //antiVegano
	Receta recetaAntiDiabetico //antiDiabetico
	Receta recetaParaCualquiera //Apta para Todo Publico
	Receta recetaSinIngrediente
	Receta recetaCaloriasBajoRango
	Receta recetaCaloriasMayorRango
	
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

		recetaAntiVegano = new Receta("antiVegano",ingredientesAntiVegano,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
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
			
		rutinaActivaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaActivaLarga = new RutinaActiva => [
			tiempo = 40
		]
		
		rutinaSedentaria = new RutinaSedentaria => [
			tiempo = 10
		]
		
		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1988,6,27)
			altura = 1.74
			peso = 70
			rutina = rutinaActivaCorta
			recetas.add(recetaAntiDiabetico)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.52
			peso = 60
			rutina = rutinaActivaLarga
			recetas.add(recetaParaCualquiera)
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.70
			peso = 65
			rutina = rutinaActivaCorta
		]

		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = 'M'
			fechaDeNacimiento = new LocalDate(1980,11,10)
			altura = 1.74
			peso = 60
			rutina = rutinaActivaLarga
			condicionesPreexistentes = emptyList
			comidasQueDisgustan.add(ajiMolido)	
		]

		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1980,2,2)
			altura = 1.79
			peso = 72
			rutina = rutinaActivaCorta
			
		]

		usuarioSinSexo = new Usuario => [
			nombre = "Manu"
			sexo = ""
			fechaDeNacimiento = new LocalDate(1980,11,12)
			altura = 1.76
			peso = 70
			rutina = rutinaActivaCorta
		]

		usuarioSinDatos = new Usuario => [
			sexo = "M"
		]

		usuarioNombreCortoEIMCMayorA30 = new Usuario => [
			nombre = "ari"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1991,10,20)
			altura = 1.45
			peso = 197
			rutina = rutinaActivaCorta
		]

		usuarioSinAltura = new Usuario => [
			nombre = "juanse"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2001,10,10)
			altura = 0
			peso = 99
			rutina = rutinaActivaCorta
		]

		usuarioSinPeso = new Usuario => [
			nombre = "Marta"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2021,11,10)
			altura = 1.70
			peso = 0
			rutina = rutinaActivaCorta
		]

		usuarioFechaFuturaEIMCMenorA18 = new Usuario => [
			nombre = "Florencia"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2090,11,10)
			altura = 2.10
			peso = 40
			rutina = rutinaActivaCorta
		]

		usuarioSinRutina = new Usuario => [
			nombre = "Paula"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2090,5,23)
			altura = 1.70
			peso = 67
		]

		usuarioVeganoLeGustaPolloYNoLaFruta = new Usuario => [
			nombre = "VeganoUno"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2021,11,04)
			peso = 67
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Pollo")
			agregarCondicion(vegano)
		]

		usuarioVeganoValidoYLeGustaLaFruta = new Usuario => [
			nombre = "VeganoDos"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Fruta")
			agregarCondicion(vegano)
		]

		usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = new Usuario => [
			nombre = "HipertensoUno"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaActivaLarga
			agregarCondicion(hipertenso)
		]

		usuarioHipertensoValidoConRutinaActivaYSinEjercicio = new Usuario => [
			nombre = "HipertensoDos"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Carne")
			agregarCondicion(hipertenso)
		]
		
		usuarioHipertensoValidoConRutinaSedentaria = new Usuario => [
			nombre = "HipertensoTres"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Pollo")
			agregarCondicion(hipertenso)
		]

		usuarioDiabeticoSinSexoMasDe70KgYActivo = new Usuario => [
			nombre = "DiabeticoUno"
			sexo = ""
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 80
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Carne")
			agregarCondicion(diabetico)
		]

		usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo = new Usuario => [
			nombre = "DiabeticoDos"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaActivaLarga
			agregarCondicion(diabetico)
		]

		usuarioDiabeticoValidoMasDe70KgYSedentario = new Usuario => [
			nombre = "DiabeticoTres"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 78
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Pollo")
			agregarCondicion(diabetico)
		]
		
		usuarioDiabeticoValidoMenosDe70KgYSedentario = new Usuario => [
			nombre = "DiabeticoCuatro"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 65
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Fruta")
			agregarCondicion(diabetico)
		]

		usuarioCeliacoValido = new Usuario => [
			nombre = "Celiaco"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 78
			rutina = rutinaActivaCorta
			agregarCondicion(celiaco)
		]
		
		grupoDeLaMuerte = new GrupoUsuario => [
			agregarUsuario(leandro)
			agregarUsuario(diego)
			palabrasClave.add(azucar)
			palabrasClave.add(ajiMolido)
			palabrasClave.add(cebollas)
		]
		
		grupoFlojito = new GrupoUsuario => [
			agregarUsuario(eri)
			agregarUsuario(pablo)
			agregarUsuario(nicolas)
			palabrasClave.add(azucar)
		]		
		
	}
}