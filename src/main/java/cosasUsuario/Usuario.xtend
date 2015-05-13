package cosasUsuario

import condicion.CondicionPreexistente
import excepcion.FechaInvalidaExcepcion
import excepcion.UsuarioInvalidoExcepcion
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import receta.Receta
import rutina.Rutina
import filtro.FiltroPosta
import postProcesado.PostProcesoPosta

@Accessors
class Usuario {

	double altura
	double peso
	String nombre
	String sexo
	LocalDate fechaActual = new LocalDate()
	LocalDate fechaDeNacimiento
	int CARACTERES_MINIMOS = 4
	FiltroPosta filtro
	PostProcesoPosta postProceso

	List<String> comidasQueDisgustan = new ArrayList<String>
	List<String> comidaPreferida = new ArrayList<String>

	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	Rutina rutina
	Set<Receta> recetas = new HashSet<Receta>
	
	List<Receta> recetasPorFiltros//hay que generar primero un clon de las recetas que conoce un usuario.


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
			throw new UsuarioInvalidoExcepcion("Usuario no valido")
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
			throw new FechaInvalidaExcepcion("Se ingreso una fecha con año mayor al actual")
		} else if (fechaActual.getMonthOfYear < fechaSegunda.getMonthOfYear) {
			throw new FechaInvalidaExcepcion("Se ingreso una fecha con un mes mayor al actual")
		} else if (fechaActual.getDayOfMonth > fechaSegunda.getDayOfMonth)
			throw new FechaInvalidaExcepcion("Se ingreso un día mayor al actual")
	}
	
	def filtrar(Receta unaReceta){
		recetasPorFiltros.remove(unaReceta)
	}
	
	def conoceReceta(Receta receta) {
		recetasPorFiltros.contains(receta)
	}
	
	def leDisgusta(Receta receta) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def boolean tieneSobrepeso() {
		this.calculaIMC()>500
	}
	
	def filtrarRecetas(){
		recetasPorFiltros.forEach[receta|filtro.filtrar(this,receta)]
	}
	
	
	def postProcesar(){
		postProceso.postProcesar(this, recetasPorFiltros);
	}
}


