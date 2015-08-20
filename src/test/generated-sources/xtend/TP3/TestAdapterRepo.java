package TP3;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import queComemos.entrega3.repositorio.RepoRecetas;
import receta.Receta;
import repositorioRecetas.AdapterRepositorioRecetas;
import repositorioRecetas.JsonParserReceta;
import repositorioRecetas.RepositorioRecetas;
import testeo.UsuariosExtras;

@Accessors
@SuppressWarnings("all")
public class TestAdapterRepo extends UsuariosExtras {
  private BusquedaRecetas busqueda;
  
  private AdapterRepositorioRecetas adapter;
  
  private JsonParserReceta parser;
  
  private RepoRecetas repositorio;
  
  @Override
@Before
  public void init() {
    super.init();
    BusquedaRecetas _busquedaRecetas = new BusquedaRecetas();
    this.busqueda = _busquedaRecetas;
    AdapterRepositorioRecetas _adapterRepositorioRecetas = new AdapterRepositorioRecetas();
    this.adapter = _adapterRepositorioRecetas;
    JsonParserReceta _jsonParserReceta = new JsonParserReceta();
    this.parser = _jsonParserReceta;
  }
  
  @Test
  public void testContieneRecetaFlanCaseroEnRepoLocal() {
    this.busqueda.setNombre("flan casero");
    this.adapter.obtenerRecetas(this.busqueda);
    RepositorioRecetas _repo = this.getRepo();
    _repo.obtenerRecetasExternas(this.busqueda);
    RepositorioRecetas _repo_1 = this.getRepo();
    Iterable<Receta> _listarRecetas = _repo_1.listarRecetas();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta receta) {
        String _nombrePlato = receta.getNombrePlato();
        return Boolean.valueOf(_nombrePlato.equals("flan casero"));
      }
    };
    boolean _exists = IterableExtensions.<Receta>exists(_listarRecetas, _function);
    Assert.assertTrue(_exists);
  }
  
  @Pure
  public BusquedaRecetas getBusqueda() {
    return this.busqueda;
  }
  
  public void setBusqueda(final BusquedaRecetas busqueda) {
    this.busqueda = busqueda;
  }
  
  @Pure
  public AdapterRepositorioRecetas getAdapter() {
    return this.adapter;
  }
  
  public void setAdapter(final AdapterRepositorioRecetas adapter) {
    this.adapter = adapter;
  }
  
  @Pure
  public JsonParserReceta getParser() {
    return this.parser;
  }
  
  public void setParser(final JsonParserReceta parser) {
    this.parser = parser;
  }
  
  @Pure
  public RepoRecetas getRepositorio() {
    return this.repositorio;
  }
  
  public void setRepositorio(final RepoRecetas repositorio) {
    this.repositorio = repositorio;
  }
}
