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
import procesamientoPosterior.ProcesamientoOrdenarlosPorCalorias
//import procesamientoPosterior.ProcesamientoParaTomarResultadosPares

class TestObserver extends UsuariosExtras{
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	
	MonitorHora monitorHora
	MonitorRecetas monitorReceta
	MonitorRecetasM monitorRecetasHombre
	MonitorRecetasF monitorRecetasMujer
	MonitorVegano monitorVegano
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
		
	hora = new DateTime().getHourOfDay()
		
	GestorDeConsultas.getInstance.monitores.add(monitorHora)
	GestorDeConsultas.getInstance.monitores.add(monitorReceta)
	GestorDeConsultas.getInstance.monitores.add(monitorRecetasHombre)
	GestorDeConsultas.getInstance.monitores.add(monitorRecetasMujer)
	GestorDeConsultas.getInstance.monitores.add(monitorVegano)
		
	leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
	leandro.agregarReceta(recetaSalchiPapa)
	//leandro.agregarFiltro(filtroGusto)
		
	leandro.recetasFavoritas.add(recetaSalchiPapa)
	
		
	pablo.procesamiento = new ProcesamientoOrdenarlosPorNombre
	pablo.agregarReceta(recetaSalchiPapa)
	//pablo.agregarFiltro(filtroGusto)
	
	nicolas.procesamiento = new ProcesamientoOrdenarlosPorCalorias
	nicolas.agregarReceta(recetaSalchiPapa)
	//nicolas.agregarFiltro(filtroGusto)
			
	eri.procesamiento = new ProcesamientoOrdenarlosPorNombre //ProcesamientoParaTomarResultadosPares
	//eri.agregarFiltro(filtroGusto)
	eri.recetasFavoritas.add(recetaPolloAlOreganato)
	
		
	usuarioVeganoValidoYLeGustaLaFruta.procesamiento = new ProcesamientoOrdenarlosPorNombre
	usuarioVeganoValidoYLeGustaLaFruta.recetasFavoritas.add(recetaLaComidaMasOrganicaDelMundo)
	
			
	}	
				
				
	@Test
	def void verHorasMasConsultadas(){
		leandro.postProcesarRecetas
		pablo.postProcesarRecetas
		eri.postProcesarRecetas
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		Assert.assertEquals(hora.toString ,monitorHora.mostrarResultados)
	}
	
	 @Test
	def void RecetasMasConsultadas() {
		leandro.postProcesarRecetas
		pablo.postProcesarRecetas
		eri.postProcesarRecetas
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		Assert.assertEquals("SalchiPapa", monitorReceta.mostrarResultados)
	}
	
	@Test
	def void recetasMasConsultadasPorHombres() {
		leandro.postProcesarRecetas
		pablo.postProcesarRecetas
		eri.postProcesarRecetas
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		Assert.assertEquals("SalchiPapa",monitorRecetasHombre.mostrarResultados)
	}
	
	@Test
	def void recetasMasConsultadasPorMujeres() {
		leandro.postProcesarRecetas
		pablo.postProcesarRecetas
		eri.postProcesarRecetas
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		Assert.assertEquals("Pollo al Oreganato", monitorRecetasMujer.mostrarResultados)
	}
	
	@Test
	def void contadorDeVeganos() { 
		leandro.postProcesarRecetas
		pablo.postProcesarRecetas
		eri.postProcesarRecetas
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		Assert.assertEquals("1", monitorVegano.mostrarResultados)
	}				
	
}