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
	JsonParserReceta transformer = new JsonParserReceta
	Receta recetaTransformada
	List<Receta> recetasFinales = new ArrayList<Receta>

	def List<Receta> obtenerRecetas() {
		obtenerRecetas(new BusquedaRecetas())
	}
	def List<Receta> obtenerRecetas(BusquedaRecetas busquedaRecetas) {
		var String s = this.getRecetas(busquedaRecetas)
		parsearJSON(s)
	}

	def parsearJSON(String s) {
		var JsonArray jsonArray = JsonArray.readFrom(s)
		for (JsonValue value : jsonArray) {
			var JsonObject jsonObject = value.asObject
			receta = transformer.parsear(jsonObject)
			recetaTransformada = receta.transformarReceta(receta)
			recetasFinales.add(recetaTransformada)
		}
		recetasFinales
	}
	
}

