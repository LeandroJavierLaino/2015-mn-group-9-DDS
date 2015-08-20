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
	
	List<Ingrediente> ingredientes
	List<Condimento> condimentos
	List<String> procesoPreparacion
	List<Receta> subRecetas
	List<CondicionPreexistente> condicionesPreexistentes
	
	double totalCalorias
	
	Usuario creador
	
	Ingrediente ingredienteSeleccionado

	new(Receta receta) {
		recipe = receta
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
}