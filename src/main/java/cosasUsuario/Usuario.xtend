package cosasUsuario

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection
import java.util.ArrayList
import java.util.Set
import excepcion.BusinessException
import condicion.CondicionPreexistente
import rutina.Rutina
import receta.Receta
import receta.Ingrediente
import receta.Condimento

@Accessors
class Usuario {

	//Atributos
	double altura
	double peso
	String nombre
	long fechaDeNacimiento
	String sexo
	long fechaActual = 20151231

	// "Define" de minimo de caracteres para nombre
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
		if(altura > 0 && peso > 0 && fechaDeNacimiento <= fechaActual  && nombre.length() >= CARACTERES_MINIMOS &&
			condicionesPreexistentesSonValidas()){}
			else{throw new BusinessException("Usuario no valido")}
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

	def Receta crearReceta(String nombrePlato, Set<Ingrediente> ingredientes, Set<Condimento> condimentos,
		List<String> procesoPreparacion, double totalCalorias, String dificultadCargada, String temporadaCargada) {

		var receta = new Receta(nombrePlato, ingredientes, condimentos, procesoPreparacion, totalCalorias,
			dificultadCargada, temporadaCargada)
		receta = receta.puedeSerCreada(receta)
		recetas.add(receta)
		receta
	}

	def modificarReceta(Receta receta, String nombrePlato, Collection<Ingrediente> ingredientes,
		Collection<Condimento> condimentos, Collection<String> procesoPreparacion, double totalCalorias,
		String dificultadCargada, String temporadaCargada) {

		receta.puedeModificarReceta(this)
		val recetaNueva = new Receta(receta.nombrePlato, receta.ingredientes, receta.condimentos,
			receta.procesoPreparacion, receta.totalCalorias, receta.dificultad, receta.temporada)
		recetaNueva.nombrePlato.concat(nombrePlato)
		recetaNueva.ingredientes.addAll(ingredientes)
		recetaNueva.condimentos.addAll(condimentos)
		recetaNueva.procesoPreparacion.addAll(procesoPreparacion)
		recetaNueva.dificultad = dificultadCargada
		recetaNueva.temporada = temporadaCargada
		recetas.add(recetaNueva)
	}
	
	def agregarRecetaAUnaPrincipal(Receta recetaPrincipal, Receta subReceta){
		recetaPrincipal.puedeModificarReceta(this)
		subReceta.puedeModificarReceta(this)
		recetaPrincipal.aniadirReceta(subReceta)
	}

}
