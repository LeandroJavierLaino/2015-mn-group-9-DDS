package cosasUsuario

import condicion.CondicionPreexistente
import org.joda.time.LocalDate
import receta.Caracteristica
import receta.Palabras
import receta.Receta
import repositorioUsuarios.RepositorioUsuarios
import rutina.Rutina
import procesamientoPosterior.ProcesamientoPosterior

class UsuarioBuilder {
	
	Usuario usuario = new Usuario()
	
	def UsuarioBuilder administrador() {
		usuario = new UsuarioAdministrador()
		this
	}
	def UsuarioBuilder conNombre(String nombre) {
		usuario.nombre = nombre
		this
	}
	def UsuarioBuilder conPeso(double peso) {
		usuario.peso = peso
		this
	}
	def UsuarioBuilder conAltura(double altura) {
		usuario.altura = altura
		this
	}
	def UsuarioBuilder fechaDeNacimiento(LocalDate fecha) {
		usuario.fechaDeNacimiento = fecha
		this
	}
	def UsuarioBuilder conCondicion(CondicionPreexistente cond) {
		usuario.condicionesPreexistentes.add(cond)
		this
	}
	def UsuarioBuilder deSexo(String sex) {
		usuario.sexo = sex
		this
	}
	def UsuarioBuilder leDisgusta(Caracteristica comida) {
		usuario.comidasQueDisgustan.add(comida)
		this
	}
	def UsuarioBuilder leGusta(Palabras comida) {
		usuario.comidaPreferida.add(comida)
		this
	}
	def UsuarioBuilder conRutina(Rutina rutina) {
		usuario.rutina = rutina
		this
	}
	def UsuarioBuilder conReceta(Receta receta) {
		usuario.agregarReceta(receta)
		this
	}
	def UsuarioBuilder conPass(String password) {
		usuario.password = password
		this
	}
	def UsuarioBuilder conProcesamiento(ProcesamientoPosterior procesamientoPosterior) {
		usuario.procesamiento = procesamientoPosterior
		this
	}
	def Usuario build(){
		RepositorioUsuarios.instance.add(usuario)
		usuario
	}
}