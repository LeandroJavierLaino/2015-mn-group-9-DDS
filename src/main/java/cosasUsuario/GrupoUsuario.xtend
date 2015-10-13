package cosasUsuario

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Caracteristica
import receta.Receta
import java.util.HashSet
import java.util.Set
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class GrupoUsuario {
	List<Caracteristica> palabrasClave = new ArrayList<Caracteristica>
	Set<Usuario> usuarios = new HashSet<Usuario>
	String nombre
	Set<Receta> recetas
	
	def boolean perteneceALasPalabrasClave(Caracteristica caracteristica){
		palabrasClave.contains(caracteristica)
	}
	
	def Boolean esApropiadoParaTodos(Receta receta) {
		usuarios.forall[usuario|usuario.esRecomendable(receta)]
	}
	
	def tieneUnUsuario(String usuario){
		//usuarios.contains(usuario)
		usuarios.exists[it.nombre.equalsIgnoreCase(usuario)]
	}
	
	def agregarUsuario(Usuario usuario){
		usuarios.add(usuario)
		usuario.grupoAlQuePertenece = this
	}
	
	def sacarUsuario(Usuario usuario){
		usuarios.remove(usuario)
	}
	
	def puedeSerSugeridaRecetaAlGrupo(Receta receta){
		receta.tieneUnIngredienteOCondimentoQueGustaPara(this) && this.esApropiadoParaTodos(receta)
	}
	def todasLasRecetas() {
		
		var Set<Receta> todasLasRecetas = new HashSet
		todasLasRecetas = emptySet
		
		for(usuario : usuarios) {
			todasLasRecetas.addAll(usuario.recetas)
		}
		System.out.println(todasLasRecetas)
		todasLasRecetas

	}
}