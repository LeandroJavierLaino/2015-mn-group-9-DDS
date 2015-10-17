import cosasUsuario.Usuario
import excepcion.RecetaInvalidaExcepcion
import java.util.List
import java.util.Set
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import receta.Receta
import repositorioRecetas.BuscaReceta
import repositorioRecetas.RepositorioRecetas
import repositorioUsuarios.RepositorioUsuarios

@Controller
class QueComemosController {
	extension JSONUtils = new JSONUtils
//	extension JSONPropertyUtils = new JSONPropertyUtils

	@Get("/recetas")
	def Result recetas() {
		val recetas = RepositorioRecetas.instance.recetas.toList
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

		if (usuarioLocal != null && password.equals(pass))
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
		val Receta receta = RepositorioRecetas.instance.recetas.findFirst[it.nombrePlato.equals(nombre)]
		ok(receta.toJson)
	}

	@Put('/receta/')
	def Result guardarReceta(@Body String body) {
		val Receta receta = body.fromJson(Receta)

		val recetaVieja = RepositorioRecetas.instance.allInstances.findFirst[it.nombrePlato.equals(receta.nombrePlato)]
		try {

			receta.puedeSerCreada()
			if(recetaVieja != null)
				RepositorioRecetas.instance.update(receta)
				
			else RepositorioRecetas.instance.add(receta)
			
			/*if (recetaVieja != null) {
				RepositorioRecetas.instance.quitarPorNombre(receta.nombrePlato)
				RepositorioRecetas.instance.add(receta)
			} else
				RepositorioRecetas.instance.add(receta)*/

			ok('{ "status" : "OK" }')

		} catch (RecetaInvalidaExcepcion e) {
			badRequest(e.message)
		}
	}
	
	@Post('/:nombre/consulta/recetas')
	def Result realizarConsulta(@Body String body){
		response.contentType = ContentType.APPLICATION_JSON
		var BuscaReceta consulta = body.fromJson(BuscaReceta)
		var Usuario usuario = RepositorioUsuarios.instance.getUserByName(nombre)

		var Set<Receta> recetasConsultadas = usuario.consultar(consulta).toSet
		ok(recetasConsultadas.toJson)
	}

	def static void main(String[] args) {
		new Iniciador()
		XTRest.start(QueComemosController, 9000)
	}
}
