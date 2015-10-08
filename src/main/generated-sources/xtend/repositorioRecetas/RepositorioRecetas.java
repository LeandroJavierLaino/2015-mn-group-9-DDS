package repositorioRecetas;

import com.google.common.base.Objects;
import com.google.common.collect.Iterables;
import cosasUsuario.Usuario;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import receta.Receta;
import repositorioRecetas.AdapterRepositorioRecetas;

@Accessors
@SuppressWarnings("all")
public class RepositorioRecetas {
  private Collection<Receta> recetas = new ArrayList<Receta>();
  
  private static RepositorioRecetas instance = null;
  
  private AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas();
  
  private Collection<Receta> recetasTotales = new ArrayList<Receta>();
  
  private Collection<Receta> listarRecetasVisibles;
  
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
  
  public boolean tieneLaReceta(final Receta receta) {
    boolean _and = false;
    boolean _isNullOrEmpty = IterableExtensions.isNullOrEmpty(this.recetas);
    boolean _not = (!_isNullOrEmpty);
    if (!_not) {
      _and = false;
    } else {
      boolean _contains = this.recetas.contains(receta);
      _and = _contains;
    }
    return _and;
  }
  
  public Collection<Receta> cargarTodasLasRecetas() {
    List<Receta> _obtenerRecetasExternas = this.obtenerRecetasExternas();
    Iterable<Receta> _plus = Iterables.<Receta>concat(this.recetas, _obtenerRecetasExternas);
    List<Receta> _list = IterableExtensions.<Receta>toList(_plus);
    return this.recetas = _list;
  }
  
  public boolean agregar(final Receta receta) {
    return this.recetas.add(receta);
  }
  
  public boolean quitar(final Receta receta) {
    return this.recetas.remove(receta);
  }
  
  public Set<Receta> listarRecetasVisiblesPara(final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta unaReceta) {
        return Boolean.valueOf(unaReceta.puedeVerReceta(usuario));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(this.recetas, _function);
    return IterableExtensions.<Receta>toSet(_filter);
  }
  
  public List<Receta> obtenerRecetasExternas(final BusquedaRecetas busquedaRecetas) {
    return this.adapter.obtenerRecetas(busquedaRecetas);
  }
  
  public List<Receta> obtenerRecetasExternas() {
    return this.adapter.obtenerRecetas();
  }
  
  public Receta buscarPorNombre(final String nombreDeReceta) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        String _nombrePlato = it.getNombrePlato();
        return Boolean.valueOf(_nombrePlato.equals(nombreDeReceta));
      }
    };
    return IterableExtensions.<Receta>findFirst(this.recetas, _function);
  }
  
  public Collection<Receta> quitarPorNombre(final String nombreDeReceta) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        String _nombrePlato = it.getNombrePlato();
        boolean _equals = _nombrePlato.equals(nombreDeReceta);
        return Boolean.valueOf((!_equals));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(this.recetas, _function);
    List<Receta> _list = IterableExtensions.<Receta>toList(_filter);
    return this.recetas = _list;
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
