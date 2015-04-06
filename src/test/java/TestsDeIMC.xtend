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
}
