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
import receta.Ingrediente;
import receta.Receta;
import repositorioRecetas.AdapterConsultaRecetas;
import repositorioRecetas.AdapterRepositorioRecetas;
import repositorioRecetas.BuscaReceta;
import repositorioUsuarios.RepositorioUsuarios;

@Accessors
@SuppressWarnings("all")
public class RepositorioRecetas {
  private Collection<Receta> recetas = new ArrayList<Receta>();
  
  private static RepositorioRecetas instance = null;
  
  private AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas();
  
  private Collection<Receta> recetasTotales = new ArrayList<Receta>();
  
  private AdapterConsultaRecetas adapterConsulta = new AdapterConsultaRecetas();
  
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
  
  public Collection<Receta> buscarRecetas(final String consulta) {
    BuscaReceta consultaTransformada = this.adapterConsulta.obtenerConsulta(consulta);
    Collection<Receta> recetasABuscar = IterableExtensions.<Receta>toList(this.recetas);
    String _nombre = consultaTransformada.getNombre();
    boolean _notEquals = (!Objects.equal(_nombre, null));
    if (_notEquals) {
      final String nombreConsultado = consultaTransformada.getNombre();
      final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _nombrePlato = receta.getNombrePlato();
          return Boolean.valueOf(_nombrePlato.contains(nombreConsultado));
        }
      };
      Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasABuscar, _function);
      List<Receta> _list = IterableExtensions.<Receta>toList(_filter);
      recetasABuscar = _list;
    }
    int _caloriasMinimas = consultaTransformada.getCaloriasMinimas();
    boolean _notEquals_1 = (_caloriasMinimas != (-1));
    if (_notEquals_1) {
      final int caloriasMinimas = consultaTransformada.getCaloriasMinimas();
      final Function1<Receta, Boolean> _function_1 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          double _totalCalorias = receta.getTotalCalorias();
          return Boolean.valueOf((_totalCalorias > caloriasMinimas));
        }
      };
      Iterable<Receta> _filter_1 = IterableExtensions.<Receta>filter(recetasABuscar, _function_1);
      List<Receta> _list_1 = IterableExtensions.<Receta>toList(_filter_1);
      recetasABuscar = _list_1;
    }
    int _caloriasMaximas = consultaTransformada.getCaloriasMaximas();
    boolean _notEquals_2 = (_caloriasMaximas != (-1));
    if (_notEquals_2) {
      final int caloriasMaximas = consultaTransformada.getCaloriasMaximas();
      final Function1<Receta, Boolean> _function_2 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          double _totalCalorias = receta.getTotalCalorias();
          return Boolean.valueOf((_totalCalorias < caloriasMaximas));
        }
      };
      Iterable<Receta> _filter_2 = IterableExtensions.<Receta>filter(recetasABuscar, _function_2);
      List<Receta> _list_2 = IterableExtensions.<Receta>toList(_filter_2);
      recetasABuscar = _list_2;
    }
    String _dificultad = consultaTransformada.getDificultad();
    boolean _notEquals_3 = (!Objects.equal(_dificultad, null));
    if (_notEquals_3) {
      final String dificultad = consultaTransformada.getDificultad();
      final Function1<Receta, Boolean> _function_3 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _dificultad = receta.getDificultad();
          return Boolean.valueOf(_dificultad.contains(dificultad));
        }
      };
      Iterable<Receta> _filter_3 = IterableExtensions.<Receta>filter(recetasABuscar, _function_3);
      List<Receta> _list_3 = IterableExtensions.<Receta>toList(_filter_3);
      recetasABuscar = _list_3;
    }
    String _temporada = consultaTransformada.getTemporada();
    boolean _notEquals_4 = (!Objects.equal(_temporada, null));
    if (_notEquals_4) {
      final String temporada = consultaTransformada.getTemporada();
      final Function1<Receta, Boolean> _function_4 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _temporada = receta.getTemporada();
          return Boolean.valueOf(_temporada.contains(temporada));
        }
      };
      Iterable<Receta> _filter_4 = IterableExtensions.<Receta>filter(recetasABuscar, _function_4);
      List<Receta> _list_4 = IterableExtensions.<Receta>toList(_filter_4);
      recetasABuscar = _list_4;
    }
    String _ingrediente = consultaTransformada.getIngrediente();
    boolean _notEquals_5 = (!Objects.equal(_ingrediente, null));
    if (_notEquals_5) {
      final String ingrediente = consultaTransformada.getIngrediente();
      final Function1<Receta, Boolean> _function_5 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          Set<Ingrediente> _ingredientes = receta.getIngredientes();
          return Boolean.valueOf(_ingredientes.contains(ingrediente));
        }
      };
      Iterable<Receta> _filter_5 = IterableExtensions.<Receta>filter(recetasABuscar, _function_5);
      List<Receta> _list_5 = IterableExtensions.<Receta>toList(_filter_5);
      recetasABuscar = _list_5;
    }
    boolean _isFiltros = consultaTransformada.isFiltros();
    boolean _notEquals_6 = (!Objects.equal(Boolean.valueOf(_isFiltros), Integer.valueOf(0)));
    if (_notEquals_6) {
      RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
      String _usuario = consultaTransformada.getUsuario();
      Usuario usuario = _instance.getUserByName(_usuario);
      Set<Receta> _aplicarFiltros = usuario.aplicarFiltros();
      recetasABuscar = _aplicarFiltros;
    }
    return recetasABuscar;
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
  public AdapterConsultaRecetas getAdapterConsulta() {
    return this.adapterConsulta;
  }
  
  public void setAdapterConsulta(final AdapterConsultaRecetas adapterConsulta) {
    this.adapterConsulta = adapterConsulta;
  }
}
