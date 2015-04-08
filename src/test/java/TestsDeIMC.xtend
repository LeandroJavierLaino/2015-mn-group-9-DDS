import org.junit.Test
import org.junit.Assert

class TestsDeIMC {
	
@Test
	def void leandroCalculaSuIMC(){
	
		val leandro = new Usuario()
		leandro.altura = 1.74
		leandro.peso = 70 
	
	/** Cuando usamos un assertEquals para un float o un double se tiene que tener en cuenta un tercer parametro que es el delta. */
		Assert.assertEquals(23.12062359624785, leandro.calculaIMC,0.00000000000001)
 	}	
	
@Test
	def void eriCalculaSuIMC(){
		
		val eri = new Usuario()
		eri.altura = 1.52
		eri.peso = 60
		
		Assert.assertEquals(25.9695291,eri.calculaIMC,0.0000001)
	}


@Test
	def void diegoCalculaSuIMC(){
		
		val diego = new Usuario()
		diego.altura = 1.70
		diego.peso = 65
		
		Assert.assertEquals(22.491349481,diego.calculaIMC,0.000000001)
	}
@Test
	def void nicolasCalculaSuIMC() {
		val nicolas = new Usuario()
		nicolas.altura = 1.74
		nicolas.peso = 60
		
		//
		Assert.assertEquals(19.817677368, nicolas.calculaIMC, 0.00000001)
	}
	
@Test
	def void pabloCalculaSuIMC(){
		val pablo = new Usuario ()
		pablo.altura = 1.79
		pablo.peso = 72
		
		Assert.assertEquals(22.471208763, pablo.calculaIMC, 0.00000001)
	}
}