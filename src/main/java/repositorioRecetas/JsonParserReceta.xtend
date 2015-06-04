package repositorioRecetas

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Ingrediente
import receta.Receta
import com.eclipsesource.json.JsonObject
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue


@Accessors
class JsonParserReceta {
	String nombre
	List<String> ingredientes = new ArrayList<String>
	int tiempoPreparacion
	int totalCalorias
	String dificultadReceta
	String autor
	int anioReceta

	def Receta transformarReceta(JsonParserReceta receta) {
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

	def parsear(JsonObject object) {
		var List<String> ingrediente = new ArrayList<String>
		this.nombre = object.get("nombre").asString
		var JsonArray ingredientes = object.get("ingredientes").asArray
		for (JsonValue value2 : ingredientes) {
			ingrediente.add(value2.asString)
		}
		this.tiempoPreparacion = object.get("tiempoPreparacion").asInt
		this.totalCalorias = object.get("totalCalorias").asInt
		this.dificultadReceta = object.get("dificultadReceta").asString
		this.autor = object.get("autor").asString
		this.anioReceta = object.get("anioReceta").asInt
		this
	}

}
