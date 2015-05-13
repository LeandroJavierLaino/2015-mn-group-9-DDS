package repositorioRecetas

import com.google.common.collect.Lists
import cosasUsuario.GrupoUsuario
import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	static RepositorioRecetas instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
		}
		instance
	}

	def tieneLaReceta(Receta receta) {
		recetas.contains(receta)
	}

	def listarRecetas() {
		recetas
	}

	def puedeSugerirseAUsuario(Usuario usuario, Receta receta) {
		(!receta.tieneUnIngredienteOCondimentoQueDisgustaPara(usuario)) && usuario.condicionesPreexistentesSonValidas
	}

	def puedeSugerirseAGrupo(GrupoUsuario grupo, Receta receta) {
		receta.tieneUnIngredienteOCondimentoQueGustaPara(grupo) && grupo.esApropiadoParaTodos(receta)
	}

	def agregar(Receta receta) {
		recetas.add(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		var List<Receta> recetas = Lists.newArrayList(listarRecetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)]) 
		recetas
	}
}
