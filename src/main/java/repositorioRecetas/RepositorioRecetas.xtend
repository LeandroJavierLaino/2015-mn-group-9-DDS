package repositorioRecetas

import cosasUsuario.GrupoUsuario
import cosasUsuario.Usuario
import filtro.Filtro
import java.util.ArrayList
import java.util.Collection
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import procesamientoPosterior.ProcesamientoPosterior
import java.util.HashSet
import java.util.Set

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	List<Filtro> filtros = new ArrayList<Filtro>
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
		listarRecetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toList
	}
	
	def aplicarFiltro(Usuario usuario){
		filtros.addAll(usuario.filtrosAAplicar)
		var Set<Receta> recetasUsuario = new HashSet<Receta>
		recetasUsuario = usuario.recetas
		for(filtro : filtros){
			recetasUsuario = filtro.filtrar(recetasUsuario,usuario)
		}
		recetasUsuario
	}
	
	def dameResultadosPara(Usuario usuario){
		
		var Set<Receta> recetaResultado = new HashSet<Receta>
		recetaResultado = this.aplicarFiltro(usuario)
		var ProcesamientoPosterior procesamiento = usuario.indicarProcesamientoPosterior
		recetaResultado = procesamiento.asociarProcesamiento(usuario.recetas)
		if(usuario.habilitaSusFavoritos){
			usuario.recetasFavoritas.addAll(recetaResultado)
			recetaResultado = usuario.recetasFavoritas
		}
		recetaResultado	
	}
}
