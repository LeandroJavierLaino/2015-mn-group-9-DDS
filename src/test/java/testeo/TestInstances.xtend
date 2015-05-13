package testeo

import java.util.Set
import java.util.List
import java.util.HashSet
import java.util.ArrayList
import org.junit.Before
import cosasUsuario.Usuario
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
import org.joda.time.LocalDate
import filtro.FiltroPosta
import filtro.FiltroConCondicion
import filtro.FiltroSobrepeso
import postProcesado.PostProcesoPosta
import postProcesado.PostProcesoOrdenadoCalor
import postProcesado.PostProcesoResultadosPares

@Accessors
abstract class TestInstances {
	Usuario eri
	Usuario leandro
	Usuario diego
	Usuario nicolas
	Usuario pablo
	Usuario usrValid1 //sin sexo
	Usuario usrInval1 //sin datos
	Usuario usrInval2 //nombre corto		//IMC > 30
	Usuario usrInval3 //sin altura
	Usuario usrInval4 //sin peso
	Usuario usrInval5 //fecha futura		//IMC < 18
	Usuario usrInval6 //sin rutina
	Usuario usrVegano1 //le gusta el pollo	//no le gusta la fruta
	Usuario usrVegano2 //valido				//le gusta la fruta
	Usuario usrHipertenso1 //sin preferen	//tiene rutina activa c/ej adicional
	Usuario usrHipertenso2 //valido			//tiene rutina activa s/ej adicional
	Usuario usrHipertenso3 //valido			//tiene rutina sedentaria
	Usuario usrDiabetico1 //sin sexo 		//mas de 70kg pero activo
	Usuario usrDiabetico2 //sin preferen 	//menos de 70kg y activo
	Usuario usrDiabetico3 //valido			//mas de 70kg y sedentario
	Usuario usrDiabetico4 //valido			//menos de 70kg y sedentario
	Usuario usrCeliaco //valido
	Receta receta1 //antiVegano
	Receta receta2 //antiDiabetico
	Receta receta3 //Apta para Todo Publico
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
	List<Receta> listaRecetas1 = new ArrayList<Receta>
	List<Receta> listaRecetas2 = new ArrayList<Receta>
	List<Receta> listaRecetas3 = new ArrayList<Receta>
	List<Receta> listaRecetas4 = new ArrayList<Receta>
	
	
	FiltroPosta filtroPos
	FiltroConCondicion filtroCond
	FiltroSobrepeso filtroSobrep
	PostProcesoPosta postProcesoPosta
	PostProcesoOrdenadoCalor postProcesoOrdenadoCalor
	PostProcesoResultadosPares postProcesoResultadosPares
	
	

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

		receta1 = new Receta("antiVegano",ingredientesAntiVegano,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		receta2 = new Receta("antiDiaPosbetico",ingredientesParaCualquiera,condimentosAntiDiabetico,preparacionDefault,250,
			"Media","Invierno")
		receta3 = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		recetaSinIngrediente = new Receta("default",ingredientesVacios,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")
		recetaCaloriasBajoRango = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,0,
			"Baja","Verano")
		recetaCaloriasMayorRango = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,100000000,
			"Baja","Verano")
			
		listaRecetas1.add(receta1)
		listaRecetas1.add(receta2)
		listaRecetas1.add(receta3)
		
		listaRecetas2.add(receta1)
		listaRecetas2.add(receta3)
		
		listaRecetas3.add(receta3)
		listaRecetas3.add(receta1)
		
		listaRecetas4.add(receta1)
		listaRecetas4.add(receta3)
		listaRecetas4.add(receta3)
		
			
		rutinaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaLarga = new RutinaActiva => [
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
			rutina = rutinaCorta
			recetas.add(receta2)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.52
			peso = 60
			rutina = rutinaLarga
			recetas.add(receta3)
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.70
			peso = 65
			rutina = rutinaCorta
			
		]

		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = 'M'
			fechaDeNacimiento = new LocalDate(1980,11,10)
			altura = 1.74
			peso = 60
			rutina = rutinaLarga
			condicionesPreexistentes = emptyList	
		]

		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1980,2,2)
			altura = 1.79
			peso = 72
			rutina = rutinaCorta
			
		]

		usrValid1 = new Usuario => [
			nombre = "Manu"
			sexo = ""
			fechaDeNacimiento = new LocalDate(1980,11,12)
			altura = 1.76
			peso = 70
			rutina = rutinaCorta
		]

		usrInval1 = new Usuario => [
			sexo = "M"
		]

		usrInval2 = new Usuario => [
			nombre = "ari"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1991,10,20)
			altura = 1.45
			peso = 197
			rutina = rutinaCorta
		]

		usrInval3 = new Usuario => [
			nombre = "juanse"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2001,10,10)
			altura = 0
			peso = 99
			rutina = rutinaCorta
		]

		usrInval4 = new Usuario => [
			nombre = "Marta"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2021,11,10)
			altura = 1.70
			peso = 0
			rutina = rutinaCorta
		]

		usrInval5 = new Usuario => [
			nombre = "Florencia"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2090,11,10)
			altura = 2.10
			peso = 40
			rutina = rutinaCorta
		]

		usrInval6 = new Usuario => [
			nombre = "Paula"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2090,5,23)
			altura = 1.70
			peso = 67
		]

		usrVegano1 = new Usuario => [
			nombre = "VeganoUno"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2021,11,04)
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Pollo")
			agregarCondicion(vegano)
		]

		usrVegano2 = new Usuario => [
			nombre = "VeganoDos"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Fruta")
			agregarCondicion(vegano)
		]

		usrHipertenso1 = new Usuario => [
			nombre = "HipertensoUno"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			agregarCondicion(hipertenso)
		]

		usrHipertenso2 = new Usuario => [
			nombre = "HipertensoDos"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Carne")
			agregarCondicion(hipertenso)
		]
		
		usrHipertenso3 = new Usuario => [
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

		usrDiabetico1 = new Usuario => [
			nombre = "DiabeticoUno"
			sexo = ""
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 80
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("Carne")
			agregarCondicion(diabetico)
		]

		usrDiabetico2 = new Usuario => [
			nombre = "DiabeticoDos"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			agregarCondicion(diabetico)
		]

		usrDiabetico3 = new Usuario => [
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
		
		usrDiabetico4 = new Usuario => [
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

		usrCeliaco = new Usuario => [
			nombre = "Celiaco"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 78
			rutina = rutinaCorta
			agregarCondicion(celiaco)
		]
		
		filtroPos = new FiltroPosta
		filtroCond = new FiltroConCondicion(new FiltroPosta)
		filtroSobrep = new FiltroSobrepeso(new FiltroConCondicion(new FiltroPosta))
		
		postProcesoPosta = new PostProcesoPosta
		postProcesoOrdenadoCalor = new PostProcesoOrdenadoCalor(new PostProcesoPosta)
		postProcesoResultadosPares = new PostProcesoResultadosPares(new PostProcesoPosta)
	}
}