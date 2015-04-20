import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	String nombre
	double cantidad
	
	new(String cNombre, double cCantidad){
		nombre = cNombre
		cantidad = cCantidad
	}
}