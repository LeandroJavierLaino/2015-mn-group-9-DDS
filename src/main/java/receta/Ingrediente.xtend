package receta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente extends Caracteristica {
	
	def boolean esParteDe(String unIngrediente,int unaCantidad){
		cantidad >= unaCantidad && nombre.equalsIgnoreCase(unIngrediente)
	}
	
	def boolean esIngredienteCaro(){
		this.nombre=="lechon"||this.nombre=="lomo"||this.nombre=="salmon"||this.nombre=="alcaparras"
	}
}