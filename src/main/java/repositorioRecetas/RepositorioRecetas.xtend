package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta
import repositorioUsuarios.RepositorioUsuarios

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

	def boolean tieneLaReceta(Receta receta) {
		(!recetas.nullOrEmpty) && recetas.contains(receta)
	}

	def cargarTodasLasRecetas() {
		recetas = (recetas + obtenerRecetasExternas()).toList
	}

	def agregar(Receta receta) {
		recetas.add(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		recetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
	}

	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}

	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}

	def buscarPorNombre(String nombreDeReceta) {
		recetas.findFirst[it.nombrePlato.equals(nombreDeReceta)]
	}

	def quitarPorNombre(String nombreDeReceta) {
		recetas = recetas.filter[!it.nombrePlato.equals(nombreDeReceta)].toList
	}

	def consultar(BuscaReceta consulta) {
		var Collection<Receta> recetasABuscar = listarRecetasVisibles
		val Usuario usuario = RepositorioUsuarios.instance.getUserByName(consulta.usuario)

		if (consulta.filtros != false) {
			recetasABuscar = usuario.postProcesarRecetas
		}

		if (consulta.nombre != null) {
			val nombreConsultado = consulta.nombre
			recetasABuscar = recetasABuscar.filter[receta|receta.nombrePlato.contains(nombreConsultado)].toList
		}

		if (consulta.caloriasMinimas != -1) {
			val caloriasMinimas = consulta.caloriasMinimas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias > caloriasMinimas].toList
		}

		if (consulta.caloriasMaximas != -1) {
			val caloriasMaximas = consulta.caloriasMaximas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias < caloriasMaximas].toList
		}

		if (consulta.dificultad != null) {
			val dificultad = consulta.dificultad
			recetasABuscar = recetasABuscar.filter[receta|receta.dificultad.contains(dificultad)].toList
		}

		if (consulta.temporada != null) {
			val temporada = consulta.temporada
			recetasABuscar = recetasABuscar.filter[receta|receta.temporada.contains(temporada)].toList
		}

		if (consulta.ingrediente != null) {
			val ingrediente = consulta.ingrediente
			recetasABuscar = recetasABuscar.filter[receta|receta.ingredientes.contains(ingrediente)].toList
		}

		return recetasABuscar.toSet
	}
}
