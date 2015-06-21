package TP3

import cosasUsuario.Usuario
import cosasUsuario.UsuarioAdministrador
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import repositorioUsuarios.RepositorioUsuarios
import testeo.UsuariosExtras
import org.junit.After

@Accessors
class TestRepositorioUsuarios extends UsuariosExtras {

	RepositorioUsuarios repousuarios
	UsuarioAdministrador admin
	Usuario diabeticoDiego

	@Before
	override void init() {
		super.init()
		repousuarios = RepositorioUsuarios.getInstance
		admin = new UsuarioAdministrador
		diabeticoDiego = new Usuario => [
			agregarCondicion(diabetico)
			nombre = "diego"
		]

	}

	@Test
	def void agregarADiegoAListaDeSuscripcionPendiente() {
		var listaResultadoConDiego = new ArrayList(#[diego])
		diego.solicitarIngresoASistema()
		Assert.assertEquals(listaResultadoConDiego, repousuarios.listaPorAceptarse)
	}
	
	@After
	def void borrarLista(){
		repousuarios.listaPorAceptarse.removeAll
	}

	@Test
	def void aceptarSuscripcionDeDiegoYRechazarALeandro() {
		repousuarios.allInstances.removeAll
		var listaAceptados = new ArrayList(#[diego])
		diego.solicitarIngresoASistema()
		leandro.solicitarIngresoASistema()
		admin.rechazarSuscripcion(leandro, "no puso bien su nombre")
		admin.aceptarSuscripcion(diego)
		Assert.assertEquals(listaAceptados, repousuarios.allInstances)
	}
	
	@After
	def void borrarLista2(){
		repousuarios.allInstances.removeAll
		repousuarios.listaPorAceptarse.removeAll
	}

	@Test
	def void devolvermeUnUsuarioConNombreDiego() {
		var usuarioPrototipo = new Usuario
		usuarioPrototipo.nombre = "diego"
		var usuarioDevuelto = new Usuario
		diego.solicitarIngresoASistema()
		leandro.solicitarIngresoASistema()
		admin.aceptarSuscripcion(diego)
		admin.aceptarSuscripcion(leandro)
		usuarioDevuelto = repousuarios.get(usuarioPrototipo)
		Assert.assertEquals(usuarioDevuelto, diego)
	}
	
	@After
	def void borrarLista3(){
		repousuarios.allInstances.removeAll
		repousuarios.listaPorAceptarse.removeAll
	}

	@Test
	def void devolverListaConUsrDiabeticoDiegoPorCriterioDeNombreYCondicionDiabeticos() {
		var usuarioPrototipo = new Usuario
		usuarioPrototipo.nombre = "diego"
		usuarioPrototipo.agregarCondicion(diabetico)
		diego.solicitarIngresoASistema()
		diabeticoDiego.solicitarIngresoASistema()
		admin.aceptarSuscripcion(diego)
		admin.aceptarSuscripcion(diabeticoDiego)
		Assert.assertEquals(#[diabeticoDiego], repousuarios.list(usuarioPrototipo))
	}

}
