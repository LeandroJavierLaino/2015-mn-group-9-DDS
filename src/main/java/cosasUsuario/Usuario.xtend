package cosasUsuario

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.ArrayList
import java.util.Set
import excepcion.BusinessException
import condicion.CondicionPreexistente
import rutina.Rutina
import receta.Receta
import org.joda.time.LocalDate


@Accessors
class Usuario {

	double altura
	double peso
	String nombre
	String sexo
	LocalDate fechaActual = new LocalDate()
	LocalDate fechaDeNacimiento
	int CARACTERES_MINIMOS = 4

	List<String> comidasQueDisgustan = new ArrayList<String>
	List<String> comidaPreferida = new ArrayList<String>

	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	Rutina rutina
	Set<Receta> recetas = new HashSet<Receta>

	//Mensajes
	def double calculaIMC() {
		peso / (altura * altura)
	}

	def void agregarCondicion(CondicionPreexistente condicion) {
		condicionesPreexistentes.add(condicion)
	}

	def void agregarComidaALista(List<String> lista, String comida) {
		lista.add(comida)
	}

	def validar() {
		if (altura > 0 && peso > 0 && nombre.length() >= CARACTERES_MINIMOS && condicionesPreexistentesSonValidas()) {
			fechaValida(fechaActual, fechaDeNacimiento)
		} else {
			throw new BusinessException("Usuario no valido")
		}
	}

	def tieneLaReceta(Receta receta) {
		recetas.contains(receta)
	}

	def Boolean noTieneCondicionesPreexistentes() {
		condicionesPreexistentes.empty
	}

	def Boolean condicionesPreexistentesSonValidas() {
		noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.valido(this)]
	}

	def Boolean sigueUnaRutinaSaludable() {
		(calculaIMC() >= 18 && calculaIMC() <= 30) &&
			(noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.tieneRutinaSaludable(this)])
	}

	def agregarRecetaAUnaPrincipal(Receta recetaPrincipal, Receta subReceta) {
		recetaPrincipal.puedeModificarReceta(this)
		subReceta.puedeModificarReceta(this)
		recetaPrincipal.aniadirReceta(subReceta)
	}

	def agregarReceta(Receta receta) {
		recetas.add(receta)
	}

	def borrarReceta(Receta receta) {
		recetas.remove(receta)
	}

	def fechaValida(LocalDate fechaActual, LocalDate fechaSegunda) {
		if (fechaActual.getYear > fechaSegunda.getYear) {
			throw new BusinessException("Se ingreso una fecha con año mayor al actual")
		} else if (fechaActual.getMonthOfYear < fechaSegunda.getMonthOfYear) {
			throw new BusinessException("Se ingreso una fecha con un mes mayor al actual")
		} else if (fechaActual.getDayOfMonth > fechaSegunda.getDayOfMonth)
			throw new BusinessException("Se ingreso un día mayor al actual")
	}
}

