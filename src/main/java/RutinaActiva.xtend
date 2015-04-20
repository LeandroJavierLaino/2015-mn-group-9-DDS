

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class RutinaActiva extends Rutina {
	override boolean activaIntensa(){
		if(tiempo>30){true}else{false}
		}
		
	def boolean esSoloActiva(){
		if(tiempo==0){true}else{false}
	}	
	override esActiva() {
		true
	}
}