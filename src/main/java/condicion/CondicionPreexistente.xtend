package condicion

import cosasUsuario.Usuario
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import javax.persistence.GenerationType

@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
@Entity
@Accessors
abstract class CondicionPreexistente {
	
	@Id	@GeneratedValue(strategy=GenerationType.TABLE)
	private long idCondicion 
	
	def boolean valido(Usuario unUsusario)

	def boolean tieneRutinaSaludable(Usuario unUsuario)

	def boolean tolera(Receta unaReceta)

	def Boolean esCondicionVegana()

}
