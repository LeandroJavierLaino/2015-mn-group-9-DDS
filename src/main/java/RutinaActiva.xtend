

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class RutinaActiva extends Rutina {
	override boolean activaIntensa(){tiempo>30
		}
		
	def boolean esSoloActiva(){ tiempo==0
	}	
	override esActiva() {
		true
	}
}
