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
		
		Assert.assertEquals(hora.toString ,recetasPorHora.mostrarResultados)
	}
	@Test
	def void RecetasMasConsultadas() {
		
		Assert.assertEquals("SalchiPapa", recetasMasConsultadas.mostrarResultados)
	}
	@Test
	def void recetasMasConsultadasPorHombres() {
		Assert.assertEquals("SalchiPapa", recetasMasConsultadasM.mostrarResultados)
	}
	@Test
	def void recetasMasConsultadasPorMujeres() {
		Assert.assertEquals("Pollo al Oreganato", recetasMasConsultadasF.mostrarResultados)
	}
	@Test
	def void contadorDeVeganos() { //Y ESTA TAMBIEN ESTA POR QUEEEE
		Assert.assertEquals("1", recetasVegano.mostrarResultados)
	}
}