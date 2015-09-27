package repositorioRecetas

import org.eclipse.xtend.lib.annotations.Accessors
import com.eclipsesource.json.JsonObject

@Accessors
class JsonParserConsulta {
	String usuario
	String nombre
	int caloriasMinimas
	int caloriasMaximas
	String temporada
	String dificultad
	String ingrediente
	boolean filtros

	def JsonParserConsulta parsear(JsonObject object) {
		this.usuario = object.get("usuario").asString
		this.nombre = object.get("nombre").asString
		this.caloriasMinimas = object.get("caloriasMinimas").asInt
		this.caloriasMaximas = object.get("caloriasMaximas").asInt
		this.temporada = object.get("temporada").asString
		this.dificultad = object.get("dificultad").asString
		this.ingrediente = object.get("ingrediente").asString
		this.filtros = object.get("filtros").asBoolean
		this
	}
	
	def BuscaReceta transformarConsulta(JsonParserConsulta consulta){
		var BuscaReceta consultaTransformada = new BuscaReceta
		consultaTransformada.usuario = consulta.usuario
		consultaTransformada.nombre = consulta.nombre
		consultaTransformada.caloriasMinimas = consulta.caloriasMinimas
		consultaTransformada.caloriasMaximas = consulta.caloriasMaximas
		consultaTransformada.temporada = consulta.temporada
		consultaTransformada.dificultad = consulta.dificultad
		consultaTransformada.ingrediente = consulta.ingrediente
		consultaTransformada.filtros = consulta.filtros
		consultaTransformada
	}
}
