

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class RutinaActiva extends Rutina {
	override def activaIntensa(){
		tiempo > 30
		}
		
	def Boolean esSoloActiva(){
		tiempo==0
	}	
	
}