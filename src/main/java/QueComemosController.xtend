import cosasUsuario.Usuario
import java.util.List
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import receta.Receta
import repositorioRecetas.RepositorioRecetas
import repositorioUsuarios.RepositorioUsuarios

@Controller
class QueComemosController {
	extension JSONUtils = new JSONUtils
	extension JSONPropertyUtils = new JSONPropertyUtils
	
	@Get("/recetas")
	def Result recetas() {
		val recetas = RepositorioRecetas.instance.listarRecetas.toList
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	@Get('/usuarios')
	def Result usuarios() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(RepositorioUsuarios.instance.allInstances.toJson)
	}
	@Get('/usuarios/search/:nombre')
	def Result buscarUsuarios() {
		response.contentType = ContentType.APPLICATION_JSON
		val List<Usuario> listadoDeUsuarios = RepositorioUsuarios.instance.searchByName(nombre)
		
		ok(listadoDeUsuarios.toJson)
	}
	
	@Get('/usuario/:nombre')
	def Result autentificacion(@Body String pass) {
		
		response.contentType = ContentType.APPLICATION_JSON
		val password = pass
		val usuarioLocal = RepositorioUsuarios.instance.getUserByName(nombre)
		
		if(usuarioLocal !=null && password.equals(pass))
			ok(usuarioLocal.toJson)

	}
	@Get('/usuario/:nombre/recetas')
	def Result buscarRecetasDeUsuario() {
		response.contentType = ContentType.APPLICATION_JSON
		var usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		var List<Receta> recetas = RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toList
		ok(recetas.toJson)
	}
	
	@Get('/receta/:nombre')
	def Result getReceta() {
		response.contentType = ContentType.APPLICATION_JSON
		val Receta receta = RepositorioRecetas.instance.listarRecetas.findFirst[it.nombrePlato.equals(nombre)]
		ok(receta.toJson)
	}
	@Put('/receta/:nombre')
	def Result guardarReceta(@Body String body) {
		val Receta receta = body.fromJson(Receta)
		val recetaVieja = RepositorioRecetas.instance.listarRecetas.findFirst[it.nombrePlato.equals(receta.nombrePlato)]
		if(recetaVieja != null) {
			RepositorioRecetas.instance.quitar(recetaVieja)
			RepositorioRecetas.instance.agregar(receta)
		}
		else RepositorioRecetas.instance.agregar(receta)
		
		ok('{ "status" : "OK" }')
	}
	@Get('/receta/consulta')
	def Result consultar(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val Receta recetaProto = body.getPropertyValue("receta").fromJson(Receta)
		val Usuario usuario = body.getPropertyValue("usuario").fromJson(Usuario)
		
		val respuesta = usuario.postProcesarRecetas.filter[
			it.totalCalorias < Integer.valueOf(body.getPropertyValue("caloriasMinimas")) &&
			it.totalCalorias > Integer.valueOf(body.getPropertyValue("caloriasMaximas")) &&
			it.nombrePlato.toLowerCase.contains(recetaProto.nombrePlato.toLowerCase) &&
			it.dificultad.equalsIgnoreCase(recetaProto.dificultad) &&
			it.temporada.equalsIgnoreCase(recetaProto.temporada)
		].toList
		ok(respuesta.toJson)
	}
	
	def static void main(String[] args) {
		new Iniciador()
		XTRest.start(QueComemosController, 9000)
	}
}