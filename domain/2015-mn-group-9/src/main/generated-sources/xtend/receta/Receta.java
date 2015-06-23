package receta;

import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import cosasUsuario.GrupoUsuario;
import cosasUsuario.Usuario;
import excepcion.RecetaInvalidaExcepcion;
import excepcion.SinPermisosExcepcion;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import receta.Condimento;
import receta.Ingrediente;
import repositorioRecetas.RepositorioRecetas;

@Accessors
@SuppressWarnings("all")
public class Receta {
  private String nombrePlato;
  
  private Set<Ingrediente> ingredientes = new HashSet<Ingrediente>();
  
  private Set<Condimento> condimentos = new HashSet<Condimento>();
  
  private List<String> procesoPreparacion = new ArrayList<String>();
  
  private double totalCalorias;
  
  private String dificultad;
  
  private String temporada;
  
  private double cantidadMinimaCalorias = 10;
  
  private double cantidadMaximaCalorias = 5000;
  
  private Set<Receta> subRecetas = new HashSet<Receta>();
  
  private Usuario creador;
  
  private Set<CondicionPreexistente> condicionesPreexistentes = new HashSet<CondicionPreexistente>();
  
  /**
   * new(String nombre, Set<Ingrediente> ingredientesCargados, Set<Condimento> condimentosCargados,
   * List<String> procesoPreparacionCargado, double caloriasCargadas, String dificultadCargada,
   * String temporadaCargada) {
   * nombrePlato = nombre
   * ingredientes = ingredientesCargados
   * condimentos = condimentosCargados
   * procesoPreparacion = procesoPreparacionCargado
   * totalCalorias = caloriasCargadas
   * dificultad = dificultadCargada
   * temporada = temporadaCargada
   * }
   */
  public Receta puedeSerCreada(final Receta receta) {
    try {
      Receta _xifexpression = null;
      boolean _and = false;
      boolean _hayUnIngrediente = this.hayUnIngrediente(receta.ingredientes);
      if (!_hayUnIngrediente) {
        _and = false;
      } else {
        boolean _talDeCaloriasEnRango = this.totalDeCaloriasEnRango(receta.totalCalorias);
        _and = _talDeCaloriasEnRango;
      }
      if (_and) {
        _xifexpression = receta;
      } else {
        throw new RecetaInvalidaExcepcion("No está en el rango de calorías o no tiene un ingrediente la receta");
      }
      return _xifexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean hayUnIngrediente(final Collection<Ingrediente> ingredientes) {
    int _size = ingredientes.size();
    return (_size >= 1);
  }
  
  public boolean totalDeCaloriasEnRango(final double totalCalorias) {
    return ((totalCalorias > this.cantidadMinimaCalorias) && (totalCalorias < this.cantidadMaximaCalorias));
  }
  
  public boolean puedeVerReceta(final Usuario usuario) {
    boolean _or = false;
    boolean _or_1 = false;
    RepositorioRecetas _instance = RepositorioRecetas.getInstance();
    boolean _tieneLaReceta = _instance.tieneLaReceta(this);
    if (_tieneLaReceta) {
      _or_1 = true;
    } else {
      boolean _and = false;
      boolean _notEquals = (!Objects.equal(this.creador, null));
      if (!_notEquals) {
        _and = false;
      } else {
        boolean _comparteGrupoCon = this.creador.comparteGrupoCon(usuario);
        _and = _comparteGrupoCon;
      }
      _or_1 = _and;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _tieneLaReceta_1 = usuario.tieneLaReceta(this);
      _or = _tieneLaReceta_1;
    }
    return _or;
  }
  
  public boolean tienePermisosParaModificarReceta(final Usuario usuario) {
    boolean _or = false;
    boolean _or_1 = false;
    boolean _tieneLaReceta = usuario.tieneLaReceta(this);
    if (_tieneLaReceta) {
      _or_1 = true;
    } else {
      RepositorioRecetas _instance = RepositorioRecetas.getInstance();
      boolean _tieneLaReceta_1 = _instance.tieneLaReceta(this);
      _or_1 = _tieneLaReceta_1;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _and = false;
      boolean _notEquals = (!Objects.equal(this.creador, null));
      if (!_notEquals) {
        _and = false;
      } else {
        boolean _comparteGrupoCon = this.creador.comparteGrupoCon(usuario);
        _and = _comparteGrupoCon;
      }
      _or = _and;
    }
    return _or;
  }
  
  public Object puedeModificarReceta(final Usuario usuario) {
    try {
      Object _xifexpression = null;
      boolean _and = false;
      boolean _tienePermisosParaModificarReceta = this.tienePermisosParaModificarReceta(usuario);
      if (!_tienePermisosParaModificarReceta) {
        _and = false;
      } else {
        boolean _puedeVerReceta = this.puedeVerReceta(usuario);
        _and = _puedeVerReceta;
      }
      if (_and) {
        _xifexpression = null;
      } else {
        throw new SinPermisosExcepcion("No puede ver o modificar la receta");
      }
      return _xifexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean contieneComida(final String unaComida, final int unaCantidad) {
    boolean _or = false;
    final Function1<Condimento, Boolean> _function = new Function1<Condimento, Boolean>() {
      public Boolean apply(final Condimento condimento) {
        return Boolean.valueOf(condimento.esParteDe(unaComida, unaCantidad));
      }
    };
    boolean _exists = IterableExtensions.<Condimento>exists(this.condimentos, _function);
    if (_exists) {
      _or = true;
    } else {
      final Function1<Ingrediente, Boolean> _function_1 = new Function1<Ingrediente, Boolean>() {
        public Boolean apply(final Ingrediente ingrediente) {
          return Boolean.valueOf(ingrediente.esParteDe(unaComida, unaCantidad));
        }
      };
      boolean _exists_1 = IterableExtensions.<Ingrediente>exists(this.ingredientes, _function_1);
      _or = _exists_1;
    }
    return _or;
  }
  
  public boolean esRecomendablePara(final Usuario unUsuario) {
    boolean _or = false;
    Boolean _noTieneCondicionesPreexistentes = unUsuario.noTieneCondicionesPreexistentes();
    if ((_noTieneCondicionesPreexistentes).booleanValue()) {
      _or = true;
    } else {
      List<CondicionPreexistente> _condicionesPreexistentes = unUsuario.getCondicionesPreexistentes();
      final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
        public Boolean apply(final CondicionPreexistente it) {
          return Boolean.valueOf(it.tolera(Receta.this));
        }
      };
      boolean _forall = IterableExtensions.<CondicionPreexistente>forall(_condicionesPreexistentes, _function);
      _or = _forall;
    }
    return _or;
  }
  
  public boolean aniadirReceta(final Receta receta) {
    return this.subRecetas.add(receta);
  }
  
  public Usuario crearReceta(final Usuario usuario) {
    Usuario _xblockexpression = null;
    {
      this.puedeSerCreada(this);
      usuario.agregarReceta(this);
      _xblockexpression = this.creador = usuario;
    }
    return _xblockexpression;
  }
  
  public boolean modificarReceta(final Usuario usuario, final Receta recetaModificada) {
    boolean _xblockexpression = false;
    {
      this.puedeModificarReceta(usuario);
      Receta recetaClon = this;
      recetaClon.nombrePlato = recetaModificada.nombrePlato;
      recetaClon.ingredientes = recetaModificada.ingredientes;
      recetaClon.condimentos = recetaModificada.condimentos;
      recetaClon.procesoPreparacion = recetaModificada.procesoPreparacion;
      recetaClon.dificultad = recetaModificada.dificultad;
      recetaClon.temporada = recetaModificada.temporada;
      boolean _xifexpression = false;
      boolean _tieneLaReceta = usuario.tieneLaReceta(recetaClon);
      if (_tieneLaReceta) {
        boolean _xblockexpression_1 = false;
        {
          usuario.borrarReceta(recetaClon);
          _xblockexpression_1 = usuario.agregarReceta(recetaModificada);
        }
        _xifexpression = _xblockexpression_1;
      } else {
        _xifexpression = usuario.agregarReceta(recetaModificada);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public boolean tieneUnIngredienteOCondimentoQueDisgustaPara(final Usuario usuario) {
    boolean _or = false;
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente comidaQueDisgusta) {
        return Boolean.valueOf(usuario.contienteComidaQueDisgusta(comidaQueDisgusta));
      }
    };
    boolean _exists = IterableExtensions.<Ingrediente>exists(this.ingredientes, _function);
    if (_exists) {
      _or = true;
    } else {
      final Function1<Condimento, Boolean> _function_1 = new Function1<Condimento, Boolean>() {
        public Boolean apply(final Condimento comidaQueDisgusta) {
          return Boolean.valueOf(usuario.contienteComidaQueDisgusta(comidaQueDisgusta));
        }
      };
      boolean _exists_1 = IterableExtensions.<Condimento>exists(this.condimentos, _function_1);
      _or = _exists_1;
    }
    return _or;
  }
  
  public boolean tieneUnIngredienteOCondimentoQueGustaPara(final GrupoUsuario usuario) {
    boolean _or = false;
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente comidaQueGusta) {
        return Boolean.valueOf(usuario.perteneceALasPalabrasClave(comidaQueGusta));
      }
    };
    boolean _exists = IterableExtensions.<Ingrediente>exists(this.ingredientes, _function);
    if (_exists) {
      _or = true;
    } else {
      final Function1<Condimento, Boolean> _function_1 = new Function1<Condimento, Boolean>() {
        public Boolean apply(final Condimento comidaQueGusta) {
          return Boolean.valueOf(usuario.perteneceALasPalabrasClave(comidaQueGusta));
        }
      };
      boolean _exists_1 = IterableExtensions.<Condimento>exists(this.condimentos, _function_1);
      _or = _exists_1;
    }
    return _or;
  }
  
  public boolean tieneExcesoDeCalorias() {
    return (this.totalCalorias > 500);
  }
  
  public boolean tieneIngredientesCaros() {
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente ingrediente) {
        return Boolean.valueOf(ingrediente.esCaro());
      }
    };
    return IterableExtensions.<Ingrediente>forall(this.ingredientes, _function);
  }
  
