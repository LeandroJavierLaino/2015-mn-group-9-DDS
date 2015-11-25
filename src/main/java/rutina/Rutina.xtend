package rutina

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
@TransactionalAndObservable
@Accessors
abstract class Rutina {
	int tiempo
	
	def boolean activaIntensa()
	def boolean esActiva()
}