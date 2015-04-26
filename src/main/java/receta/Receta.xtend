package receta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import java.util.ArrayList
import java.util.HashSet
import java.util.Set
import java.util.List
import cosasUsuario.Usuario
import repositorioRecetas.RepositorioRecetas
import excepcion.RecetaInvalidaExcepcion
import excepcion.SinPermisosExcepcion

@Accessors
class Receta {

	String nombrePlato
	Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
	Set<Condimento> condimentos = new HashSet<Condimento>
	List<String> procesoPreparacion = new ArrayList<String>
	double totalCalorias
	String dificultad
	String temporada
	double cantidadMinimaCalorias = 10
	double cantidadMaximaCalorias = 5000
	Set<Receta> subRecetas = new HashSet<Receta>

	new(String nombre, Set<Ingrediente> ingredientesCargados, Set<Condimento> condimentosCargados,
		List<String> procesoPreparacionCargado, double caloriasCargadas,
		String dificultadCargada, String temporadaCargada) {
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
			throw new RecetaInvalidaExcepcion("No está en el rango de calorías o no tiene un ingrediente la receta")
		}
	}

	def hayUnIngrediente(Collection<Ingrediente> ingredientes) {
		ingredientes.size >= 1
	}

	def totalDeCaloriasEnRango(double totalCalorias) {
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
			throw new SinPermisosExcepcion("No puede ver o modificar la receta")//Antes Business
		}
	}
	
	def contieneComida(String unaComida,int unaCantidad){
		condimentos.exists[condimento | condimento.esParteDe(unaComida,unaCantidad)] || ingredientes.exists[ingrediente | ingrediente.esParteDe(unaComida,unaCantidad)]
	}
	
	def esRecomendablePara(Usuario unUsuario) {
		unUsuario.noTieneCondicionesPreexistentes() || unUsuario.condicionesPreexistentes.forall[it.tolera(this)]
	}
	
	def aniadirReceta(Receta receta){
		subRecetas.add(receta)
	}
}
