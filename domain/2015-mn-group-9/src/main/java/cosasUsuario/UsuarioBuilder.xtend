package cosasUsuario

import org.joda.time.LocalDate
import condicion.CondicionPreexistente
import receta.Caracteristica
import rutina.Rutina
import receta.Receta

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
	def UsuarioBuilder leGusta(String comida) {
		usuario.comidaPreferida.add(comida)
		this
	}
	def UsuarioBuilder conRutina(Rutina rutina) {
		usuario.rutina = rutina
		this
	}
	def UsuarioBuilder conReceta(Receta receta) {
		usuario.recetas.add(receta)
		this
	}
	def Usuario build(){
		usuario
	}
}