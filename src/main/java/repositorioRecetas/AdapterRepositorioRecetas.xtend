package repositorioRecetas

import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas

class AdapterRepositorioRecetas extends RepositorioRecetas{
	
	RepoRecetas repositorioRecetasExterno 
		
	override nuevasRecetas(BusquedaRecetas busquedaRecetas){
		repositorioRecetasExterno.getRecetas(busquedaRecetas)
	}
	
}