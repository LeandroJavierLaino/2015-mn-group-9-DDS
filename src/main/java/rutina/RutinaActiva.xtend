package rutina

import org.eclipse.xtend.lib.annotations.Accessors

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
