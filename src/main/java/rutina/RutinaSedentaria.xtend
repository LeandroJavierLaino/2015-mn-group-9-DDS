package rutina

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RutinaSedentaria extends Rutina {
	override def activaIntensa() {
		return false
	}
	
	override def esActiva(){
		return false
	}
	
	def boolean sedentariaLeve() {
		tiempo <= 30
	}

	def boolean sedentariaMedia() {
		tiempo > 30
	}

	def boolean sedentaria() {
		tiempo == 0
	}
}
