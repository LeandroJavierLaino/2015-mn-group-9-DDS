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
		ingredientes.size >= 1
	}

	def totalDeCaloriasEnRango(BigDecimal totalCalorias) {
		(totalCalorias > cantidadMinimaCalorias) && (totalCalorias < cantidadMaximaCalorias)
	}

	def boolean puedeVerReceta(Usuario usuario) {
		usuario.tieneLaReceta(this) || RepositorioRecetas.tieneLaReceta(this)
	}

	def boolean tienePermisosParaModificarReceta(Usuario usuario) {
		usuario.tieneLaReceta(this) || RepositorioRecetas.tieneLaReceta(this)
	}

	def puedeModificarReceta(Usuario usuario) {
		if (tienePermisosParaModificarReceta(usuario) && puedeVerReceta(usuario)) {
		} else {
			throw new BusinessException("No puede ver o modificar la receta")
		}
	}
	
	def tieneAzucarMayorA100(Collection<Condimento> condimentos){
		condimentos.exists[condimento | condimento.cantidad > 100 && condimento.nombre.equalsIgnoreCase("Azucar")]
	}
	
	def esRecomendablePara(Usuario unUsuario) {
		unUsuario.noTieneCondicionesPreexistentes() || unUsuario.condicionesPreexistentes.forall[it.tolera(this)]
	}
}
