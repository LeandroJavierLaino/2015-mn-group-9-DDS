import org.junit.Test
import org.junit.Assert

class TestsDeIMC {
	
@Test

	def void leandroCalculaSuIMC(){
	
		val leandro = new Usuario()
		leandro.altura = 1.74
		leandro.peso = 70 
	
		Assert.assertEquals(23.12062359624785, leandro.calculaIMC)
 	}	
	
@Test
	def void eriCalculaSuIMC(){
		
		val eri = new Usuario()
		eri.altura = 1.52
		eri.peso = 60
		
		Assert.assertEquals(25.9695291,eri.calculaIMC)
	}
}
