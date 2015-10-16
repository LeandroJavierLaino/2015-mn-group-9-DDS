import cosasUsuario.Usuario
import java.util.List
import org.hibernate.Criteria
import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import receta.Caracteristica
import receta.Condimento
import receta.Ingrediente
import receta.Receta
import org.hibernate.HibernateException

abstract class RepoPadre<T> {

	private static final SessionFactory sessionFactory = new AnnotationConfiguration().configure().
		addAnnotatedClass(Usuario).addAnnotatedClass(Receta).addAnnotatedClass(Caracteristica).
		addAnnotatedClass(Condimento).addAnnotatedClass(Ingrediente).buildSessionFactory

	def List<T> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(getEntityType).list()
		} finally {
			session.close
		}
	}

	def List<T> searchByExample(T t) {
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			this.addQueryByExample(criteria, t)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	def void update(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.update(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	def void create(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def abstract Class<T> getEntityType()

	def abstract void addQueryByExample(Criteria criteria, T t)

	def openSession() {
		sessionFactory.openSession
	}

}
