import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashMap
import java.util.Map
import java.math.BigDecimal
import java.util.Collection
import java.util.ArrayList
import java.util.HashSet

@Accessors
class Receta {

	String nombrePlato
	Map<String, BigDecimal> ingredientes = new HashMap<String, BigDecimal>
	Map<String, Integer> condimentos = new HashMap<String, Integer>
	Collection<String> procesoPreparacion = new ArrayList<String>
	Collection<Usuario> tiposDeUsuariosInadecuados
	BigDecimal totalCalorias
	DificultadPreparacion dificultad
	Temporada temporada
	BigDecimal cantidadMinimaCalorias
	BigDecimal cantidadMaximaCalorias
	Collection<Receta> subRecetas = new HashSet<Receta>

	new(String nombre, Map<String, BigDecimal> ingredientesCargados, Map<String, Integer> condimentosCargados,
		Collection<String> procesoPreparacionCargado, BigDecimal caloriasCargadas,
		DificultadPreparacion dificultadCargada, Temporada temporadaCargada) {
		nombrePlato = nombre
		ingredientes = ingredientesCargados
		condimentos = condimentosCargados
		procesoPreparacion = procesoPreparacionCargado
		totalCalorias = caloriasCargadas
		dificultad = dificultadCargada
		temporada = temporadaCargada
	}

	def crearReceta(String nombrePlato, Map<String, BigDecimal> ingredientes, Map<String, Integer> condimentos,
		Collection<String> procesoPreparacion, BigDecimal totalCalorias, DificultadPreparacion dificultadCargada,
		Temporada temporadaCargada) {
			
		if (hayUnIngrediente(ingredientes) && totalDeCaloriasEnRango(totalCalorias)) {
			val Receta receta = new Receta(nombrePlato, ingredientes, condimentos, procesoPreparacion, totalCalorias,
				dificultadCargada, temporadaCargada)
				receta
		} else {
			throw new RuntimeException //TODO: crear clase propia para excepciones de negocio
		}
	}

	def hayUnIngrediente(Map<String, BigDecimal> ingredientes) {
		ingredientes.size >= 1
	}

	def totalDeCaloriasEnRango(BigDecimal totalCalorias) {
		(totalCalorias > cantidadMinimaCalorias) && (totalCalorias < cantidadMaximaCalorias)
	}
	
	//yo supongo que las recetas publicas son identicas a las recetas comunes, no valdria la pena hacer otra clase porque importa quien la crea no donde
	//Lo unico que hay una pequeña logica repetida que hace que sistema y usuario entiendan el mismo metodo que hace lo mismo, quiza habria que hacer una interfaz
	def puedeVerOModificarReceta(Usuario usuario){
		usuario.tieneLaReceta(this) || Sistema.tieneLaReceta(this)
	}
	
	def modificarReceta(Usuario usuario){
		if(puedeVerOModificarReceta(usuario)){
			//aca una de dos, o hacemos que venga por parametro todo a lo cabeza y que pise lo que hay, o habria que ver la forma de hacerlo medio dinamico
		}else{
			throw new RuntimeException //TODO: crear clase propia para excepciones de negocio
		}
	}
	
	//TODO: Falta el comportamiento con las condiciones preexistentes
	
	def esRecomendablePara(Usuario unUsuario) {
		unUsuario.condicionesPreexistentes.forall[it.tolera(this)]
	}
}
