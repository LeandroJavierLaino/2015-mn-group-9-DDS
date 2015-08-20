package ui

import receta.Receta
import receta.Ingrediente
import receta.Condimento
import java.util.List
import condicion.CondicionPreexistente
import cosasUsuario.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RecipeModel {
	
	Receta recipe
	String nombrePlato
	String dificultad
	String temporada
	String procedimiento
	
	List<Condimento> condimentos
	List<Ingrediente> ingredientes
	List<String> procesoPreparacion
	List<Receta> subRecetas
	List<CondicionPreexistente> condicionesPreexistentes
	
	double totalCalorias
	
	Usuario creador
	Usuario usuario
	
	Ingrediente ingredienteSeleccionado

	new(Receta receta, Usuario user) {
		recipe = receta
		usuario = user
	}
	def inspeccionarReceta() {
		nombrePlato = recipe.nombrePlato
		
		procesoPreparacion = recipe.procesoPreparacion
		totalCalorias = recipe.totalCalorias
		dificultad = recipe.dificultad
		creador = recipe.creador
		temporada = recipe.temporada
		
		ingredientes = recipe.ingredientes.toList
		condimentos = recipe.condimentos.toList
	}
	def esFavorita() {
		usuario.recetasFavoritas.contains(recipe)
	}
	def String preparacion() {
		
		procedimiento = ""
		for(paso:procesoPreparacion) {
			if(paso != procesoPreparacion.last)
				procedimiento += paso + ", "
			else
				procedimiento += paso
		}
		procedimiento
	}
}