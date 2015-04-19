

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
abstract class RutinaSedentaria extends Rutina{
		
	def instensidad(){
		if (tiempo<=30){
			/** "rutina sedentaria leve" */
		}
		if (tiempo>30){
			/** "rutina sedentaria media" */
		}
		if (tiempo==0){
			/** "rutina sedentaria" */
		}
			
	}
	override esActiva() {
		false
	}
	
}