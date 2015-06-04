package testeo

import org.eclipse.xtend.lib.annotations.Accessors
import cosasUsuario.Usuario
import condicion.CondicionCeliaco
import condicion.CondicionHipertenso
import condicion.CondicionDiabetico
import condicion.CondicionVegano
import org.junit.Before
import org.joda.time.LocalDate
import java.util.ArrayList

@Accessors
class TestUsers extends TestInstances{
	
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
	
	
	double delta = 0.0000000001

	@Before
	override void init() {
		super.init()
		
		celiaco = new CondicionCeliaco
		diabetico = new CondicionDiabetico
		hipertenso = new CondicionHipertenso
		vegano = new CondicionVegano
		
		
		
		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1988,6,27)
			altura = 1.74
			peso = 70
			rutina = rutinaCorta
			recetas.add(recetaAntiDiabetico)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.52
			peso = 60
			rutina = rutinaLarga
			recetas.add(recetaParaCualquiera)
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
			comidasQueDisgustan.add("ajiMolido")	
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
		}
}