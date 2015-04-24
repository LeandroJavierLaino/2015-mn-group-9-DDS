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
import rutina.Rutina
import rutina.RutinaActiva
import repositorioRecetas.RepositorioRecetas
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class TestInstances {
	Usuario eri
	Usuario leandro
	Usuario diego
	Usuario nicolas
	Usuario pablo
	Usuario usrValid1 //sin sexo
	Usuario usrInval1 //sin datos
	Usuario usrInval2 //nombre corto
	Usuario usrInval3 //sin altura
	Usuario usrInval4 //sin peso
	Usuario usrInval5 //fecha futura
	Usuario usrInval6 //sin rutina
	Usuario usrVegano1 //le gusta el pollo	//no le gusta la fruta
	Usuario usrVegano2 //valido			//le gusta la fruta
	Usuario usrHipertenso1 //sin preferencia	//tiene rutina activa
	Usuario usrHipertenso2 //valido			//tiene rutina sedentaria
	Usuario usrDiabetico1 //sin sexo 			//mas de 70kg
	Usuario usrDiabetico2 //sin preferencia 	//menos de 70kg
	Usuario usrDiabetico3 //valido
	Usuario usrCeliaco //valido
	Receta receta1 //antiVegano
	Receta receta2 //antiDiabetico
	Receta receta3 //Apta para Todo Publico
	Rutina rutinaCorta
	Rutina rutinaLarga
	Condimento azucar
	Condimento caldo
	Condimento ajiMolido
	Condimento pimienta
	Ingrediente cuadril
	Ingrediente huevos
	Ingrediente cebollas
	Ingrediente chori
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
		receta2 = new Receta("antiDiabetico",ingredientesParaCualquiera,condimentosAntiDiabetico,preparacionDefault,250,
			"Media","Invierno")
		receta3 = new Receta("default",ingredientesParaCualquiera,condimentosParaCualquiera,preparacionDefault,150,
			"Baja","Verano")



		rutinaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaLarga = new RutinaActiva => [
			tiempo = 40
		]

		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "M"
			fechaDeNacimiento = 19880627
			altura = 1.74
			peso = 70
			rutina = rutinaCorta
			recetas.add(receta2)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = 19800101
			altura = 1.52
			peso = 60
			rutina = rutinaLarga
			recetas.add(receta3)
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = "M"
			fechaDeNacimiento =19800101
			altura = 1.70
			peso = 65
			rutina = rutinaCorta
			
		]

		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = 'M'
			fechaDeNacimiento = 19801110
			altura = 1.74
			peso = 60
			rutina = rutinaLarga
			condicionesPreexistentes = emptyList	
		]

		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = "M"
			fechaDeNacimiento = 19800202
			altura = 1.79
			peso = 72
			rutina = rutinaCorta
			
		]

		usrValid1 = new Usuario => [
			nombre = "Manu"
			sexo = ""
			fechaDeNacimiento = 19801112
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
			fechaDeNacimiento = 19911020
			altura = 1.45
			peso = 197
			rutina = rutinaCorta
		]

		usrInval3 = new Usuario => [
			nombre = "juanse"
			sexo = "M"
			fechaDeNacimiento = 20011010
			altura = 0
			peso = 99
			rutina = rutinaCorta
		]

		usrInval4 = new Usuario => [
			nombre = "Marta"
			sexo = "F"
			fechaDeNacimiento = 20012010
			altura = 1.70
			peso = 0
			rutina = rutinaCorta
		]

		usrInval5 = new Usuario => [
			nombre = "Florencia"
			sexo = "F"
			fechaDeNacimiento = 20901110
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
		]

		usrInval6 = new Usuario => [
			nombre = "Paula"
			sexo = "F"
			fechaDeNacimiento = 20900523
			altura = 1.70
			peso = 67
		]

		usrVegano1 = new Usuario => [
			nombre = "VeganoUno"
			sexo = "M"
			fechaDeNacimiento = 20112004
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
			agregarCondicion(vegano)
		]

		usrVegano2 = new Usuario => [
			nombre = "VeganoDos"
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("frutas")
			agregarCondicion(vegano)
		]

		usrHipertenso1 = new Usuario => [
			nombre = "HipertensoUno"
			sexo = "F"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			agregarCondicion(hipertenso)
		]

		usrHipertenso2 = new Usuario => [
			nombre = "HipertensoDos"
			sexo = "F"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
			agregarCondicion(hipertenso)
		]

		usrDiabetico1 = new Usuario => [
			nombre = "DiabeticoUno"
			sexo = ""
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 80
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
			agregarCondicion(diabetico)
		]

		usrDiabetico2 = new Usuario => [
			nombre = "DiabeticoDos"
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			agregarCondicion(diabetico)
		]

		usrDiabetico3 = new Usuario => [
			nombre = "DiabeticoTres"
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
			agregarCondicion(diabetico)
		]

		usrCeliaco = new Usuario => [
			nombre = "Celiaco"
			sexo = "F"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 78
			rutina = rutinaCorta
			agregarCondicion(celiaco)
		]
	}
}