import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection
import java.math.BigDecimal
import java.util.Calendar
import java.util.ArrayList

@Accessors
class Usuario {

	double altura
	double peso
	String nombre
	Calendar fechaDeNacimiento
	String sexo
	List<String> comidasQueDisgustan = new ArrayList<String>
	List<String> comidaPreferida = new ArrayList<String>
	List<CondicionPreexitente> condicionesPreexistentes = new ArrayList<CondicionPreexitente>
	Rutina rutina
	Collection<Receta> recetas = new HashSet<Receta>

	def double calculaIMC() {
		peso / (altura * altura)
	}

	def Boolean validar() {
		if (altura > 0 && peso > 0 && fechaDeNacimiento.equals(Calendar.getInstance) && nombre.length() > 4 &&
			condicionesPreexistentesSonValidas()) {
			/** valida la creacion del usuario */
		}
	}

	def crearReceta(String nombrePlato, Collection<Ingrediente> ingredientes, Collection<Condimento> condimentos,
		Collection<String> procesoPreparacion, BigDecimal totalCalorias, DificultadPreparacion dificultadCargada,
		Temporada temporadaCargada) {

		var receta = new Receta(nombrePlato, ingredientes, condimentos, procesoPreparacion, totalCalorias,
			dificultadCargada, temporadaCargada)
		receta = receta.puedeSerCreada(receta)
		recetas.add(receta)
	}

	def modificarReceta(Receta receta, String nombrePlato, Collection<Ingrediente> ingredientes,
		Collection<Condimento> condimentos, Collection<String> procesoPreparacion, BigDecimal totalCalorias,
		DificultadPreparacion dificultadCargada, Temporada temporadaCargada) {

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

	def tieneLaReceta(Receta receta) {
		recetas.contains(receta)
	}

	def boolean noTieneCondicionesPreexistentes() {
		condicionesPreexistentes.empty
	}

	def boolean condicionesPreexistentesSonValidas() {
		condicionesPreexistentes.forall[it.valido(this)]
	}

	def boolean sigueUnaRutinaSaludable() {
		(noTieneCondicionesPreexistentes() && calculaIMC() >= 18 && calculaIMC() <= 30) ||
			condicionesPreexistentes.forall[it.tieneRutinaSaludable()]
	}
}
