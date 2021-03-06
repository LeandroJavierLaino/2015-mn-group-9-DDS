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
import receta.RecetaBuilder
import org.uqbar.xtrest.json.JSONUtils

@Accessors
class JsonParserReceta {
	String nombre
	List<String> ingredientes = new ArrayList<String>
	int tiempoPreparacion
	int totalCalorias
	String dificultadReceta
	String autor
	int anioReceta

	extension JSONUtils = new JSONUtils
	
	def Receta transformarReceta(JsonParserReceta receta) {
		
		var Receta recetaTransformada = new RecetaBuilder()
		.nombre(receta.nombre)
		.ingredientes(this.transformarIngredientes(receta.ingredientes))
		.conCalorias(receta.totalCalorias as double)
		.dificultad(receta.dificultadReceta)
		.creadaPor(receta.autor)
		.esPublica
		.build //esto devuelve la receta que creo
			
		recetaTransformada
	}

	def transformarIngredientes(List<String> ingredientes) {
		var Set<Ingrediente> ingredientesTransformados = new HashSet<Ingrediente>
		for (ingrediente : ingredientes) {
			var Ingrediente ingredienteTransformado = ingrediente.fromJson(Ingrediente)
			ingredientesTransformados.add(ingredienteTransformado)
		}
		ingredientesTransformados
	}

	def JsonParserReceta parsear(JsonObject object) {
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
