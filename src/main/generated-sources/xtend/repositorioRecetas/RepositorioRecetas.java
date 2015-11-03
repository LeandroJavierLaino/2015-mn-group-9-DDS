package repositorioRecetas;

import com.google.common.base.Objects;
import cosasUsuario.Usuario;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.TransactionalAndObservable;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import receta.Receta;
import repositorioRecetas.AdapterRepositorioRecetas;
import uqbar.arena.persistence.PersistentHome;

@TransactionalAndObservable
@Accessors
@SuppressWarnings("all")
public class RepositorioRecetas extends PersistentHome<Receta> {
  private Collection<Receta> recetas = new ArrayList<Receta>();
  
  private AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas();
  
  private Collection<Receta> recetasTotales = new ArrayList<Receta>();
  
  private Collection<Receta> listarRecetasVisibles;
  
  public Receta createExample() {
    return new Receta();
  }
  
  public Class<Receta> getEntityType() {
    return Receta.class;
  }
  
  /**
   * DEFINICION DEL SINGLETON
   */
  private static RepositorioRecetas instance = null;
  
  public static RepositorioRecetas getInstance() {
    RepositorioRecetas _xblockexpression = null;
    {
      boolean _equals = Objects.equal(RepositorioRecetas.instance, null);
      if (_equals) {
        RepositorioRecetas _repositorioRecetas = new RepositorioRecetas();
        RepositorioRecetas.instance = _repositorioRecetas;
      }
      _xblockexpression = RepositorioRecetas.instance;
    }
    return _xblockexpression;
  }
  
  /**
   * ALTA
   */
  public void createIfNotExist(final Receta receta) {
    String _nombrePlato = receta.getNombrePlato();
    Receta recetaDB = this.buscarPorNombre(_nombrePlato);
    List<Receta> _allInstances = this.allInstances();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta recipe) {
        String _nombrePlato = recipe.getNombrePlato();
        String _nombrePlato_1 = receta.getNombrePlato();
        return Boolean.valueOf(_nombrePlato.equals(_nombrePlato_1));
      }
    };
    boolean _exists = IterableExtensions.<Receta>exists(_allInstances, _function);
    boolean _not = (!_exists);
    if (_not) {
      String _nombrePlato_1 = receta.getNombrePlato();
      System.out.println(_nombrePlato_1);
      this.create(receta);
    } else {
      String _nombrePlato_2 = receta.getNombrePlato();
      String _plus = ("No se creo la receta " + _nombrePlato_2);
      String _plus_1 = (_plus + " debido a que ya existe");
      System.out.println(_plus_1);
    }
  }
  
  public void agregar(final Receta receta) {
    this.createIfNotExist(receta);
  }
  
  public void quitar(final Receta receta) {
    this.delete(receta);
  }
  
  /**
   * BUSQUEDA
   */
  public Receta get(final String unNombre) {
    Receta _xblockexpression = null;
    {
      Receta _receta = new Receta();
      final Procedure1<Receta> _function = new Procedure1<Receta>() {
        public void apply(final Receta it) {
          it.setNombrePlato(unNombre);
        }
      };
      final Receta receta = ObjectExtensions.<Receta>operator_doubleArrow(_receta, _function);
      final List<Receta> recetas = this.searchByExample(receta);
      Receta _xifexpression = null;
      boolean _isEmpty = recetas.isEmpty();
      if (_isEmpty) {
        _xifexpression = null;
      } else {
        _xifexpression = recetas.get(0);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public Receta buscarPorNombre(final String nombreDeReceta) {
    List<Receta> _allInstances = this.allInstances();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        String _nombrePlato = it.getNombrePlato();
        return Boolean.valueOf(_nombrePlato.equals(nombreDeReceta));
      }
    };
    return IterableExtensions.<Receta>findFirst(_allInstances, _function);
  }
  
  public boolean tieneLaReceta(final Receta receta) {
    boolean _and = false;
    List<Receta> _allInstances = this.allInstances();
    boolean _isNullOrEmpty = IterableExtensions.isNullOrEmpty(_allInstances);
    boolean _not = (!_isNullOrEmpty);
    if (!_not) {
      _and = false;
    } else {
      List<Receta> _allInstances_1 = this.allInstances();
      boolean _contains = _allInstances_1.contains(receta);
      _and = _contains;
    }
    return _and;
  }
  
  public void cargarTodasLasRecetas() {
    List<Receta> _obtenerRecetasExternas = this.obtenerRecetasExternas();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta it) {
        RepositorioRecetas.this.createIfNotExist(it);
      }
    };
    _obtenerRecetasExternas.forEach(_function);
  }
  
  public Set<Receta> listarRecetasVisiblesPara(final Usuario usuario) {
    List<Receta> _allInstances = this.allInstances();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta unaReceta) {
        return Boolean.valueOf(unaReceta.puedeVerReceta(usuario));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(_allInstances, _function);
    return IterableExtensions.<Receta>toSet(_filter);
  }
  
  public List<Receta> obtenerRecetasExternas(final BusquedaRecetas busquedaRecetas) {
    return this.adapter.obtenerRecetas(busquedaRecetas);
  }
  
  public List<Receta> obtenerRecetasExternas() {
    return this.adapter.obtenerRecetas();
  }
  
  public Collection<Receta> obtenerTodasLasRecetas() {
    List<Receta> _allInstances = this.allInstances();
    return this.recetas = _allInstances;
  }
  
  @Pure
  public Collection<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final Collection<Receta> recetas) {
    this.recetas = recetas;
  }
  
  @Pure
  public AdapterRepositorioRecetas getAdapter() {
    return this.adapter;
  }
  
  public void setAdapter(final AdapterRepositorioRecetas adapter) {
    this.adapter = adapter;
  }
  
  @Pure
  public Collection<Receta> getRecetasTotales() {
    return this.recetasTotales;
  }
  
  public void setRecetasTotales(final Collection<Receta> recetasTotales) {
    this.recetasTotales = recetasTotales;
  }
  
  @Pure
  public Collection<Receta> getListarRecetasVisibles() {
    return this.listarRecetasVisibles;
  }
  
  public void setListarRecetasVisibles(final Collection<Receta> listarRecetasVisibles) {
    this.listarRecetasVisibles = listarRecetasVisibles;
  }
}
