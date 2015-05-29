package receta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Caracteristica {
	String nombre
	double cantidad
	String tipo
	
	new(String cNombre, double cCantidad, String cTipo){
		nombre = cNombre
		cantidad = cCantidad
		tipo = cTipo
	}	
}