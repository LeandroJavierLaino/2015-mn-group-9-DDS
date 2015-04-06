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
	

}
