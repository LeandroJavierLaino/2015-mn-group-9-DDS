package repositorioRecetas

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
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import procesamientoPosterior.ProcesamientoOrdenarlosPorCalorias
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares
import procesamientoPosterior.ProcesamientoPosterior
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Caracteristica
import receta.Condimento
import receta.Ingrediente
import receta.Receta
import repositorioUsuarios.RepositorioUsuarios
import rutina.Rutina
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.criterion.Restrictions

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	static RepositorioRecetas instance = null
	AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas

	Collection<Receta> recetasTotales = new ArrayList<Receta>

	Collection<Receta> listarRecetasVisibles

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
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
		
	def List<Receta> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(Receta).list()
		} finally {
			session.close
		}
	}
	def add(Receta receta) {
		val session = sessionFactory.openSession
		try {
			if(searchByExample(receta).empty) {
				
				session.beginTransaction			
				session.saveOrUpdate(receta)
				session.flush
				session.refresh(receta)
				session.getTransaction.commit

			}
			
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	def update(Receta receta) {
		val session = sessionFactory.openSession
		try {

			session.beginTransaction			
			session.update(receta)
			session.flush
			session.refresh(receta)
			session.getTransaction.commit

			
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def remove(Receta receta) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.delete(receta)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def List<Receta> searchByExample(Receta receta) {
		val session = sessionFactory.openSession
		try {
			val criteriaReceta = session.createCriteria(Receta)
			if (receta.nombrePlato != null) {
				criteriaReceta.add(Restrictions.eq("nombrePlato", receta.nombrePlato))
			}
			return criteriaReceta.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def tieneLaReceta(Receta receta) {
		//(!recetas.nullOrEmpty) && recetas.contains(receta)
		allInstances.contains(receta)
	}

	def cargarTodasLasRecetas() {
		//recetas = (recetas + obtenerRecetasExternas()).toList
		obtenerRecetasExternas.toList.forEach[add(it)]
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		//recetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
		allInstances.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
	}

	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}

	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}

	def buscarPorNombre(String nombreDeReceta) {
		//recetas.findFirst[it.nombrePlato.equals(nombreDeReceta)]
		allInstances.findFirst[it.nombrePlato.equals(nombreDeReceta)]
	}

	def quitarPorNombre(String nombreDeReceta) {
		//recetas = recetas.filter[!it.nombrePlato.equals(nombreDeReceta)].toList
		val receta = allInstances.filter[it.nombrePlato.equals(nombreDeReceta)].head
		remove(receta)
	}
}
