package testeo

import testeo.UsuariosPrincipales
import cosasUsuario.Usuario
import org.joda.time.LocalDate
import java.util.ArrayList
import org.junit.Before
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Palabras

@Accessors
class UsuariosExtras extends UsuariosPrincipales {
	
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
	Usuario usuariaHipertensaValida //ConRutinaSedentaria //valida		//tiene rutina sedentaria
	Usuario usuarioDiabeticoSinSexoMasDe70KgYActivo //sin sexo 		//mas de 70kg pero activo
	Usuario usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo //sin preferen 	//menos de 70kg y activo
	Usuario usuarioDiabeticoValidoMasDe70KgYSedentario //valido			//mas de 70kg y sedentario
	Usuario usuarioDiabeticoValidoMenosDe70KgYSedentario //valido			//menos de 70kg y sedentario
	Usuario usuarioCeliacoValido //valido
	
	@Before
	override void init() {
		
		
		super.init()
		
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
			altura = 1.71
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Pollo"))
			agregarCondicion(vegano)
		]

		usuarioVeganoValidoYLeGustaLaFruta = new Usuario => [
			nombre = "VeganoDos"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Fruta"))
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
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Carne"))
			agregarCondicion(hipertenso)
		]
		
		usuarioHipertensoValidoConRutinaSedentaria = new Usuario => [
			nombre = "HipertensoTres"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Pollo"))
			agregarCondicion(hipertenso)
		]

		usuariaHipertensaValida = new Usuario => [
			nombre = "HipertensaCuatro"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 67
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Pollo"))
			agregarCondicion(hipertenso)
		]

		usuarioDiabeticoSinSexoMasDe70KgYActivo = new Usuario => [
			nombre = "DiabeticoUno"
			sexo = ""
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 80
			rutina = rutinaActivaCorta
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Carne"))
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
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Pollo"))
			agregarCondicion(diabetico)
		]
		
		usuarioDiabeticoValidoMenosDe70KgYSedentario = new Usuario => [
			nombre = "DiabeticoCuatro"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(2000,11,20)
			altura = 1.70
			peso = 65
			rutina = rutinaSedentaria
			comidaPreferida = new ArrayList<Palabras>()
			comidaPreferida.add(new Palabras("Fruta"))
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
		super.init()
	}	
}