package repositorioUsuarios

import condicion.CondicionPreexistente
import cosasUsuario.Usuario
import java.util.List
import org.apache.commons.collections15.Predicate
import org.apache.commons.collections15.functors.AndPredicate
import org.uqbar.commons.model.CollectionBasedHome
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import cosasUsuario.UsuarioBuilder
import receta.Receta
import receta.RecetaBuilder

@Accessors
class RepositorioUsuarios extends CollectionBasedHome<Usuario> {

	Usuario pepe
	List<Usuario> listaPorAceptarse = new ArrayList<Usuario>
	
	Receta recetaDePepe

	static RepositorioUsuarios instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioUsuarios()
		}
		instance
	}
	
	def init() {
			
		recetaDePepe = new RecetaBuilder()
			.nombre("Nachos")
			.conCalorias(500)
			.dificultad("Baja")
			.temporada("Invierno")
			.build
		pepe = new UsuarioBuilder()
			.conNombre("Pepe")
			.conReceta(recetaDePepe)
			.build
	}
	def add(Usuario usuario) {
		this.effectiveCreate(usuario)
	}

	def remove(Usuario usuario) {
		this.effectiveDelete(usuario)
	}

	def get(Usuario usuario) {
		this.searchByExample(usuario).toList.head
		//allInstances.filter[usuarioLista|usuarioLista.nombre.equals(usuario.nombre)].toList.get(0)
	}
	
	def Usuario getUserByName(String vnombre) {
		objects.findFirst[usr | usr.nombre == vnombre]
	}

	def list(Usuario usuario) {
		this.searchByExample(usuario)
	}

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
	}

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
