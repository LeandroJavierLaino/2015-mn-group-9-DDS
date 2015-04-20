import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuarioEsValido {
	
	Usuario marcos 
	Usuario jerry
	CondicionPreexistente vegano
	CondicionPreexistente celiaco
	
	@Before
	def void init() {
		val vegano =  new CondicionVegano
		val celiaco = new CondicionCeliaco
		
		marcos = new Usuario => [
		nombre = "Marcos"
		altura = 1.85
		peso = 88.0
		fechaDeNacimiento = 2495
		condicionesPreexistentes = emptyList
		]
		jerry = new Usuario => [
		nombre = "Jer"
		altura = 1.85
		peso = 88.0
		fechaDeNacimiento = 2495
		condicionesPreexistentes = emptyList
		]

	}
	
	@Test
	def void marcosEsUsuarioValido() {
		Assert.assertTrue(marcos.validar())
	}
	
	@Test
	def void jerryEsUsuarioValido() {
		Assert.assertFalse(jerry.validar())
	}
}