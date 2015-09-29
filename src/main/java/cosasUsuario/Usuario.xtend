package cosasUsuario

import condicion.CondicionPreexistente
import consulta.Consulta
import consulta.GestorDeConsultas
import excepcion.FechaInvalidaExcepcion
import excepcion.UsuarioInvalidoExcepcion
import filtro.Filtro
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.Entity
import procesamientoPosterior.ProcesamientoPosterior
import receta.Caracteristica
import receta.Receta
import repositorioRecetas.RepositorioRecetas
import repositorioUsuarios.RepositorioUsuarios
import rutina.Rutina
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.annotation.JsonSerialize
import java.util.Collection
import repositorioRecetas.BuscaReceta

@JsonSerialize
@Accessors
@JsonIgnoreProperties(ignoreUnknown=true)
class Usuario extends Entity {

	// Datos varops
	LocalDate fechaActual = new LocalDate()
	int CARACTERES_MINIMOS = 4
	boolean habilitarFavoritos = false

	// Datos basicos
	String nombre
	double altura
	double peso
	LocalDate fechaDeNacimiento
	String password

	// Grupo
	GrupoUsuario grupoAlQuePertenece

	// Para condiciones preexistentes
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	String sexo
	List<Caracteristica> comidasQueDisgustan = new ArrayList<Caracteristica>
	List<String> comidaPreferida = new ArrayList<String>
	Rutina rutina

	// Recetas
	Set<Receta> recetas = new HashSet<Receta>
	Set<Receta> recetasFavoritas = new HashSet<Receta>
	List<Filtro> filtrosAAplicar = new ArrayList<Filtro>
	ProcesamientoPosterior procesamiento

	//Mensajes
	def double calculaIMC() {
		peso / (altura * altura)
	}

	def void agregarCondicion(CondicionPreexistente condicion) {
		condicionesPreexistentes.add(condicion)
	}

	def validar() {

		if (!(altura > 0 && peso > 0 && nombre.length() >= CARACTERES_MINIMOS)) {
			throw new UsuarioInvalidoExcepcion("Usuario no valido")
		}
		condicionesPreexistentesSonValidas()

		fechaValida(fechaActual, fechaDeNacimiento)

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
		if (fechaActual.isBefore(fechaSegunda))
			throw new FechaInvalidaExcepcion("Se Ingreso una fecha invalida")
	}

	def contienteComidaQueDisgusta(Caracteristica comidaQueDisgusta) {
		comidasQueDisgustan.contains(comidaQueDisgusta)
	}

	def esRecomendable(Receta receta) {
		noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.tolera(receta)]
	}

	def comparteGrupoCon(String usuario) {
		if(usuario == null || grupoAlQuePertenece == null) false else grupoAlQuePertenece.tieneUnUsuario(usuario)
	}

	def marcarComoFavorita(Receta receta) {
		recetasFavoritas.add(receta)
	}

	def agregarFiltro(Filtro filtro) {
		filtrosAAplicar.add(filtro)
	}

	def tieneSobrepeso() {
		calculaIMC > 500
	}

	def indicarProcesamientoPosterior() {
		procesamiento
	}

	def elegirProcesamiento(ProcesamientoPosterior procesamientoProcesado) {
		procesamiento = procesamientoProcesado
	}

	def habilitaSusFavoritos() {
		habilitarFavoritos = true
	}

	def aplicarFiltros() {

		var busquedaReceta = listarRecetasVisibles

		for (filtro : filtrosAAplicar) {
			busquedaReceta = filtro.filtrar(busquedaReceta, this)
		}

		busquedaReceta
	}

	def postProcesarRecetas() {

		var Set<Receta> recetasFiltradas = new HashSet<Receta>
		recetasFiltradas = aplicarFiltros()

		var ProcesamientoPosterior procesamiento = this.indicarProcesamientoPosterior()
		recetasFiltradas = procesamiento.asociarProcesamiento(recetasFiltradas)

		if (habilitaSusFavoritos()) {
			recetasFavoritas.addAll(recetasFiltradas)
			recetasFiltradas = recetasFavoritas
		}

		//Se dispara el gestor de consultas
		var consulta = new Consulta(this, recetasFiltradas)
		GestorDeConsultas.getInstance.monitorear(consulta)

		recetasFiltradas
	}

	def puedeSerSugeridaUnaReceta(Receta receta) {
		(!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(this)) && this.condicionesPreexistentesSonValidas
	}

	def solicitarIngresoASistema() {
		RepositorioUsuarios.getInstance.agregarAListaPendientes(this)
	}

	def Boolean esVegano() {
		condicionesPreexistentes.exists[condicion|condicion.esCondicionVegana]
	}

	def listarRecetasVisibles() {
		var Set<Receta> recetasVisibles = recetas
		recetasVisibles.addAll(RepositorioRecetas.getInstance.listarRecetasVisiblesPara(this))

		if (grupoAlQuePertenece != null) {
			recetasVisibles.addAll(grupoAlQuePertenece.todasLasRecetas)

		}

		recetasVisibles
	}

	def List<Receta> consultar(BuscaReceta consulta) {
		var Collection<Receta> recetasABuscar = listarRecetasVisibles

		if (consulta.filtros != 0) {
			recetasABuscar = postProcesarRecetas
		}

		if (consulta.nombre != null) {
			val nombreConsultado = consulta.nombre
			recetasABuscar = recetasABuscar.filter[receta|receta.nombrePlato.contains(nombreConsultado)].toList
		}

		if (consulta.caloriasMinimas != -1) {
			val caloriasMinimas = consulta.caloriasMinimas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias > caloriasMinimas].toList
		}

		if (consulta.caloriasMaximas != -1) {
			val caloriasMaximas = consulta.caloriasMaximas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias < caloriasMaximas].toList
		}

		if (consulta.dificultad != null) {
			val dificultad = consulta.dificultad
			recetasABuscar = recetasABuscar.filter[receta|receta.dificultad.contains(dificultad)].toList
		}

		if (consulta.temporada != null) {
			val temporada = consulta.temporada
			recetasABuscar = recetasABuscar.filter[receta|receta.temporada.contains(temporada)].toList
		}

		if (consulta.ingrediente != null) {
			val ingrediente = consulta.ingrediente
			recetasABuscar = recetasABuscar.filter[receta|receta.ingredientes.contains(ingrediente)].toList
		}

		return recetasABuscar.toList
	}
}
