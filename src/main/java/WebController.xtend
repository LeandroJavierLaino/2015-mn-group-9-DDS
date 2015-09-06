import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import repositorioUsuarios.RepositorioUsuarios
import org.uqbar.xtrest.http.ContentType
import repositorioRecetas.RepositorioRecetas
import cosasUsuario.Usuario

@Controller
class WebController {
	extension JSONUtils = new JSONUtils
//	extension JSONPropertyUtils = new JSONPropertyUtils
	
	@Get("/usuarios")
	def Result usuarios() {
		val usuarios = RepositorioUsuarios.instance.allInstances
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}
	@Get("/recetas")
	def Result recetas() {
		val recetas = RepositorioRecetas.instance.listarRecetas
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	@Get('/recetas/search')
	def Result buscar(String nombre) {
		val recetaBuscada = RepositorioRecetas.instance.listarRecetas.findFirst[recipe | recipe.nombrePlato.equalsIgnoreCase(nombre)]
		ok(recetaBuscada.toJson)
	}
	@Get('/usuario/buscarRecetas')
	def Result buscarRecetasDeUsuario(String perfilDeUsuario) {
		val usuario = perfilDeUsuario.fromJson(Usuario)
		ok(RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(WebController, 9000)
	}
}