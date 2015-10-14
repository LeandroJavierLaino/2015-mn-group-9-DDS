package repositorioUsuarios

import condicion.CondicionPreexistente
import cosasUsuario.Usuario
import cosasUsuario.UsuarioBuilder
import java.util.ArrayList
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.hibernate.HibernateException
import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import org.hibernate.criterion.Restrictions
import receta.Receta
import receta.RecetaBuilder

@Accessors
class RepositorioUsuarios {

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
	
	private static final SessionFactory sessionFactory = new AnnotationConfiguration().configure().addAnnotatedClass(Usuario).buildSessionFactory()
	
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
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save(usuario)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def remove(Usuario usuario) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.delete(usuario)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def get(Usuario usuario) {
		this.searchByExample(usuario).toList.head
		//allInstances.filter[usuarioLista|usuarioLista.nombre.equals(usuario.nombre)].toList.get(0)
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
	
	def searchByExample(Usuario usuario) {
		val session = sessionFactory.openSession
		try {
			val criteriaUsuario = session.createCriteria(Usuario)
			if(usuario.nombre != null){
				criteriaUsuario.add(Restrictions.eq("nombre",usuario.nombre))
			}
			return criteriaUsuario.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}


	def getCriterioPorNombre(String nombre) {
		[Usuario usuario|usuario.nombre.toLowerCase.equals(nombre.toLowerCase)] as Predicate<Usuario>
	}

	def getCriterioPorCondicionesPreexistentes(List<CondicionPreexistente> condiciones) {
		[Usuario usuario|usuario.condicionesPreexistentes.equals(condiciones)]
	}

	def agregarAListaPendientes(Usuario usuario) {
		listaPorAceptarse.add(usuario)
	}

	def removerDeListaPendientes(Usuario usuario) {
		listaPorAceptarse.remove(usuario)
	}
	
	def List<Usuario> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(Usuario).list()
		} finally {
			session.close
		}
	}

}
