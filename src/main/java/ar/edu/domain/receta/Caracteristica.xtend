package ar.edu.domain.receta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Caracteristica {
	String nombre
	double cantidad
	String tipo

	new(){
		
	}
	
	new(String cNombre, double cCantidad, String cTipo) {
		nombre = cNombre
		cantidad = cCantidad
		tipo = cTipo
	}
}
