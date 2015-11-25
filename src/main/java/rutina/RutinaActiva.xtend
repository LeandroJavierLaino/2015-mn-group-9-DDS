package rutina

import org.eclipse.xtend.lib.annotations.Accessors
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
@Accessors 
class RutinaActiva extends Rutina {
	override def activaIntensa(){
		tiempo > 30
		}
			
	override def esActiva(){
		return true
		}
		
	def boolean esSoloActiva() {  
		tiempo.equals(0)
	}
}
