package testeo

import testeo.TestInstances
import org.junit.Before
import cosasUsuario.Usuario
import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import cosasUsuario.UsuarioBuilder

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
		
		//METODO POR BUILDER
		
		leandro = new UsuarioBuilder()
		.conNombre("Leandro")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1988,6,27))
		.conPeso(70)
		.conAltura(1.74)
		.conRutina(rutinaActivaCorta)
		.conReceta(recetaAntiDiabetico)
		.build
		
		eri = new UsuarioBuilder()
		.conNombre("Erika")
		.deSexo("F")
		.fechaDeNacimiento(new LocalDate(1980,1,1))
		.conAltura(1.52)
		.conPeso(60)
		.conRutina(rutinaActivaLarga)
		.conReceta(recetaParaCualquiera)
		.build
		
		diego = new UsuarioBuilder()
		.conNombre("Diego")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,1,1))
		.conAltura(1.75)
		.conPeso(65)
		.conRutina(rutinaActivaCorta)
		.build
		
		nicolas = new UsuarioBuilder()
		.conNombre("Nicolas")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,11,10))
		.conAltura(1.74)
		.conPeso(60)
		.conRutina(rutinaActivaLarga)
		.leDisgusta(ajiMolido)
		.build
		
		pablo = new UsuarioBuilder()
		.conNombre("Pablo")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,2,2))
		.conAltura(1.79)
		.conPeso(72)
		.conRutina(rutinaActivaCorta)
		.build
		
		/*
		 * METODO POR WITH
		 
		
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
			
		]	*/
	}
}