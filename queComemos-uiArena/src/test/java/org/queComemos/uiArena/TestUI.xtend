package org.queComemos.uiArena

import testeo.Grupos
import org.junit.Test

class TestUI extends Grupos {

	@Test
	def void PruebaDeLogeo() {
		new QueComemosMainWindow().startApplication
	}
}