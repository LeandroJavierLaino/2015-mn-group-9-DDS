package receta

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType

@Accessors
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Entity
abstract class Caracteristica {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.TABLE)
	private Long idCaracteristica
	
	@Column(length = 30)
	String nombre
	@Column
	double cantidad
	@Column(length = 30)
	String tipo

	new(){
		
	}
	
	new(String cNombre, double cCantidad, String cTipo) {
		nombre = cNombre
		cantidad = cCantidad
		tipo = cTipo
	}
}