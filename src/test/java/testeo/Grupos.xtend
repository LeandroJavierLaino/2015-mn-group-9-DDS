package testeo

import testeo.UsuariosExtras
import cosasUsuario.GrupoUsuario
import org.junit.Before
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Grupos extends UsuariosExtras {
	
	@Before
	override void init() {
		super.init()
		
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