package TP3

import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import repositorioRecetas.AdapterRepositorioRecetas
import repositorioRecetas.JsonParserReceta
import testeo.UsuariosExtras
import org.junit.Test
import org.junit.Before
import org.junit.Assert
import queComemos.entrega3.repositorio.RepoRecetas

@Accessors
class TestAdapterRepo extends UsuariosExtras{
	BusquedaRecetas busqueda
	AdapterRepositorioRecetas adapter
	JsonParserReceta parser
	RepoRecetas repositorio
	
	@Before
	override void init(){
		super.init()
		busqueda = new BusquedaRecetas
		adapter = new AdapterRepositorioRecetas
		parser = new JsonParserReceta
	}
	
	@Test
	def void testContieneRecetaFlanCaseroEnRepoLocal(){
		busqueda.nombre = "flan casero"
		adapter.obtenerRecetas(busqueda)
		repo.obtenerRecetasExternas(busqueda)
		Assert.assertTrue(repo.listarRecetas.exists[receta | receta.nombrePlato.equals("flan casero")])
	}
	
}