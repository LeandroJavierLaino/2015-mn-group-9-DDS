package TP2

import org.junit.Test
import testeo.TestInstances
import org.junit.Assert
import receta.Receta
import java.util.List
import java.util.ArrayList

class TestAccesoARecetasPorUsuario extends TestInstances {

	@Test
	def void diegoTieneAccesoARecetaAntiDiabetico() {
		var List<Receta> recetas = new ArrayList<Receta>
		recetas.add(getRecetaAntiDiabetico)
		getRecetaAntiDiabetico.crearReceta(leandro)
		Assert.assertFalse(repo.listarRecetasVisiblesPara(diego).contains(getRecetaAntiDiabetico) && recetas.contains(getRecetaAntiDiabetico))
	}
}