

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class RutinaActiva extends Rutina {
	def intensidad(){
		if(tiempo>30){
			/** "Rutina activa intensa" */
		}
		if(tiempo==0){
			/** "Rutina activa" */
		}
	}
	
}