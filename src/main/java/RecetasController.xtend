import cosasUsuario.Usuario
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorioRecetas.RepositorioRecetas
import repositorioUsuarios.RepositorioUsuarios

@Controller
class RecetasController {
	extension JSONUtils = new JSONUtils
	
	@Get("/usuarios")
	def Result usuarios() {
		val usuarios = RepositorioUsuarios.instance.allInstances
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}
	@Get("/recetas")
	def Result recetas() {
		val recetas = RepositorioRecetas.instance.listarRecetas.toList
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	//BUSQUEDA DE RECETAS
	@Get('/recetas/:nombre')
	def Result voyATenerSuerte() {
		response.contentType = ContentType.APPLICATION_JSON
		var receta = RepositorioRecetas.instance.listarRecetas.findFirst[recipe | recipe.nombrePlato.equalsIgnoreCase(nombre)]
		ok(receta.toJson)
	}
	@Get('/recetas/search/:nombre')
	def Result buscarVarias() {
		response.contentType = ContentType.APPLICATION_JSON
		val recetas = RepositorioRecetas.instance.listarRecetas.filter[recipe | recipe.nombrePlato.contains(nombre)].toList
		ok(recetas.toJson)
	}
	@Get('/usuario/buscarRecetasDe/:nombre')
	def Result buscarRecetasDeUsuario() {
		response.contentType = ContentType.APPLICATION_JSON
		val usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		val recetas = RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toList
		ok(recetas.toJson)
	}
	//BUSQUEDA DE USUARIOS
	@Get('/usuario/:nombre')
	def Result buscarUsuario() {
		val usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		ok(usuario.toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}
}