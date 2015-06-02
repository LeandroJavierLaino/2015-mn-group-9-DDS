package TP3

import org.junit.Assert
import org.junit.Test
import org.junit.Before

class TestConsultas extends IntanciacionTP3Consultas {
	
	@Before
	override void init() {
		super.init
	}
	
	@Test
	def void NicolasConsultaRecetas(){ //POR QUE DA 1?!!!!!
		
		Assert.assertEquals(3,recetasFiltradas.size)
	}
	@Test
	def void verHorasMasConsultadas(){
		
		Assert.assertEquals(hora.toString ,monitor1.mostrarResultados)
	}
	@Test
	def void RecetasMasConsultadas() {
		
		Assert.assertEquals("SalchiPapa", monitor2.mostrarResultados)
		
	}
	@Test
	def void recetasMasConsultadasPorHombres() {
		Assert.assertEquals("SalchiPapa", monitorRecetasHombre.mostrarResultados)
	}
	@Test
	def void recetasMasConsultadasPorMujeres() {
		Assert.assertEquals("Pollo al Oreganato", monitorRecetasMujer.mostrarResultados)
	}
	@Test
	def void contadorDeVeganos() { //Y ESTA TAMBIEN ESTA POR QUEEEE
		Assert.assertEquals("1", monitorVegano.mostrarResultados)
	}
}