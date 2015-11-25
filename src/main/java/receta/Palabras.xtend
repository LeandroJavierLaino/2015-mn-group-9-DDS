package receta

import com.fasterxml.jackson.databind.annotation.JsonSerialize
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField
import org.uqbar.commons.model.Entity
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@PersistentClass
@TransactionalAndObservable
@JsonSerialize
@JsonIgnoreProperties(ignoreUnknown=true)
class Palabras extends Entity {
	@PersistentField String palabras
	
	new(String palabras){
		this.palabras = palabras
	}
	
	new() {
	}
	
	override toString() {
		palabras
	}
}