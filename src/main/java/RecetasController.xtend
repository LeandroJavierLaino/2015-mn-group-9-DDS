import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorioRecetas.RepositorioRecetas
import repositorioUsuarios.RepositorioUsuarios
import receta.Receta
import java.util.List
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body
import cosasUsuario.Usuario
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.DeserializationFeature
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.ObjectReader
import com.fasterxml.jackson.databind.ObjectMapper.DefaultTypeResolverBuilder

@Controller
@JsonIgnoreProperties(ignoreUnknown=true)
class RecetasController {

	extension JSONUtils = new JSONUtils

	ObjectMapper objectMapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
	ObjectReader objectReader = objectMapper.reader(Receta)

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

	// BUSQUEDA DE RECETAS
	@Get('/recetas/:nombre')
	def Result voyATenerSuerte() {
		response.contentType = ContentType.APPLICATION_JSON
		var receta = RepositorioRecetas.instance.listarRecetas.findFirst [ recipe |
			recipe.nombrePlato.equalsIgnoreCase(nombre)
		]
		ok(receta.toJson)
	}

	@Get('/recetas/search/:nombre')
	def Result buscarVarias() {
		response.contentType = ContentType.APPLICATION_JSON
		val recetas = RepositorioRecetas.instance.listarRecetas.filter[recipe|recipe.nombrePlato.contains(nombre)].
			toList
		ok(recetas.toJson)
	}
	
	@Get('/recetas/search/:consulta')
	def Result realizarConsulta() {
		response.contentType = ContentType.APPLICATION_JSON
		val recetas = RepositorioRecetas.instance.buscarRecetas(consulta).toList
		ok(recetas.toJson)
	}

	@Get('/usuarios/r/:nombre')
	def Result buscarRecetasDeUsuario() {
		response.contentType = ContentType.APPLICATION_JSON
		var usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		var List<Receta> recetas = RepositorioRecetas.instance.listarRecetasVisiblesPara(usuario).toList
		ok(recetas.toJson)
	}

	// BUSQUEDA DE USUARIOS
	@Get('/usuarios/:nombre')
	def Result buscarUsuario() {
		val usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		ok(usuario.toJson)
	}

	@Get('/usuarios/search/:parteDelNombre')
	def Result buscarUsuarios() {
		response.contentType = ContentType.APPLICATION_JSON
		val usuarios = RepositorioUsuarios.instance.objects.filter[user|user.nombre.contains(parteDelNombre)].toList
		ok(usuarios.toJson)
	}

	// ACTUALIZAR RECETA
	@Put('/recetas/:nombre')
	def Result guardarReceta(@Body String body) {
		try {

			val Receta recetaActualizada = body.fromJson(Receta)
			/*recetaActualizada.nombrePlato = body.getPropertyValue("nombrePlato")
			 * recetaActualizada.totalCalorias = Integer.valueOf(body.getPropertyValue("totalCalorias"))
			 recetaActualizada.procesoPreparacion = body.getPropertyValue("procesoPreparacion")*/
			val Receta recetaVieja = RepositorioRecetas.instance.listarRecetas.findFirst [
				it.nombrePlato.equals(recetaActualizada.nombrePlato)
			]

			if (recetaVieja != null)
				RepositorioRecetas.instance.quitar(recetaVieja)

			RepositorioRecetas.instance.agregar(recetaActualizada)

			ok('{ "status" : "OK" }')

		} catch (Exception e) {
			badRequest(e.message)
		}
	}

	// ACTUALIZAR USUARIO
	@Put('/usuarios/:nombre')
	def Result guardarUsuario(String body) {

		val Usuario usuarioActualizado = body.fromJson(Usuario)
		val usuarioViejo = RepositorioUsuarios.instance.getUserByName(nombre)
		RepositorioUsuarios.instance.delete(usuarioViejo)
		RepositorioUsuarios.instance.add(usuarioActualizado)

		ok('{ "status": "OK" }')
	}

	@Put('/usuario/:nombre/favoritos')
	def Result actualizarFavoritos(@Body String body) {
		val usuario = RepositorioUsuarios.instance.getUserByName(nombre)
		val Receta receta = body.fromJson(Receta)

		if (usuario.recetasFavoritas.contains(receta))
			usuario.recetasFavoritas.remove(receta)
		else
			usuario.recetasFavoritas.add(receta)

		ok('{ "status" : "OK" }')
	}

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}
}