package receta

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity

@Accessors
@Entity
class Condimento extends Caracteristica{
	
	def boolean esParteDe(String unCondimento,int unaCantidad){
		cantidad >= unaCantidad && nombre.equalsIgnoreCase(unCondimento)
	}
	override toString() {
		nombre
	}
}
class CondimentoBuilder {
	
	Condimento condimento
	
	new(String pNombre, double pCantidad, String pTipo) {
		condimento = new Condimento => [
			nombre = pNombre
			cantidad = pCantidad
			tipo = pTipo
		]
	}
	def Condimento build() {
		condimento
	}
}