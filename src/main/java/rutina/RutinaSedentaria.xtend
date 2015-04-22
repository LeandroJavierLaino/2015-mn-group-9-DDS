package rutina
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class RutinaSedentaria extends Rutina {

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
