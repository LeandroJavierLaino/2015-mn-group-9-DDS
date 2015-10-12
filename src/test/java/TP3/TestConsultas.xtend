package TP3

import org.junit.Assert
import org.junit.Test
import org.junit.Before
import testeo.UsuariosExtras
import ar.edu.domain.filtro.FiltroPorGusto
import ar.edu.domain.filtro.FiltroPorExcesoDeCalorias
import java.util.HashSet
import ar.edu.domain.receta.Receta
import java.util.Set
import ar.edu.domain.procesamientoPosterior.ProcesamientoOrdenarlosPorNombre

class TestConsultas extends UsuariosExtras {
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	
	@Before
	override void init() {
		super.init()
		
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
	}
	
	
	@Test
	def void NicolasConsultaRecetas(){ 
		nicolas.recetasFavoritas.add(recetaSalchiPapa)
		nicolas.agregarReceta(recetaAntiVegano)
		nicolas.agregarReceta(recetaAntiDiabetico)
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		nicolas.postProcesarRecetas
		recetasFiltradas = nicolas.postProcesarRecetas
		Assert.assertEquals(3,recetasFiltradas.size)
	}
	
	@Test
	def void DiegoConsultaRecetas(){ 
		diego.recetasFavoritas.add(recetaSalchiPapa)
		diego.agregarReceta(recetaParaCualquiera)
		diego.procesamiento = new ProcesamientoOrdenarlosPorNombre
		diego.postProcesarRecetas
		recetasFiltradas = diego.postProcesarRecetas
		Assert.assertEquals(2,recetasFiltradas.size)
	}
	
	@Test
	def void usuarioHipertensoValidoConRutinaSedentariaConsultaRecetas(){ 
		usuarioHipertensoValidoConRutinaSedentaria.recetasFavoritas.add(recetaSalchiPapa)
		usuarioHipertensoValidoConRutinaSedentaria.agregarReceta(recetaCaloriasBajoRango)
		usuarioHipertensoValidoConRutinaSedentaria.agregarReceta(recetaParaCualquiera)
		usuarioHipertensoValidoConRutinaSedentaria.agregarReceta(recetaAntiDiabetico)
		usuarioHipertensoValidoConRutinaSedentaria.procesamiento = new ProcesamientoOrdenarlosPorNombre
		usuarioHipertensoValidoConRutinaSedentaria.postProcesarRecetas
		recetasFiltradas = usuarioHipertensoValidoConRutinaSedentaria.postProcesarRecetas
		Assert.assertEquals(4,recetasFiltradas.size)
	}
	
	@Test
	def void usuariaHipertensaValidaConsultaRecetas(){ 
		usuariaHipertensaValida.recetasFavoritas.add(recetaPolloAlOreganato)
		usuariaHipertensaValida.agregarReceta(recetaCaloriasBajoRango)
		usuariaHipertensaValida.agregarReceta(recetaParaCualquiera)
		usuariaHipertensaValida.agregarReceta(recetaAntiDiabetico)
		usuariaHipertensaValida.procesamiento = new ProcesamientoOrdenarlosPorNombre
		usuariaHipertensaValida.postProcesarRecetas
		recetasFiltradas = usuariaHipertensaValida.postProcesarRecetas
		Assert.assertEquals(4,recetasFiltradas.size)
	}

}