  public boolean isVeryDifficult() {
    boolean _or = false;
    boolean _or_1 = false;
    boolean _equalsIgnoreCase = this.dificultad.equalsIgnoreCase("Alta");
    if (_equalsIgnoreCase) {
      _or_1 = true;
    } else {
      boolean _equalsIgnoreCase_1 = this.dificultad.equalsIgnoreCase("A");
      _or_1 = _equalsIgnoreCase_1;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _equalsIgnoreCase_2 = this.dificultad.equalsIgnoreCase("D");
      _or = _equalsIgnoreCase_2;
    }
    return _or;
  }
  
  public void asignarAutor(final String string) {
    Usuario _usuario = new Usuario();
    this.creador = _usuario;
    this.creador.setNombre(string);
  }
  
  public Set<CondicionPreexistente> esInadecuadaParaLasCondiciones() {
    final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
      public Boolean apply(final CondicionPreexistente condicion) {
        return Boolean.valueOf(condicion.tolera(Receta.this));
      }
    };
    Iterable<CondicionPreexistente> _filter = IterableExtensions.<CondicionPreexistente>filter(this.condicionesPreexistentes, _function);
    return IterableExtensions.<CondicionPreexistente>toSet(_filter);
  }
  
  @Pure
  public String getNombrePlato() {
    return this.nombrePlato;
  }
  
  public void setNombrePlato(final String nombrePlato) {
    this.nombrePlato = nombrePlato;
  }
  
  @Pure
  public Set<Ingrediente> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final Set<Ingrediente> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  @Pure
  public Set<Condimento> getCondimentos() {
    return this.condimentos;
  }
  
  public void setCondimentos(final Set<Condimento> condimentos) {
    this.condimentos = condimentos;
  }
  
  @Pure
  public List<String> getProcesoPreparacion() {
    return this.procesoPreparacion;
  }
  
  public void setProcesoPreparacion(final List<String> procesoPreparacion) {
    this.procesoPreparacion = procesoPreparacion;
  }
  
  @Pure
  public double getTotalCalorias() {
    return this.totalCalorias;
  }
  
  public void setTotalCalorias(final double totalCalorias) {
    this.totalCalorias = totalCalorias;
  }
  
  @Pure
  public String getDificultad() {
    return this.dificultad;
  }
  
  public void setDificultad(final String dificultad) {
    this.dificultad = dificultad;
  }
  
  @Pure
  public String getTemporada() {
    return this.temporada;
  }
  
  public void setTemporada(final String temporada) {
    this.temporada = temporada;
  }
  
  @Pure
  public double getCantidadMinimaCalorias() {
    return this.cantidadMinimaCalorias;
  }
  
  public void setCantidadMinimaCalorias(final double cantidadMinimaCalorias) {
    this.cantidadMinimaCalorias = cantidadMinimaCalorias;
  }
  
  @Pure
  public double getCantidadMaximaCalorias() {
    return this.cantidadMaximaCalorias;
  }
  
  public void setCantidadMaximaCalorias(final double cantidadMaximaCalorias) {
    this.cantidadMaximaCalorias = cantidadMaximaCalorias;
  }
  
  @Pure
  public Set<Receta> getSubRecetas() {
    return this.subRecetas;
  }
  
  public void setSubRecetas(final Set<Receta> subRecetas) {
    this.subRecetas = subRecetas;
  }
  
  @Pure
  public Usuario getCreador() {
    return this.creador;
  }
  
  public void setCreador(final Usuario creador) {
    this.creador = creador;
  }
  
  @Pure
  public Set<CondicionPreexistente> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final Set<CondicionPreexistente> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
}
