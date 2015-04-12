
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	
	double altura
	double peso
	
	def double calculaIMC(){
		peso / (altura*altura)
	}
}