package repositorioUsuarios

import condicion.CondicionPreexistente
import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.List
import org.apache.commons.collections15.Predicate
//import org.apache.commons.collections15.functors.AndPredicate
import org.eclipse.xtend.lib.annotations.Accessors
import uqbar.arena.persistence.PersistentHome
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RepositorioUsuarios extends PersistentHome<Usuario> {

	List<Usuario> listaPorAceptarse = new ArrayList<Usuario>

	static RepositorioUsuarios instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioUsuarios()
		}
		instance
	}
	
	def add(Usuario usuario) {
		this.create(usuario)
	}

	def remove(Usuario usuario) {
		this.delete(usuario)
	}

	def get(Usuario usuario) {
		this.searchByExample(usuario).toList.head
		//allInstances.filter[usuarioLista|usuarioLista.nombre.equals(usuario.nombre)].toList.get(0)
	}
	def Usuario get(String unNombre) {
		val Usuario usuario = new Usuario => [ nombre = unNombre]
		
		val usuarios = searchByExample(usuario)
		if(usuarios.isEmpty) {
			null
		} else {
			usuarios.get(0)
		}
	}
	
	def Usuario getUserByName(String vnombre) {
		allInstances.findFirst[usr | usr.nombre == vnombre]
	}
	def List<Usuario> searchByName(String vName) {
		allInstances.filter[it.nombre.toLowerCase.contains(vName)].toList
	}

	def list(Usuario usuario) {
		this.searchByExample(usuario)
	}

	/*
	 override def Predicate<Usuario> getCriterio(Usuario example) {
		var resultado = this.criterioTodas
		if (example.nombre != null) {
			resultado = new AndPredicate(resultado, this.getCriterioPorNombre(example.nombre))
		}
		if (!example.condicionesPreexistentes.isEmpty) {
			resultado = new AndPredicate(resultado,
				this.getCriterioPorCondicionesPreexistentes(example.condicionesPreexistentes))
		}
		resultado
	}

	override getCriterioTodas() {
		[Usuario usuario|true]
	}*/

	def getCriterioPorNombre(String nombre) {
		[Usuario usuario|usuario.nombre.toLowerCase.equals(nombre.toLowerCase)] as Predicate<Usuario>
	}

	def getCriterioPorCondicionesPreexistentes(List<CondicionPreexistente> condiciones) {
		[Usuario usuario|usuario.condicionesPreexistentes.equals(condiciones)]
	}

	override createExample() {
		new Usuario
	}

	override getEntityType() {
		typeof(Usuario)
	}

	def agregarAListaPendientes(Usuario usuario) {
		listaPorAceptarse.add(usuario)
	}

	def removerDeListaPendientes(Usuario usuario) {
		listaPorAceptarse.remove(usuario)
	}

}
