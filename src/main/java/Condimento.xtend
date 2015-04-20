import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Condimento {
	String nombre
	double cantidad
	
	new(String cNombre, double cCantidad){
		nombre = cNombre
		cantidad = cCantidad
	}
}