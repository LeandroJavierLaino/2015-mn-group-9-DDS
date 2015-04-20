import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection
import java.math.BigDecimal
import java.util.Calendar

@Accessors
class Usuario {

	double altura
	double peso
	String nombre
	Calendar fechaDeNacimiento
	String sexo /** aunque podria hacerce de otra manera pero no se me ocurre :S */

	/** para saber que comidas le disgustan o le gustan a un usuario  */
	List<String> comidasQueDisgustan
	List<String> comidaPreferida

	/** para las condiciones preexistentes podriamos usar un Strategy o un List de Strategys :O 
	 *  releyendo un poco en la parte de validacion da idea que cada CondicionPreexistente es una Clase que entiende el mensaje validar()*/
	List<CondicionPreexitente> condicionesPreexistentes

	/** se puede usar un Interface a una Rutina y que de esa salgan dos "subtipos" de rutinas ej. Sedentaria o Activa, esto tambien no puede dar chances de que un Usuario pueda a futuro 
	 * cambiar de tipo de Rutina
	 */
	Rutina rutina

	/** lista de recestas que conoce el usuario */
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
			
		val receta = new Receta(nombrePlato, ingredientes, condimentos, procesoPreparacion, totalCalorias,
			dificultadCargada, temporadaCargada)
		receta.puedeSerCreada(receta)
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
		if (noTieneCondicionesPreexistentes() && calculaIMC() >= 18 && calculaIMC() <= 30) {
			true
		} else {
			condicionesPreexistentes.forall[it.tieneRutinaSaludable()]
		}
	}
}
