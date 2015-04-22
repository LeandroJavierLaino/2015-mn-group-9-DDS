import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestJerryElVeganoCeliaco {
	
	Usuario jerry

	
	@Before
	def void init() {
		
		//val vegano =  new CondicionVegano
		val celiaco = new CondicionCeliaco
		
		jerry = new Usuario => [
		nombre = "Jerry"
		altura = 1.85
		peso = 88.0
		fechaDeNacimiento = 19910819
		agregarCondicion(celiaco)
		]

	}
	@Test
	def void jerryEsUsuarioValido() {
		Assert.assertTrue(jerry.validar())
	}
	
}