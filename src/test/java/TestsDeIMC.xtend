import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestsDeIMC {

	Usuario leandro
	Usuario eri
	Usuario diego
	Usuario nicolas
	Usuario pablo
	
	double delta =  0.0000000001

	@Before
	def void init() {
		leandro = new Usuario => [
			altura = 1.74
			peso = 70
		]
		eri = new Usuario => [
			altura = 1.52
			peso = 60
		]

		diego = new Usuario => [
			altura = 1.70
			peso = 65
		]
		
		nicolas = new Usuario => [
			altura = 1.74
			peso = 60

		//
		]
		
		pablo = new Usuario => [
			altura = 1.79
			peso = 72
		]
	}

	@Test
	def void leandroCalculaSuIMC() {
		/** Cuando usamos un assertEquals para un float o un double se tiene que tener en cuenta un tercer parametro que es el delta. */
		Assert.assertEquals(23.1206235962, leandro.calculaIMC, delta)
	}

	@Test
	def void eriCalculaSuIMC() {
		Assert.assertEquals(25.9695290859, eri.calculaIMC, delta)
	}

	@Test
	def void diegoCalculaSuIMC() {
		Assert.assertEquals(22.4913494809, diego.calculaIMC, delta)
	}

	@Test
	def void nicolasCalculaSuIMC() {
		Assert.assertEquals(19.8176773682, nicolas.calculaIMC, delta)
	}

	@Test
	def void pabloCalculaSuIMC() {
		Assert.assertEquals(22.4712087637, pablo.calculaIMC, delta)
	}
}
