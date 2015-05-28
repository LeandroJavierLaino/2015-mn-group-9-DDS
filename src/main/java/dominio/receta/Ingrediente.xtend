package receta
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List

@Accessors
class Ingrediente extends Caracteristica {
	
	static public List<Ingrediente> ingredientesCaros = new ArrayList<Ingrediente>
	
	def boolean esParteDe(String unIngrediente,int unaCantidad){
		cantidad >= unaCantidad && nombre.equalsIgnoreCase(unIngrediente)
	}
	
	def esCaro(){
		ingredientesCaros.contains(this)
	}
}