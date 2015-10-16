package repositorioUsuarios

import condicion.CondicionCeliaco
import condicion.CondicionDiabetico
import condicion.CondicionHipertenso
import condicion.CondicionPreexistente
import condicion.CondicionVegano
import cosasUsuario.GrupoUsuario
import cosasUsuario.Usuario
import filtro.Filtro
import filtro.FiltroPorCondicionesPreexistentes
import filtro.FiltroPorExcesoDeCalorias
import filtro.FiltroPorGusto
import filtro.FiltroPorSerCaros
import java.util.ArrayList
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.hibernate.HibernateException
import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import org.hibernate.criterion.Restrictions
import procesamientoPosterior.ProcesamientoOrdenarlosPorCalorias
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares
import procesamientoPosterior.ProcesamientoPosterior
import receta.Caracteristica
import receta.Condimento
import receta.Ingrediente
import receta.Receta
import rutina.Rutina

@Accessors
class RepositorioUsuarios {

	List<Usuario> listaPorAceptarse = new ArrayList<Usuario>

	static RepositorioUsuarios instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioUsuarios()
		}
		instance
	}

	private static final SessionFactory sessionFactory = new AnnotationConfiguration().configure()
		.addAnnotatedClass(Usuario)
		.addAnnotatedClass(Receta)
		.addAnnotatedClass(Caracteristica)
		.addAnnotatedClass(Ingrediente)
		.addAnnotatedClass(Condimento)
		.addAnnotatedClass(Rutina)
		.addAnnotatedClass(CondicionPreexistente)
		.addAnnotatedClass(CondicionCeliaco)
		.addAnnotatedClass(CondicionDiabetico)
		.addAnnotatedClass(GrupoUsuario)
		.addAnnotatedClass(CondicionHipertenso)
		.addAnnotatedClass(CondicionVegano)
		.addAnnotatedClass(ProcesamientoPosterior)
		.addAnnotatedClass(ProcesamientoOrdenarlosPorCalorias)
		.addAnnotatedClass(ProcesamientoOrdenarlosPorNombre)
		.addAnnotatedClass(ProcesamientoParaTomarLosPrimerosN)
		.addAnnotatedClass(ProcesamientoParaTomarResultadosPares)
		.addAnnotatedClass(Filtro)
		.addAnnotatedClass(FiltroPorCondicionesPreexistentes)
		.addAnnotatedClass(FiltroPorExcesoDeCalorias)
		.addAnnotatedClass(FiltroPorGusto)
		.addAnnotatedClass(FiltroPorSerCaros)
		.buildSessionFactory()

	def List<Usuario> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(Usuario).list()
		} finally {
			session.close
		}
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
		allInstances.findFirst[usr|usr.nombre == vnombre]
	}

	def List<Usuario> searchByName(String vName) {
		allInstances.filter[it.nombre.toLowerCase.contains(vName)].toList
	}

	def List<Usuario> list(Usuario usuario) {
		this.searchByExample(usuario)
	}

	def List<Usuario> searchByExample(Usuario usuario) {
		val session = sessionFactory.openSession
		try {
			val criteriaUsuario = session.createCriteria(Usuario)
			if (usuario.nombre != null) {
				criteriaUsuario.add(Restrictions.eq("nombre", usuario.nombre))
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
}
