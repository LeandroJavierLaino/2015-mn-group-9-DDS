import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection
import java.util.ArrayList
import java.util.Set

@Accessors
class Usuario {

	//Atributos
	double altura
	double peso
	String nombre
	//String fechaDeNacimiento
	long fechaDeNacimiento
	String sexo
	//final String FECHA_ACTUAL = "31/12/2015"
	final long FECHA_ACTUAL = 20151231
	final double NULO = 0

	// "Define" de minimo de caracteres para nombre
	int CARACTERES_MINIMOS = 4

	List<String> comidasQueDisgustan = new ArrayList<String>
	List<String> comidaPreferida = new ArrayList<String>

	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	Rutina rutina
	Set<Receta> recetas = new HashSet<Receta>

	//Mensajes
	def double calculaIMC() {
		if(peso.equals(NULO) || altura.equals(NULO))
			throw new ExcepcionUsuario("Error: el campo de Peso o Altura es nulo")
			
		peso / (altura * altura)
	}

	def void agregarCondicion(CondicionPreexistente condicion) {
		condicionesPreexistentes.add(condicion)
	}

	def void agregarComidaALista(List<String> lista, String comida) {
		lista.add(comida)
	}

	def boolean validar() {
		altura > 0 && peso > 0 && fechaDeNacimiento <= FECHA_ACTUAL && nombre.length() >= CARACTERES_MINIMOS &&
			condicionesPreexistentesSonValidas()
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
		(noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.tieneRutinaSaludable(this)]) && calculaIMC() >= 18 && calculaIMC() <= 30
	}

	def crearReceta(String nombrePlato, Set<Ingrediente> ingredientes, Set<Condimento> condimentos,
		List<String> procesoPreparacion, double totalCalorias, String dificultadCargada, String temporadaCargada) {

		var receta = new Receta(nombrePlato, ingredientes, condimentos, procesoPreparacion, totalCalorias,
			dificultadCargada, temporadaCargada)
		receta = receta.puedeSerCreada(receta)
		recetas.add(receta)
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

}
