package rutina

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.InheritanceType
import javax.persistence.Inheritance

@Accessors
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
abstract class Rutina {
	
	@Id @GeneratedValue
	private long idRutina
	
	@Column
	int tiempo
	
	def boolean activaIntensa()
	def boolean esActiva()
}