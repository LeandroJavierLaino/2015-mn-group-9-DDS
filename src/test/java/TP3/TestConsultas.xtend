package TP3

import consulta.GestorDeConsultas
import consulta.MonitorHora
import filtro.FiltroPorExcesoDeCalorias
import filtro.FiltroPorGusto
import java.util.HashSet
import java.util.Set
import org.junit.Assert
import org.junit.Test
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import receta.Receta
import testeo.Grupos
import org.joda.time.DateTime
import consulta.MonitorRecetas
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares

class TestConsultas extends Grupos {
	
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	MonitorHora monitor1
	MonitorRecetas monitor2
	DateTime time
	int hora
	
	override void init() {
		super.init()
		
		
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		monitor1 = new MonitorHora
		monitor2 = new MonitorRecetas
		time = new DateTime()
		hora = time.getHourOfDay()
		
		GestorDeConsultas.getInstance.monitores.add(monitor1)
		GestorDeConsultas.getInstance.monitores.add(monitor2)
		
		repo.agregar(recetaSalchiPapa)
		repo.agregar(recetaPolloAlOreganato)
		
		nicolas.filtrosAAplicar.add(filtroGusto)
		nicolas.filtrosAAplicar.add(filtroExceso)
		nicolas.recetasFavoritas.add(recetaAntiDiabetico)
		
		nicolas.comidasQueDisgustan.add(chori)
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		recetasFiltradas = nicolas.postProcesarRecetas
		
		
		leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
		leandro.recetas.add(recetaSalchiPapa)
		leandro.filtrosAAplicar.add(filtroGusto)
		
		leandro.recetasFavoritas.add(recetaAntiVegano)
		
		pablo.procesamiento = new ProcesamientoParaTomarResultadosPares
		pablo.filtrosAAplicar.add(filtroGusto)
		pablo.recetasFavoritas.add(recetaAntiVegano)
		pablo.postProcesarRecetas
		
		
		

	}
	
	@Test
	def void NicolasConsultaRecetasPropiasPublicasyCompartidas(){
		
		
		Assert.assertEquals(3,recetasFiltradas.size)
	}
	@Test
	def void verHorasMasConsultadas(){
		
		Assert.assertEquals(hora.toString ,monitor1.mostrarResultados)
	}
	@Test
	def void LeandroConsultaRecetas() {
		
		
		leandro.postProcesarRecetas
		
		Assert.assertEquals("SalchiPapa", monitor2.mostrarResultados)
		
	}
}