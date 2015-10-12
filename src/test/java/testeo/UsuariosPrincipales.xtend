package testeo

import testeo.TestInstances
import org.junit.Before
import ar.edu.domain.cosasUsuario.Usuario
import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.domain.cosasUsuario.UsuarioBuilder

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
		.conAltura(1.70)
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
		.conReceta(recetaSalchiPapa)
		.conReceta(recetaPolloAlOreganato)
		.conReceta(recetaAntiVegano)
		.build
		
		pablo = new UsuarioBuilder()
		.conNombre("Pablo")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,2,2))
		.conAltura(1.79)
		.conPeso(72)
		.conRutina(rutinaActivaCorta)
		.build
		
		recetaSalchiPapa.creador = nicolas.nombre
		recetaAntiVegano.creador = leandro.nombre
		recetaPolloAlOreganato.creador = pablo.nombre
		nicolas.recetasFavoritas.add(recetaPolloAlOreganato)
	}
}