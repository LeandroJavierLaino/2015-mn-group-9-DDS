import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Caracteristica {
	String nombre
	String cantidad
	
	new(String cNombre, String cCantidad){
		nombre = cNombre
		cantidad = cCantidad
	}	
}