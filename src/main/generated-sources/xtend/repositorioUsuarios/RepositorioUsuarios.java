package repositorioUsuarios;

import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioBuilder;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import receta.Receta;
import receta.RecetaBuilder;

@Accessors
@SuppressWarnings("all")
public class RepositorioUsuarios {
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
  
  private final static SessionFactory sessionFactory = new AnnotationConfiguration().configure().addAnnotatedClass(Usuario.class).buildSessionFactory();
  
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
    final Session session = RepositorioUsuarios.sessionFactory.openSession();
    try {
      session.beginTransaction();
      session.save(usuario);
      Transaction _transaction = session.getTransaction();
      _transaction.commit();
    } catch (final Throwable _t) {
      if (_t instanceof HibernateException) {
        final HibernateException e = (HibernateException)_t;
        Transaction _transaction_1 = session.getTransaction();
        _transaction_1.rollback();
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    } finally {
      session.close();
    }
  }
  
  public void remove(final Usuario usuario) {
    final Session session = RepositorioUsuarios.sessionFactory.openSession();
    try {
      session.beginTransaction();
      session.delete(usuario);
      Transaction _transaction = session.getTransaction();
      _transaction.commit();
    } catch (final Throwable _t) {
      if (_t instanceof HibernateException) {
        final HibernateException e = (HibernateException)_t;
        Transaction _transaction_1 = session.getTransaction();
        _transaction_1.rollback();
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    } finally {
      session.close();
    }
  }
  
  public Object get(final Usuario usuario) {
    List _searchByExample = this.searchByExample(usuario);
    List<Object> _list = IterableExtensions.<Object>toList(_searchByExample);
    return IterableExtensions.<Object>head(_list);
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
  
  public List list(final Usuario usuario) {
    return this.searchByExample(usuario);
  }
  
  public List searchByExample(final Usuario usuario) {
    final Session session = RepositorioUsuarios.sessionFactory.openSession();
    try {
      final Criteria criteriaUsuario = session.createCriteria(Usuario.class);
      String _nombre = usuario.getNombre();
      boolean _notEquals = (!Objects.equal(_nombre, null));
      if (_notEquals) {
        String _nombre_1 = usuario.getNombre();
        SimpleExpression _eq = Restrictions.eq("nombre", _nombre_1);
        criteriaUsuario.add(_eq);
      }
      return criteriaUsuario.list();
    } catch (final Throwable _t) {
      if (_t instanceof HibernateException) {
        final HibernateException e = (HibernateException)_t;
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    } finally {
      session.close();
    }
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
  
  public boolean agregarAListaPendientes(final Usuario usuario) {
    return this.listaPorAceptarse.add(usuario);
  }
  
  public boolean removerDeListaPendientes(final Usuario usuario) {
    return this.listaPorAceptarse.remove(usuario);
  }
  
  public List<Usuario> allInstances() {
    final Session session = RepositorioUsuarios.sessionFactory.openSession();
    try {
      Criteria _createCriteria = session.createCriteria(Usuario.class);
      return _createCriteria.list();
    } finally {
      session.close();
    }
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
