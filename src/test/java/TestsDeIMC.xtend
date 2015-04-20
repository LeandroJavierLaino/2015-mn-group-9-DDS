import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestsDeIMC {

	Usuario leandro
	Usuario eri
	Usuario diego
	Usuario nicolas
	Usuario pablo
	Sistema elSistema
	
	double delta =  0.0000000001

	@Before
	def void init() {
		elSistema = new Sistema =>[
			
		]
		
		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "Masculino"
			fechaDeNacimiento = 27061988
			altura = 1.74
			peso = 70
		]
		
		eri = new Usuario => [
			nombre = "Erika"
			sexo = "Femenino"
			fechaDeNacimiento = 1011980 
			altura = 1.52
			peso = 60
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = "Masculino"
			fechaDeNacimiento = 1011980 
			altura = 1.70
			peso = 65
		]
		
		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = "Masculino"
			fechaDeNacimiento = 1011980 
			altura = 1.74
			peso = 60
		]
		
		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = "Masculino"
			fechaDeNacimiento = 1011980 
			altura = 1.79
			peso = 72
		]
	}
//Punto 1
	
	@Test
	def void eriEsUnUsuarioValido(){
		Assert.assertEquals(true,eri.validar())
	}
	
	@Test
	def void diegoEsUnUsuarioValido(){
		Assert.assertEquals(true,diego.validar())
	}
	
	@Test
	def void nicolasEsUnUsuarioValido(){
		Assert.assertEquals(true,nicolas.validar())
	}
	
	@Test
	def void pabloEsUnUsuarioValido(){
		Assert.assertEquals(true,pablo.validar())
	}
	
//Punto 2

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
	
	@Test
	def void leandroSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, leandro.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void erikaSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, eri.sigueUnaRutinaSaludable())
	}
	
		@Test
	def void diegoSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, diego.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void nicolasSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, nicolas.sigueUnaRutinaSaludable())
	}

	@Test
	def void pabloSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, pablo.sigueUnaRutinaSaludable())
	}
}
