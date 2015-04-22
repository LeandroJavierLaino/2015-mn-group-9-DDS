package rutina

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Rutina {
	int tiempo
	
	def boolean activaIntensa()
	
}