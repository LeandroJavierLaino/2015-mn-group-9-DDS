import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import repositorioUsuarios.RepositorioUsuarios
import org.uqbar.xtrest.http.ContentType
import repositorioRecetas.RepositorioRecetas
import cosasUsuario.Usuario
import receta.Receta
import java.util.List

@Controller
class WebController {
	extension JSONUtils = new JSONUtils
	
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
	
	//BUSQUEDA DE RECETAS
	@Get('/recetas/search')
	def Result buscar(String nombre) {
		val recetaBuscada = RepositorioRecetas.instance.listarRecetas.findFirst[recipe | recipe.nombrePlato.equalsIgnoreCase(nombre)]
		ok(recetaBuscada.toJson)
	}
	@Get('/recetas/:nombre')
	def Result buscarA() {
		val recetaBuscada = RepositorioRecetas.instance.listarRecetas.findFirst[recipe | recipe.nombrePlato.equalsIgnoreCase(nombre)]
		ok(recetaBuscada.toJson)
	}
	@Get('/recetas/varias/:incluye')
	def Result buscarQueContenga() {
		var List<Receta> recetas
		recetas.addAll(RepositorioRecetas.instance.listarRecetas.filter[recipe | recipe.nombrePlato.contains(incluye)])
		ok(recetas.toJson)
	}
	@Get('/usuario/buscarRecetas')
	def Result buscarRecetasDeUsuario(String perfilDeUsuario) {
		val usuario = perfilDeUsuario.fromJson(Usuario)
		ok(RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toJson)
	}
	@Get('/usuario/buscarRecetasDe')
	def Result buscarRecetasPorNombreDeUsuario(String nombreDeUsuario) {
		val usuario = RepositorioUsuarios.instance.allInstances.findFirst[user | user.nombre.equalsIgnoreCase(nombreDeUsuario)]
		ok(RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(WebController, 9000)
	}
}