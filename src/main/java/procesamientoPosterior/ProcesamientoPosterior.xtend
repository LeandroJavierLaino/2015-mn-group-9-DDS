package procesamientoPosterior

import java.util.Set
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import javax.persistence.GenerationType

//@MappedSuperclass
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
@Entity
@Accessors
abstract class ProcesamientoPosterior {

	@Id	@GeneratedValue(strategy=GenerationType.TABLE)
	private long idProcesamiento	
	def Set<Receta> asociarProcesamiento(Set<Receta> recetas)
}