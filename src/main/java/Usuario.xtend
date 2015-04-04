

import org.eclipse.xtend.lib.annotations.Accessors

class Usuario {
	
	@Accessors double altura
	@Accessors double peso 
	
	def double calculaIMC(){
		peso / (altura*altura)
	}
}