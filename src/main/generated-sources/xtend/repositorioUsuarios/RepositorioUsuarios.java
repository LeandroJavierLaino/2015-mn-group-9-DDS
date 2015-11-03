package repositorioUsuarios;

import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;
import uqbar.arena.persistence.PersistentHome;

@Observable
@Accessors
@SuppressWarnings("all")
public class RepositorioUsuarios extends PersistentHome<Usuario> {
  private List<Usuario> listaPorAceptarse = new ArrayList<Usuario>();
  
  private static RepositorioUsuarios instance = null;
  
  public static RepositorioUsuarios getInstance() {
    RepositorioUsuarios _xblockexpression = null;
    {
      boolean _equals = Objects.equal(RepositorioUsuarios.instance, null);
      if (_equals) {
        RepositorioUsuarios _repositorioUsuarios = new RepositorioUsuarios();
        RepositorioUsuarios.instance = _repositorioUsuarios;
      }
      _xblockexpression = RepositorioUsuarios.instance;
    }
    return _xblockexpression;
  }
  
  public void add(final Usuario usuario) {
    List<Usuario> _allInstances = this.allInstances();
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario user) {
        String _nombre = user.getNombre();
        String _nombre_1 = usuario.getNombre();
        return Boolean.valueOf(_nombre.equals(_nombre_1));
      }
    };
    boolean _exists = IterableExtensions.<Usuario>exists(_allInstances, _function);
    boolean _not = (!_exists);
    if (_not) {
      this.create(usuario);
    }
  }
  
  public void remove(final Usuario usuario) {
    this.delete(usuario);
  }
  
  public Usuario get(final Usuario usuario) {
    List<Usuario> _searchByExample = this.searchByExample(usuario);
    List<Usuario> _list = IterableExtensions.<Usuario>toList(_searchByExample);
    return IterableExtensions.<Usuario>head(_list);
  }
  
  public Usuario get(final String unNombre) {
    Usuario _xblockexpression = null;
    {
      Usuario _usuario = new Usuario();
      final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
        public void apply(final Usuario it) {
          it.setNombre(unNombre);
        }
      };
      final Usuario usuario = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
      final List<Usuario> usuarios = this.searchByExample(usuario);
      Usuario _xifexpression = null;
      boolean _isEmpty = usuarios.isEmpty();
      if (_isEmpty) {
        _xifexpression = null;
      } else {
        _xifexpression = usuarios.get(0);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public Usuario getUserByName(final String vnombre) {
    List<Usuario> _allInstances = this.allInstances();
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usr) {
        String _nombre = usr.getNombre();
        return Boolean.valueOf(Objects.equal(_nombre, vnombre));
      }
    };
    return IterableExtensions.<Usuario>findFirst(_allInstances, _function);
  }
  
  public List<Usuario> searchByName(final String vName) {
    List<Usuario> _allInstances = this.allInstances();
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario it) {
        String _nombre = it.getNombre();
        String _lowerCase = _nombre.toLowerCase();
        return Boolean.valueOf(_lowerCase.contains(vName));
      }
    };
    Iterable<Usuario> _filter = IterableExtensions.<Usuario>filter(_allInstances, _function);
    return IterableExtensions.<Usuario>toList(_filter);
  }
  
  public List<Usuario> list(final Usuario usuario) {
    return this.searchByExample(usuario);
  }
  
  /**
   * override def Predicate<Usuario> getCriterio(Usuario example) {
   * var resultado = this.criterioTodas
   * if (example.nombre != null) {
   * resultado = new AndPredicate(resultado, this.getCriterioPorNombre(example.nombre))
   * }
   * if (!example.condicionesPreexistentes.isEmpty) {
   * resultado = new AndPredicate(resultado,
   * this.getCriterioPorCondicionesPreexistentes(example.condicionesPreexistentes))
   * }
   * resultado
   * }
   * 
   * override getCriterioTodas() {
   * [Usuario usuario|true]
   * }
   */
  public Predicate<Usuario> getCriterioPorNombre(final String nombre) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        String _nombre = usuario.getNombre();
        String _lowerCase = _nombre.toLowerCase();
        String _lowerCase_1 = nombre.toLowerCase();
        return Boolean.valueOf(_lowerCase.equals(_lowerCase_1));
      }
    };
    return ((Predicate<Usuario>) new Predicate<Usuario>() {
        public boolean evaluate(Usuario object) {
          return _function.apply(object);
        }
    });
  }
  
  public Function1<Usuario, Boolean> getCriterioPorCondicionesPreexistentes(final List<CondicionPreexistente> condiciones) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        List<CondicionPreexistente> _condicionesPreexistentes = usuario.getCondicionesPreexistentes();
        return Boolean.valueOf(_condicionesPreexistentes.equals(condiciones));
      }
    };
    return _function;
  }
  
  public Usuario createExample() {
    return new Usuario();
  }
  
  public Class<Usuario> getEntityType() {
    return Usuario.class;
  }
  
  public boolean agregarAListaPendientes(final Usuario usuario) {
    return this.listaPorAceptarse.add(usuario);
  }
  
  public boolean removerDeListaPendientes(final Usuario usuario) {
    return this.listaPorAceptarse.remove(usuario);
  }
  
  @Pure
  public List<Usuario> getListaPorAceptarse() {
    return this.listaPorAceptarse;
  }
  
  public void setListaPorAceptarse(final List<Usuario> listaPorAceptarse) {
    this.listaPorAceptarse = listaPorAceptarse;
  }
}
