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
	AdapterConsultaRecetas adapterConsulta = new AdapterConsultaRecetas
	
	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
		}
		instance
	}
	
	def tieneLaReceta(Receta receta) {
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
	def Collection<Receta> buscarRecetas(String consulta) {
		var consultaTransformada = adapterConsulta.obtenerConsulta(consulta)
		var Collection<Receta> recetasABuscar = recetas.toList

		if (consultaTransformada.nombre != null) {
			val nombreConsultado = consultaTransformada.nombre
			recetasABuscar = recetasABuscar.filter[receta|receta.nombrePlato.contains(nombreConsultado)].toList
		}

		if (consultaTransformada.caloriasMinimas != -1) {
			val caloriasMinimas = consultaTransformada.caloriasMinimas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias > caloriasMinimas].toList
		}

		if (consultaTransformada.caloriasMaximas != -1) {
			val caloriasMaximas = consultaTransformada.caloriasMaximas
			recetasABuscar = recetasABuscar.filter[receta|receta.totalCalorias < caloriasMaximas].toList
		}
		
		if (consultaTransformada.dificultad != null){
			val dificultad = consultaTransformada.dificultad
			recetasABuscar = recetasABuscar.filter[receta|receta.dificultad.contains(dificultad)].toList
		}
		
		if (consultaTransformada.temporada != null){
			val temporada = consultaTransformada.temporada
			recetasABuscar = recetasABuscar.filter[receta|receta.temporada.contains(temporada)].toList
		}		
		
		if (consultaTransformada.ingrediente != null){
			val ingrediente = consultaTransformada.ingrediente
			recetasABuscar = recetasABuscar.filter[receta|receta.ingredientes.contains(ingrediente)].toList
		}
		
		if (consultaTransformada.filtros != 0){
			var Usuario usuario = RepositorioUsuarios.instance.getUserByName(consultaTransformada.usuario)
			recetasABuscar = usuario.aplicarFiltros() 
		}
		
		return recetasABuscar
	}
	
}