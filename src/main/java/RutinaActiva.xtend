

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class RutinaActiva extends Rutina {
	def Boolean activaIntensa(){
		if(tiempo>30){true}else{false}
		}
		
	def Boolean esSoloActiva(){
		if(tiempo==0){true}else{false}
	}	
	
}