package receta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Condimento extends Caracteristica{
	
	def boolean esParteDe(String unCondimento,int unaCantidad){
		cantidad >= unaCantidad && nombre.equalsIgnoreCase(unCondimento)
	}
}