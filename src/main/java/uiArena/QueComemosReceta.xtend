package uiArena

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import receta.Ingrediente
import receta.Condimento
import condicion.CondicionPreexistente

@Accessors
class QueComemosReceta{
	String nombre
	Double calorias
	String creador
	String temporada
	String dificultad
	List<Ingrediente> ingredientes
	List<Condimento> condimentos
	Boolean favorita 
	List<CondicionPreexistente> condicionesPreexistentes
	String preparacion
	Ingrediente ingredienteSeleccionado
			
	def volver() {
	}	
	
	def habilitaFavorita(){
		favorita = true
	}
	
	def Ingrediente seleccionarIngrediente(){
		ingredienteSeleccionado
	}
}