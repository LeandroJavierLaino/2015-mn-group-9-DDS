package TP3

import consulta.GestorDeConsultas
import consulta.recetasPorHora
import consulta.recetasMasConsultadas
import consulta.recetasMasConsultadasM
import consulta.recetasMasConsultadasF
import consulta.recetasVegano
import filtro.FiltroPorExcesoDeCalorias
import filtro.FiltroPorGusto
import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares
import receta.Receta
import testeo.UsuariosExtras

@Accessors
class IntanciacionTP3Consultas extends UsuariosExtras {
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	recetasPorHora recetasPorHora
	recetasMasConsultadas recetasMasConsultadas
	recetasMasConsultadasM recetasMasConsultadasM
	recetasMasConsultadasF recetasMasConsultadasF
	recetasVegano recetasVegano
	DateTime time
	int hora
	
	override void init() {
		
		super.init()
		
		
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		
		recetasPorHora = new recetasPorHora
		recetasMasConsultadas = new recetasMasConsultadas
		recetasMasConsultadasM = new recetasMasConsultadasM
		recetasMasConsultadasF = new recetasMasConsultadasF
		recetasVegano = new recetasVegano
		
		time = new DateTime()
		hora = time.getHourOfDay()
		
		recetasPorHora.activarRecetasPorHora(GestorDeConsultas.getInstance.consultasRecetasPorHora)
		recetasMasConsultadas.activarRecetasMasConsultadas(GestorDeConsultas.getInstance.consultasRecetasMasConsultadas)
		recetasMasConsultadasM.activarRecetasMasConsultadasM(GestorDeConsultas.getInstance.consultasRecetasMasConsultadasM)
		recetasMasConsultadasF.activarRecetasMasConsultadasF(GestorDeConsultas.getInstance.consultasRecetasMasConsultadasF)
		recetasVegano.activarRecetasVegano(GestorDeConsultas.getInstance.consultasRecetasVeganos)
		
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