package repositorioRecetas

import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import com.eclipsesource.json.JsonValue
import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas
import receta.Receta

class AdapterRepositorioRecetas extends RepoRecetas {

	JsonParserReceta receta = new JsonParserReceta
	Receta recetaTransformada
	List<Receta> recetasFinales = new ArrayList<Receta>

	def obtenerRecetas(BusquedaRecetas busquedaRecetas) {
		var List<String> ingrediente = new ArrayList<String>
		var String s = this.getRecetas(busquedaRecetas)
		parsearJSON(s, ingrediente)
	}

	def parsearJSON(String s, List<String> ingrediente) {
		var JsonArray jsonArray = JsonArray.readFrom(s)
		for (JsonValue value : jsonArray) {
			var JsonObject jsonObject = value.asObject
			receta.nombre = jsonObject.get("nombre").asString
			var JsonArray ingredientes = jsonObject.get("ingredientes").asArray
			for (JsonValue value2 : ingredientes) {
				ingrediente.add(value2.asString)
			}
			receta.tiempoPreparacion = jsonObject.get("tiempoPreparacion").asInt
			receta.totalCalorias = jsonObject.get("totalCalorias").asInt
			receta.dificultadReceta = jsonObject.get("dificultadReceta").asString
			receta.autor = jsonObject.get("autor").asString
			receta.anioReceta = jsonObject.get("anioReceta").asInt
			recetaTransformada = receta.transformarReceta(receta)
			recetasFinales.add(recetaTransformada)
		}
		recetasFinales
	}
	
}

