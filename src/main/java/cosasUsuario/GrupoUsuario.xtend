package cosasUsuario

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Caracteristica
import receta.Receta
import java.util.HashSet
import java.util.Set
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import javax.persistence.ManyToOne
import javax.persistence.Column

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
class GrupoUsuario {
	
	@Id @GeneratedValue
	private long idGrupoUsuario
	
	@OneToMany
	List<Caracteristica> palabrasClave = new ArrayList<Caracteristica>
	@ManyToOne
	Set<Usuario> usuarios = new HashSet<Usuario>
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