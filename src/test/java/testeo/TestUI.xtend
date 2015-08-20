package testeo

import testeo.Grupos
import org.junit.Test
import ui.QueComemosMainWindow

class TestUI extends Grupos {
	
	@Test
	def void PruebaDeLogeo() {
		new QueComemosMainWindow().startApplication
	}
}