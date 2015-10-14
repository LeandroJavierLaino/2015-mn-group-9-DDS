package receta
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import javax.persistence.Entity

@Accessors
@Entity
class Ingrediente extends Caracteristica {
	
	static public List<Ingrediente> ingredientesCaros = new ArrayList<Ingrediente>
	
	def boolean esParteDe(String unIngrediente,int unaCantidad){
		cantidad >= unaCantidad && nombre.equalsIgnoreCase(unIngrediente)
	}
	
	def esCaro(){
		ingredientesCaros.contains(this)
	}
}
class IngredienteBuilder {
	
	Ingrediente ingrediente
	
	new(String pNombre, double pCantidad, String pTipo) {
		ingrediente = new Ingrediente => [
			nombre = pNombre
			cantidad = pCantidad
			tipo = pTipo
		]
	}
	def Ingrediente build() {
		ingrediente
	}
}