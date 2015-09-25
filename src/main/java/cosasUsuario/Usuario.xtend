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

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class Usuario extends Entity{
	
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
		
		if(!(altura > 0 && peso > 0 && nombre.length() >= CARACTERES_MINIMOS)) {
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
	
	def esRecomendable(Receta receta){
		noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.tolera(receta)]
	}
	
	def comparteGrupoCon(Usuario usuario) {
		grupoAlQuePertenece.tieneUnUsuario(usuario)
	}
	
	def marcarComoFavorita(Receta receta){
		recetasFavoritas.add(receta)
	}
	
	def agregarFiltro(Filtro filtro){
		filtrosAAplicar.add(filtro)
	}
	
	def tieneSobrepeso(){
		calculaIMC > 500
	}
	
	def indicarProcesamientoPosterior() {
		procesamiento
	}
	
	def elegirProcesamiento(ProcesamientoPosterior procesamientoProcesado){
		procesamiento = procesamientoProcesado
	}
	
	def habilitaSusFavoritos() {
		habilitarFavoritos = true	
	}
	
	def aplicarFiltros(){
		
		var busquedaReceta = listarRecetasVisibles
		
		for(filtro : filtrosAAplicar){
			busquedaReceta = filtro.filtrar(busquedaReceta,this)
		}
		
		busquedaReceta
	}
	
	def postProcesarRecetas(){
		
		var Set<Receta> recetasFiltradas = new HashSet<Receta>
		recetasFiltradas = aplicarFiltros()
		
		var ProcesamientoPosterior procesamiento = this.indicarProcesamientoPosterior()
		recetasFiltradas = procesamiento.asociarProcesamiento(recetasFiltradas)
		
		if(habilitaSusFavoritos()){
			recetasFavoritas.addAll(recetasFiltradas)
			recetasFiltradas = recetasFavoritas
		}
		
		//Se dispara el gestor de consultas
		var consulta = new Consulta(this, recetasFiltradas)
		GestorDeConsultas.getInstance.monitorear(consulta)
		
		recetasFiltradas
	}
	
	def puedeSerSugeridaUnaReceta(Receta receta){
		(!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(this)) && this.condicionesPreexistentesSonValidas
	}
	
	def solicitarIngresoASistema(){
		RepositorioUsuarios.getInstance.agregarAListaPendientes(this)
	}
	
	def Boolean esVegano() {
		condicionesPreexistentes.exists[condicion | condicion.esCondicionVegana]
	}
	def listarRecetasVisibles() {
		var Set<Receta> recetasVisibles = recetas
		recetasVisibles.addAll(RepositorioRecetas.getInstance.listarRecetas)
		
		if(grupoAlQuePertenece != null) {
			recetasVisibles.addAll(grupoAlQuePertenece.todasLasRecetas)
		
		}
		
		recetasVisibles
	}
}
