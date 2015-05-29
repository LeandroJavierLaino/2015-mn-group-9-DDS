package cosasUsuario

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Caracteristica
import receta.Receta
import java.util.HashSet
import java.util.Set

@Accessors
class GrupoUsuario {
	List<Caracteristica> palabrasClave = new ArrayList<Caracteristica>
	Set<Usuario> usuarios = new HashSet<Usuario>
	String nombre
	
	def perteneceALasPalabrasClave(Caracteristica caracteristica){
		palabrasClave.contains(caracteristica)
	}
	
	def Boolean esApropiadoParaTodos(Receta receta) {
		usuarios.forall[usuario|usuario.esRecomendable(receta)]
	}
	
	def tieneUnUsuario(Usuario usuario){
		usuarios.contains(usuario)
	}
	
	def agregarUsuario(Usuario usuario){
		usuarios.add(usuario)
		usuario.grupoAlQuePertenece = this
	}
	
	def sacarUsuario(Usuario usuario){
		usuarios.remove(usuario)
	}
}