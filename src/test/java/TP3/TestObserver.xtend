package TP3

import testeo.UsuariosExtras
import org.junit.Assert
import org.junit.Test
import consulta.MonitorHora
import consulta.MonitorRecetas
import consulta.MonitorRecetasM
import consulta.MonitorVegano
import consulta.MonitorRecetasF
import org.joda.time.DateTime
import consulta.GestorDeConsultas
import org.junit.Before
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares

class TestObserver extends UsuariosExtras{
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	
	MonitorHora monitorHora
	MonitorRecetas monitorReceta
	MonitorRecetasM monitorRecetasHombre
	MonitorRecetasF monitorRecetasMujer
	MonitorVegano monitorVegano
	DateTime time
	int hora	
	
	@Before
	override void init() {
		super.init()
	
	filtroGusto = new FiltroPorGusto
	filtroExceso = new FiltroPorExcesoDeCalorias
		
	monitorHora = new MonitorHora
	monitorReceta = new MonitorRecetas
	monitorRecetasHombre = new MonitorRecetasM
	monitorRecetasMujer = new MonitorRecetasF
	monitorVegano = new MonitorVegano
		
	time = new DateTime()
	hora = time.getHourOfDay()
		
	GestorDeConsultas.getInstance.monitores.add(monitorHora)
	GestorDeConsultas.getInstance.monitores.add(monitorReceta)
	GestorDeConsultas.getInstance.monitores.add(monitorRecetasHombre)
	GestorDeConsultas.getInstance.monitores.add(monitorRecetasMujer)
	GestorDeConsultas.getInstance.monitores.add(monitorVegano)
		
	leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
	leandro.recetas.add(recetaSalchiPapa)
	leandro.filtrosAAplicar.add(filtroGusto)
		
	leandro.recetasFavoritas.add(recetaSalchiPapa)
	leandro.postProcesarRecetas
		
	pablo.procesamiento = new ProcesamientoParaTomarResultadosPares
	pablo.filtrosAAplicar.add(filtroGusto)
	pablo.postProcesarRecetas
			
	eri.procesamiento = new ProcesamientoParaTomarResultadosPares
	eri.filtrosAAplicar.add(filtroGusto)
	eri.recetasFavoritas.add(recetaPolloAlOreganato)
	eri.postProcesarRecetas
		
	usuarioVeganoValidoYLeGustaLaFruta.procesamiento = new ProcesamientoOrdenarlosPorNombre
	usuarioVeganoValidoYLeGustaLaFruta.recetasFavoritas.add(recetaLaComidaMasOrganicaDelMundo)
	usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
			
	}	
				
				
	@Test
	def void verHorasMasConsultadas(){
		Assert.assertEquals(hora.toString ,monitorHora.mostrarResultados)
	}
	
	 @Test
	def void RecetasMasConsultadas() {
		Assert.assertEquals("Ensalada", monitorReceta.mostrarResultados)
	}
	
	@Test
	def void recetasMasConsultadasPorHombres() {
		Assert.assertEquals("SalchiPapa",monitorRecetasHombre.mostrarResultados)
	}
	
	@Test
	def void recetasMasConsultadasPorMujeres() {
		Assert.assertEquals("Pollo al Oreganato", monitorRecetasMujer.mostrarResultados)
	}
	
	@Test
	def void contadorDeVeganos() { 
		Assert.assertEquals("1", monitorVegano.mostrarResultados)
	}				
	
}