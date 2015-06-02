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
import receta.Caracteristica
import receta.Receta
import rutina.Rutina
import filtro.Filtro
import procesamientoPosterior.ProcesamientoPosterior
import repositorioRecetas.RepositorioRecetas
import org.uqbar.commons.model.Entity
import repositorioUsuarios.RepositorioUsuarios
import condicion.CondicionVegano
import consulta.Consulta
import consulta.GestorDeConsultas

@Accessors
class Usuario extends Entity{

	double altura
	double peso
	String nombre
	String sexo
	LocalDate fechaActual = new LocalDate()
	LocalDate fechaDeNacimiento
	int CARACTERES_MINIMOS = 4
	List<Filtro> filtrosAAplicar = new ArrayList<Filtro>
	List<Caracteristica> comidasQueDisgustan = new ArrayList<Caracteristica>
	List<String> comidaPreferida = new ArrayList<String>
	ProcesamientoPosterior procesamiento
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	Rutina rutina
	Set<Receta> recetas = new HashSet<Receta>
	Set<Receta> recetasFavoritas = new HashSet<Receta>
	GrupoUsuario grupoAlQuePertenece
	
	boolean habilitarFavoritos = false

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
	
	/*def validar() {
		if (altura > 0 && peso > 0 && nombre.length() >= CARACTERES_MINIMOS && condicionesPreexistentesSonValidas()) {
			fechaValida(fechaActual, fechaDeNacimiento)
		} else {
			throw new UsuarioInvalidoExcepcion("Usuario no valido")
		}
	}*/

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

	/*def fechaValida(LocalDate fechaActual, LocalDate fechaSegunda) {
		if (fechaActual.getYear > fechaSegunda.getYear) {
			throw new FechaInvalidaExcepcion("Se ingreso una fecha con año mayor al actual")
		} else if (fechaActual.getMonthOfYear < fechaSegunda.getMonthOfYear) {
			throw new FechaInvalidaExcepcion("Se ingreso una fecha con un mes mayor al actual")
		} else if (fechaActual.getDayOfMonth > fechaSegunda.getDayOfMonth)
			throw new FechaInvalidaExcepcion("Se ingreso un día mayor al actual")
	}*/
	
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
		
		var busquedaReceta = RepositorioRecetas.getInstance().listarRecetasVisiblesPara(this)
		
		for(filtro : filtrosAAplicar){
			busquedaReceta = filtro.filtrar(busquedaReceta,this)
		}
		
		System.out.println(nombre + " " + busquedaReceta.map[it.nombrePlato])
		
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
		System.out.println(nombre + " " + recetasFavoritas.map[it.nombrePlato])
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
		condicionesPreexistentes.contains(CondicionVegano)
	}
}


