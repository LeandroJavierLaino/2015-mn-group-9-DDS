package cosasUsuario

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Caracteristica
import receta.Receta

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
class GrupoUsuario {
	
	@Id @GeneratedValue
	private long idGrupoUsuario
	
	@OneToMany
	List<Caracteristica> palabrasClave = new ArrayList<Caracteristica>
	
	@OneToMany(fetch=FetchType.LAZY)
	Set<Usuario> usuarios = new HashSet
	
	@Column(length = 50)
	String nombre
	
	@OneToMany
	Set<Receta> recetas
	
	def perteneceALasPalabrasClave(Caracteristica caracteristica){
		palabrasClave.contains(caracteristica)
	}
	
	def Boolean esApropiadoParaTodos(Receta receta) {
		usuarios.forall[usuario|usuario.esRecomendable(receta)]
	}
	
	def tieneUnUsuario(String usuario){
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