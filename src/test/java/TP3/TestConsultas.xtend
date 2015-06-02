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

class TestConsultas extends Grupos {
	
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	MonitorHora monitor1
	DateTime time
	int hora
	
	override void init() {
		super.init()
		
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		monitor1 = new MonitorHora
		time = new DateTime()
		hora = time.getHourOfDay()
		
		nicolas.filtrosAAplicar.add(filtroGusto)
		nicolas.filtrosAAplicar.add(filtroExceso)
		nicolas.recetasFavoritas.add(recetaAntiDiabetico)
		nicolas.comidasQueDisgustan.add(chori)
		
		repo.agregar(recetaAntiVegano)
		repo.agregar(recetaParaCualquiera)
		
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		
		GestorDeConsultas.getInstance.monitores.add(monitor1)
		recetasFiltradas = nicolas.postProcesarRecetas
		
		nicolas.postProcesarRecetas
		nicolas.postProcesarRecetas
		nicolas.postProcesarRecetas
		
		

	}
	
	@Test
	def void ConsultarRecetasPropiasPublicasyCompartidas(){
		
		Assert.assertEquals(3,recetasFiltradas.size)
	}
	@Test
	def void verHorasMasConsultadas(){
		
		Assert.assertEquals(hora.toString ,monitor1.mostrarResultados)
	}
}