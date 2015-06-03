package repositorioRecetas

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Ingrediente
import receta.Receta

@Accessors
class JsonParserReceta {
	String nombre
	List<String> ingredientes = new ArrayList<String>
	int tiempoPreparacion
	int totalCalorias
	String dificultadReceta
	String autor
	int anioReceta

	def transformarReceta(JsonParserReceta receta) {
		var Receta recetaTransformada = new Receta(receta.nombre, this.transformarIngredientes(receta.ingredientes),
			emptySet, emptyList, receta.totalCalorias as double, receta.dificultadReceta, "")
		recetaTransformada.asignarAutor(receta.autor)
		recetaTransformada
	}

	def transformarIngredientes(List<String> ingredientes) {
		var Set<Ingrediente> ingredientesTransformados = new HashSet<Ingrediente>
		for (ingrediente : ingredientes) {
			var Ingrediente ingredienteTransformado = new Ingrediente(ingrediente, 0, "")
			ingredientesTransformados.add(ingredienteTransformado)
		}
		ingredientesTransformados
	}

}
