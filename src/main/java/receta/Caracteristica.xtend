package receta

import org.eclipse.xtend.lib.annotations.Accessors
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@PersistentClass
@TransactionalAndObservable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
abstract class Caracteristica extends Entity {
	
	@PersistentField String nombre
	@PersistentField double cantidad
	@PersistentField String tipo

	new(){
	}
	
	new(String cNombre, double cCantidad, String cTipo) {
		nombre = cNombre
		cantidad = cCantidad
		tipo = cTipo
	}
}
