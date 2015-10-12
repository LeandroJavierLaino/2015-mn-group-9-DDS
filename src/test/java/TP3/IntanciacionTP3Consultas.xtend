package TP3

import ar.edu.domain.consulta.GestorDeConsultas
import ar.edu.domain.consulta.MonitorHora
import ar.edu.domain.consulta.MonitorRecetas
import ar.edu.domain.consulta.MonitorRecetasF
import ar.edu.domain.consulta.MonitorRecetasM
import ar.edu.domain.consulta.MonitorVegano
import ar.edu.domain.filtro.FiltroPorExcesoDeCalorias
import ar.edu.domain.filtro.FiltroPorGusto
import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import ar.edu.domain.procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import ar.edu.domain.procesamientoPosterior.ProcesamientoParaTomarResultadosPares
import ar.edu.domain.receta.Receta
import testeo.UsuariosExtras

@Accessors
class IntanciacionTP3Consultas extends UsuariosExtras {
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	MonitorHora monitor1
	MonitorRecetas monitor2
	MonitorRecetasM monitorRecetasHombre
	MonitorRecetasF monitorRecetasMujer
	MonitorVegano monitorVegano
	DateTime time
	int hora
	
	override void init() {
		
		super.init()
		
		
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		
		monitor1 = new MonitorHora
		monitor2 = new MonitorRecetas
		monitorRecetasHombre = new MonitorRecetasM
		monitorRecetasMujer = new MonitorRecetasF
		monitorVegano = new MonitorVegano
		
		time = new DateTime()
		hora = time.getHourOfDay()
		
		GestorDeConsultas.getInstance.monitores.add(monitor1)
		GestorDeConsultas.getInstance.monitores.add(monitor2)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasHombre)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasMujer)
		GestorDeConsultas.getInstance.monitores.add(monitorVegano)
		
		nicolas.recetasFavoritas.add(recetaSalchiPapa)
		nicolas.agregarReceta(recetaAntiVegano)
		nicolas.agregarReceta(recetaAntiDiabetico)
		
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		recetasFiltradas = nicolas.postProcesarRecetas
		
		leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
		leandro.recetas.add(recetaSalchiPapa)
		leandro.filtrosAAplicar.add(filtroGusto)
		
		leandro.recetasFavoritas.add(recetaSalchiPapa)
		leandro.postProcesarRecetas
		
		pablo.procesamiento = new ProcesamientoParaTomarResultadosPares
		pablo.filtrosAAplicar.add(filtroGusto)
		pablo.postProcesarRecetas
		
		diego.procesamiento = new ProcesamientoOrdenarlosPorNombre
		diego.recetasFavoritas.add(recetaSalchiPapa)
		
		eri.procesamiento = new ProcesamientoParaTomarResultadosPares
		eri.filtrosAAplicar.add(filtroGusto)
		eri.recetasFavoritas.add(recetaPolloAlOreganato)
		eri.postProcesarRecetas
		
		usuarioVeganoValidoYLeGustaLaFruta.procesamiento = new ProcesamientoOrdenarlosPorNombre
		usuarioVeganoValidoYLeGustaLaFruta.recetasFavoritas.add(recetaLaComidaMasOrganicaDelMundo)
		usuarioVeganoValidoYLeGustaLaFruta.postProcesarRecetas
		
		

	}
}