package TP2

import org.junit.Test
import testeo.TestInstances
import org.junit.Assert
import receta.Receta
import java.util.List
import java.util.ArrayList

class TestAccesoARecetasPorUsuario extends TestInstances {

	@Test
	def void diegoTieneAccesoAReceta2() {
		var List<Receta> recetas = new ArrayList<Receta>
		recetas.add(receta2)
		receta2.crearReceta(leandro)
		Assert.assertTrue(repo.listarRecetasVisiblesPara(diego).contains(receta2) && recetas.contains(receta2))
	}
}
