package repositorioRecetas

import org.eclipse.xtend.lib.annotations.Accessors
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject

@Accessors
class AdapterConsultaRecetas {
	BuscaReceta consultaTransformada
	JsonParserConsulta transformer = new JsonParserConsulta
	JsonParserConsulta consulta = new JsonParserConsulta

	def BuscaReceta obtenerConsulta(String consultaJson) {
		parsearJSON(consultaJson)
	}

	def parsearJSON(String s) {
		var JsonArray jsonArray = JsonArray.readFrom(s)
		var JsonObject jsonObject = jsonArray.asObject
		consulta = transformer.parsear(jsonObject)
		consultaTransformada = consulta.transformarConsulta(consulta)
		consultaTransformada
	}
}
