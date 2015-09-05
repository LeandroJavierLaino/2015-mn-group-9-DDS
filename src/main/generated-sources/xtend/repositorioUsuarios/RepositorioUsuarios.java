package repositorioUsuarios;

import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioBuilder;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.apache.commons.collections15.functors.AndPredicate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.CollectionBasedHome;
import receta.Receta;
import receta.RecetaBuilder;

@Accessors
@SuppressWarnings("all")
public class RepositorioUsuarios extends CollectionBasedHome<Usuario> {
  private Usuario pepe;
  
  private List<Usuario> listaPorAceptarse = new ArrayList<Usuario>();
  
  private Receta recetaDePepe;
  
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
  
  public Usuario init() {
    Usuario _xblockexpression = null;
    {
      RecetaBuilder _recetaBuilder = new RecetaBuilder();
      RecetaBuilder _nombre = _recetaBuilder.nombre("Nachos");
      RecetaBuilder _conCalorias = _nombre.conCalorias(500);
      RecetaBuilder _dificultad = _conCalorias.dificultad("Baja");
      RecetaBuilder _temporada = _dificultad.temporada("Invierno");
      Receta _build = _temporada.build();
      this.recetaDePepe = _build;
      UsuarioBuilder _usuarioBuilder = new UsuarioBuilder();
      UsuarioBuilder _conNombre = _usuarioBuilder.conNombre("Pepe");
      UsuarioBuilder _conReceta = _conNombre.conReceta(this.recetaDePepe);
      Usuario _build_1 = _conReceta.build();
      _xblockexpression = this.pepe = _build_1;
    }
    return _xblockexpression;
  }
  
  public void add(final Usuario usuario) {
    this.effectiveCreate(usuario);
  }
  
  public void remove(final Usuario usuario) {
    this.effectiveDelete(usuario);
  }
  
  public Usuario get(final Usuario usuario) {
    List<Usuario> _searchByExample = this.searchByExample(usuario);
    List<Usuario> _list = IterableExtensions.<Usuario>toList(_searchByExample);
    return IterableExtensions.<Usuario>head(_list);
  }
  
  public Usuario getUserByName(final String vnombre) {
    List<Usuario> _objects = this.getObjects();
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usr) {
        String _nombre = usr.getNombre();
        return Boolean.valueOf(Objects.equal(_nombre, vnombre));
      }
    };
    return IterableExtensions.<Usuario>findFirst(_objects, _function);
  }
  
  public List<Usuario> list(final Usuario usuario) {
    return this.searchByExample(usuario);
  }
  
  public Predicate<Usuario> getCriterio(final Usuario example) {
    Predicate<Usuario> _xblockexpression = null;
    {
      Predicate<Usuario> resultado = this.getCriterioTodas();
      String _nombre = example.getNombre();
      boolean _notEquals = (!Objects.equal(_nombre, null));
      if (_notEquals) {
        String _nombre_1 = example.getNombre();
        Predicate<Usuario> _criterioPorNombre = this.getCriterioPorNombre(_nombre_1);
        AndPredicate<Usuario> _andPredicate = new AndPredicate<Usuario>(resultado, _criterioPorNombre);
        resultado = _andPredicate;
      }
      List<CondicionPreexistente> _condicionesPreexistentes = example.getCondicionesPreexistentes();
      boolean _isEmpty = _condicionesPreexistentes.isEmpty();
      boolean _not = (!_isEmpty);
      if (_not) {
        List<CondicionPreexistente> _condicionesPreexistentes_1 = example.getCondicionesPreexistentes();
        Function1<Usuario, Boolean> _criterioPorCondicionesPreexistentes = this.getCriterioPorCondicionesPreexistentes(_condicionesPreexistentes_1);
        final Function1<Usuario, Boolean> _final_criterioPorCondicionesPreexistentes = _criterioPorCondicionesPreexistentes;
        AndPredicate<Usuario> _andPredicate_1 = new AndPredicate<Usuario>(resultado, new Predicate<Usuario>() {
            public boolean evaluate(Usuario arg0) {
              return _final_criterioPorCondicionesPreexistentes.apply(arg0);
            }
        });
        resultado = _andPredicate_1;
      }
      _xblockexpression = resultado;
    }
    return _xblockexpression;
  }
  
  public Predicate<Usuario> getCriterioTodas() {
    final Predicate<Usuario> _function = new Predicate<Usuario>() {
      public boolean evaluate(final Usuario usuario) {
        return true;
      }
    };
    return _function;
  }
  
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
        public boolean evaluate(Usuario arg0) {
          return _function.apply(arg0);
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
  public Usuario getPepe() {
    return this.pepe;
  }
  
  public void setPepe(final Usuario pepe) {
    this.pepe = pepe;
  }
  
  @Pure
  public List<Usuario> getListaPorAceptarse() {
    return this.listaPorAceptarse;
  }
  
  public void setListaPorAceptarse(final List<Usuario> listaPorAceptarse) {
    this.listaPorAceptarse = listaPorAceptarse;
  }
  
  @Pure
  public Receta getRecetaDePepe() {
    return this.recetaDePepe;
  }
  
  public void setRecetaDePepe(final Receta recetaDePepe) {
    this.recetaDePepe = recetaDePepe;
  }
}
