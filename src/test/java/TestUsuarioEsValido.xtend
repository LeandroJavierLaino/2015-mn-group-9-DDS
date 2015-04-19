import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuarioEsValido {
	
	Usuario marcos 
	/*Usuario jerry
	CondicionPreexistente vegano*/
	
	@Before
	def void init() {
		
		marcos = new Usuario => [
		nombre = "Marcos"
		altura = 1.85
		peso = 88.0
		fechaDeNacimiento = 2495
		condicionesPreexistentes = emptyList
		]
		
		/*jerry = new Usuario => [
			nombre = "Jerry"
			altura = 1.50
			peso = 200.0
			fechaDeNacimiento = 2558
			condicionesPreexistentes = (vegano)
		] */ //no me funca la lista

	}
	
	@Test
	def void marcosEsUsuarioValido() {
		Assert.assertTrue(marcos.validar())
	}
	
}