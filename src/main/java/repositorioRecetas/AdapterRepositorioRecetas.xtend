package repositorioRecetas

import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta
import java.util.Collection
import javax.json.Json
import com.google.gson.Gson

class AdapterRepositorioRecetas extends RepoRecetas{
	
	RepositorioRecetas repositorioRecetas
    Collection<Receta> recetasExternas 
	Gson gson = new Gson()
		
	override String getRecetas(BusquedaRecetas busquedaRecetas){
		recetasExternas = recetas.map[receta|deserializador(receta)]
		repositorioRecetas.obtenerRecetasExternas(recetasExternas)
	}
	
	def Receta deserializador(Json recetaExterna){
		gson.fromJson(recetaExterna.toString,Receta)
	}
}