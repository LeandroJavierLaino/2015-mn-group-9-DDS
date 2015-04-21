import org.eclipse.xtend.lib.annotations.Accessors
import java.math.BigDecimal
import java.util.Collection
import java.util.ArrayList
import java.util.HashSet

@Accessors
class Receta {

	String nombrePlato
	Collection<Ingrediente> ingredientes = new HashSet<Ingrediente>
	Collection<Condimento> condimentos = new HashSet<Condimento>
	Collection<String> procesoPreparacion = new ArrayList<String>
	Collection<Usuario> tiposDeUsuariosInadecuados
	BigDecimal totalCalorias
	DificultadPreparacion dificultad
	Temporada temporada
	BigDecimal cantidadMinimaCalorias
	BigDecimal cantidadMaximaCalorias
	Collection<Receta> subRecetas = new HashSet<Receta>

	new(String nombre, Collection<Ingrediente> ingredientesCargados, Collection<Condimento> condimentosCargados,
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

	def puedeSerCreada(Receta receta) {
		if (hayUnIngrediente(receta.ingredientes) && totalDeCaloriasEnRango(receta.totalCalorias)) {
			receta
		} else {
			throw new BusinessException("No está en el rango de calorías o no tiene un ingrediente la receta")
		}
	}

	def hayUnIngrediente(Collection<Ingrediente> ingredientes) {
		ingredientes.size > 1
	}

	def totalDeCaloriasEnRango(BigDecimal totalCalorias) {
		(totalCalorias > cantidadMinimaCalorias) && (totalCalorias < cantidadMaximaCalorias)
	}

	//yo supongo que las recetas publicas son identicas a las recetas comunes, no valdria la pena hacer otra clase porque importa quien la crea no donde
	//Lo unico que hay una pequeña logica repetida que hace que sistema y usuario entiendan el mismo metodo que hace lo mismo, quiza habria que hacer una interfaz
	def puedeVerOModificarReceta(Usuario usuario) {
		usuario.tieneLaReceta(this) || Sistema.tieneLaReceta(this)
	}

	def modificarReceta(Usuario usuario) {
		if (puedeVerOModificarReceta(usuario)) {
		} else {
			throw new BusinessException("No puede ver o modificar la receta")
		}
	}

	def esInadecuadaPara(Usuario usuario) {
		if(ingredientes.exists[it.nombre.equals("Azucar")] && ){
			
		}
		
	}
	
}
