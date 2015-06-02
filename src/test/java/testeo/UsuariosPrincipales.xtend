package testeo

import testeo.TestInstances
import org.junit.Before
import cosasUsuario.Usuario
import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuariosPrincipales extends TestInstances {
	Usuario eri
	Usuario leandro
	Usuario diego
	Usuario nicolas
	Usuario pablo
	
	@Before
	override void init() {
		
		super.init
		
		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "M"
			fechaDeNacimiento = new LocalDate(1988,6,27)
			altura = 1.74
			peso = 70
			rutina = rutinaActivaCorta
			agregarReceta(recetaAntiDiabetico)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = new LocalDate(1980,1,1)
			altura = 1.52
			peso = 60
			rutina = rutinaActivaLarga
			agregarReceta(recetaParaCualquiera)
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
	}
}