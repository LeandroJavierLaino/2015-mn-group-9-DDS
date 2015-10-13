package cosasUsuario;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import consulta.Consulta;
import consulta.GestorDeConsultas;
import cosasUsuario.GrupoUsuario;
import excepcion.FechaInvalidaExcepcion;
import excepcion.UsuarioInvalidoExcepcion;
import filtro.Filtro;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.StringExtensions;
import org.joda.time.LocalDate;
import org.uqbar.commons.model.Entity;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Caracteristica;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;
import repositorioRecetas.BuscaReceta;
import repositorioRecetas.RepositorioRecetas;
import repositorioUsuarios.RepositorioUsuarios;
import rutina.Rutina;

@JsonSerialize
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@SuppressWarnings("all")
public class Usuario extends Entity {
  private LocalDate fechaActual = new LocalDate();
  
  private int CARACTERES_MINIMOS = 4;
  
  private boolean habilitarFavoritos = false;
  
  private String nombre;
  
  private double altura;
  
  private double peso;
  
  private LocalDate fechaDeNacimiento;
  
  private String password;
  
  private GrupoUsuario grupoAlQuePertenece;
  
  private List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>();
  
  private String sexo;
  
  private List<Caracteristica> comidasQueDisgustan = new ArrayList<Caracteristica>();
  
  private List<String> comidaPreferida = new ArrayList<String>();
  
  private Rutina rutina;
  
  private Set<Receta> recetas = new HashSet<Receta>();
  
  private Set<Receta> recetasFavoritas = new HashSet<Receta>();
  
  private List<Filtro> filtrosAAplicar = new ArrayList<Filtro>();
  
  private ProcesamientoPosterior procesamiento;
  
  public double calculaIMC() {
    return (this.peso / (this.altura * this.altura));
  }
  
  public void agregarCondicion(final CondicionPreexistente condicion) {
    this.condicionesPreexistentes.add(condicion);
  }
  
  public void validar() {
    try {
      boolean _and = false;
      if (!((this.altura > 0) && (this.peso > 0))) {
        _and = false;
      } else {
        int _length = this.nombre.length();
        boolean _greaterEqualsThan = (_length >= this.CARACTERES_MINIMOS);
        _and = _greaterEqualsThan;
      }
      boolean _not = (!_and);
      if (_not) {
        throw new UsuarioInvalidoExcepcion("Usuario no valido");
      }
      this.condicionesPreexistentesSonValidas();
      this.fechaValida(this.fechaActual, this.fechaDeNacimiento);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
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
  
  public Boolean noTieneCondicionesPreexistentes() {
    return Boolean.valueOf(this.condicionesPreexistentes.isEmpty());
  }
  
  public Boolean condicionesPreexistentesSonValidas() {
    boolean _or = false;
    Boolean _noTieneCondicionesPreexistentes = this.noTieneCondicionesPreexistentes();
    if ((_noTieneCondicionesPreexistentes).booleanValue()) {
      _or = true;
    } else {
      final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
        public Boolean apply(final CondicionPreexistente it) {
          return Boolean.valueOf(it.valido(Usuario.this));
        }
      };
      boolean _forall = IterableExtensions.<CondicionPreexistente>forall(this.condicionesPreexistentes, _function);
      _or = _forall;
    }
    return Boolean.valueOf(_or);
  }
  
  public Boolean sigueUnaRutinaSaludable() {
    boolean _and = false;
    boolean _and_1 = false;
    double _calculaIMC = this.calculaIMC();
    boolean _greaterEqualsThan = (_calculaIMC >= 18);
    if (!_greaterEqualsThan) {
      _and_1 = false;
    } else {
      double _calculaIMC_1 = this.calculaIMC();
      boolean _lessEqualsThan = (_calculaIMC_1 <= 30);
      _and_1 = _lessEqualsThan;
    }
    if (!_and_1) {
      _and = false;
    } else {
      boolean _or = false;
      Boolean _noTieneCondicionesPreexistentes = this.noTieneCondicionesPreexistentes();
      if ((_noTieneCondicionesPreexistentes).booleanValue()) {
        _or = true;
      } else {
        final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
          public Boolean apply(final CondicionPreexistente it) {
            return Boolean.valueOf(it.tieneRutinaSaludable(Usuario.this));
          }
        };
        boolean _forall = IterableExtensions.<CondicionPreexistente>forall(this.condicionesPreexistentes, _function);
        _or = _forall;
      }
      _and = _or;
    }
    return Boolean.valueOf(_and);
  }
  
  public boolean agregarRecetaAUnaPrincipal(final Receta recetaPrincipal, final Receta subReceta) {
    boolean _xblockexpression = false;
    {
      recetaPrincipal.puedeModificarReceta(this);
      subReceta.puedeModificarReceta(this);
      _xblockexpression = recetaPrincipal.aniadirReceta(subReceta);
    }
    return _xblockexpression;
  }
  
  public boolean agregarReceta(final Receta receta) {
    return this.recetas.add(receta);
  }
  
  public boolean borrarReceta(final Receta receta) {
    return this.recetas.remove(receta);
  }
  
  public void fechaValida(final LocalDate fechaActual, final LocalDate fechaSegunda) {
    boolean _isBefore = fechaActual.isBefore(fechaSegunda);
    if (_isBefore) {
      throw new FechaInvalidaExcepcion("Se Ingreso una fecha invalida");
    }
  }
  
  public boolean contienteComidaQueDisgusta(final Caracteristica comidaQueDisgusta) {
    return this.comidasQueDisgustan.contains(comidaQueDisgusta);
  }
  
  public boolean esRecomendable(final Receta receta) {
    boolean _or = false;
    Boolean _noTieneCondicionesPreexistentes = this.noTieneCondicionesPreexistentes();
    if ((_noTieneCondicionesPreexistentes).booleanValue()) {
      _or = true;
    } else {
      final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
        public Boolean apply(final CondicionPreexistente it) {
          return Boolean.valueOf(it.tolera(receta));
        }
      };
      boolean _forall = IterableExtensions.<CondicionPreexistente>forall(this.condicionesPreexistentes, _function);
      _or = _forall;
    }
    return _or;
  }
  
  public boolean comparteGrupoCon(final String usuario) {
    boolean _and = false;
    boolean _and_1 = false;
    boolean _notEquals = (!Objects.equal(usuario, null));
    if (!_notEquals) {
      _and_1 = false;
    } else {
      boolean _notEquals_1 = (!Objects.equal(this.grupoAlQuePertenece, null));
      _and_1 = _notEquals_1;
    }
    if (!_and_1) {
      _and = false;
    } else {
      boolean _tieneUnUsuario = this.grupoAlQuePertenece.tieneUnUsuario(usuario);
      _and = _tieneUnUsuario;
    }
    return _and;
  }
  
  public boolean marcarComoFavorita(final Receta receta) {
    return this.recetasFavoritas.add(receta);
  }
  
  public boolean agregarFiltro(final Filtro filtro) {
    return this.filtrosAAplicar.add(filtro);
  }
  
  public boolean tieneSobrepeso() {
    double _calculaIMC = this.calculaIMC();
    return (_calculaIMC > 500);
  }
  
  public ProcesamientoPosterior indicarProcesamientoPosterior() {
    return this.procesamiento;
  }
  
  public ProcesamientoPosterior elegirProcesamiento(final ProcesamientoPosterior procesamientoProcesado) {
    return this.procesamiento = procesamientoProcesado;
  }
  
  public boolean habilitaSusFavoritos() {
    return this.habilitarFavoritos = true;
  }
  
  public Set<Receta> aplicarFiltros() {
    Set<Receta> _xblockexpression = null;
    {
      Set<Receta> busquedaReceta = this.listarRecetasVisibles();
      for (final Filtro filtro : this.filtrosAAplicar) {
        Set<Receta> _filtrar = filtro.filtrar(busquedaReceta, this);
        busquedaReceta = _filtrar;
      }
      _xblockexpression = busquedaReceta;
    }
    return _xblockexpression;
  }
  
  public Set<Receta> postProcesarRecetas() {
    Set<Receta> _xblockexpression = null;
    {
      Set<Receta> recetasFiltradas = new HashSet<Receta>();
      Set<Receta> _aplicarFiltros = this.aplicarFiltros();
      recetasFiltradas = _aplicarFiltros;
      ProcesamientoPosterior procesamiento = this.indicarProcesamientoPosterior();
      Set<Receta> _asociarProcesamiento = procesamiento.asociarProcesamiento(recetasFiltradas);
      recetasFiltradas = _asociarProcesamiento;
      boolean _habilitaSusFavoritos = this.habilitaSusFavoritos();
      if (_habilitaSusFavoritos) {
        this.recetasFavoritas.addAll(recetasFiltradas);
        recetasFiltradas = this.recetasFavoritas;
      }
      Consulta consulta = new Consulta(this, recetasFiltradas);
      GestorDeConsultas _instance = GestorDeConsultas.getInstance();
      _instance.monitorear(consulta);
      _xblockexpression = recetasFiltradas;
    }
    return _xblockexpression;
  }
  
  public boolean puedeSerSugeridaUnaReceta(final Receta receta) {
    boolean _and = false;
    boolean _tieneUnIngredienteOCondimentoQueDisgustaPara = receta.tieneUnIngredienteOCondimentoQueDisgustaPara(this);
    boolean _not = (!_tieneUnIngredienteOCondimentoQueDisgustaPara);
    if (!_not) {
      _and = false;
    } else {
      Boolean _condicionesPreexistentesSonValidas = this.condicionesPreexistentesSonValidas();
      _and = (_condicionesPreexistentesSonValidas).booleanValue();
    }
    return _and;
  }
  
  public boolean solicitarIngresoASistema() {
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    return _instance.agregarAListaPendientes(this);
  }
  
  public Boolean esVegano() {
    final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
      public Boolean apply(final CondicionPreexistente condicion) {
        return condicion.esCondicionVegana();
      }
    };
    return Boolean.valueOf(IterableExtensions.<CondicionPreexistente>exists(this.condicionesPreexistentes, _function));
  }
  
  public Set<Receta> listarRecetasVisibles() {
    Set<Receta> _xblockexpression = null;
    {
      Set<Receta> recetasVisibles = this.recetas;
      RepositorioRecetas _instance = RepositorioRecetas.getInstance();
      Set<Receta> _listarRecetasVisiblesPara = _instance.listarRecetasVisiblesPara(this);
      recetasVisibles.addAll(_listarRecetasVisiblesPara);
      boolean _notEquals = (!Objects.equal(this.grupoAlQuePertenece, null));
      if (_notEquals) {
        Set<Receta> _dasLasRecetas = this.grupoAlQuePertenece.todasLasRecetas();
        recetasVisibles.addAll(_dasLasRecetas);
      }
      _xblockexpression = recetasVisibles;
    }
    return _xblockexpression;
  }
  
  public Set<Receta> consultar(final BuscaReceta consulta) {
    Set<Receta> recetasABuscar = this.listarRecetasVisibles();
    boolean _isFiltros = consulta.isFiltros();
    boolean _notEquals = (!Objects.equal(Boolean.valueOf(_isFiltros), Integer.valueOf(0)));
    if (_notEquals) {
      Set<Receta> _postProcesarRecetas = this.postProcesarRecetas();
      recetasABuscar = _postProcesarRecetas;
    }
    String _nombre = consulta.getNombre();
    boolean _notEquals_1 = (!Objects.equal(_nombre, null));
    if (_notEquals_1) {
      final String nombreConsultado = consulta.getNombre();
      final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _nombrePlato = receta.getNombrePlato();
          return Boolean.valueOf(_nombrePlato.contains(nombreConsultado));
        }
      };
      Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasABuscar, _function);
      Set<Receta> _set = IterableExtensions.<Receta>toSet(_filter);
      recetasABuscar = _set;
    }
    int _caloriasMinimas = consulta.getCaloriasMinimas();
    boolean _notEquals_2 = (_caloriasMinimas != (-1));
    if (_notEquals_2) {
      final int caloriasMinimas = consulta.getCaloriasMinimas();
      final Function1<Receta, Boolean> _function_1 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          double _totalCalorias = receta.getTotalCalorias();
          return Boolean.valueOf((_totalCalorias > caloriasMinimas));
        }
      };
      Iterable<Receta> _filter_1 = IterableExtensions.<Receta>filter(recetasABuscar, _function_1);
      Set<Receta> _set_1 = IterableExtensions.<Receta>toSet(_filter_1);
      recetasABuscar = _set_1;
    }
    int _caloriasMaximas = consulta.getCaloriasMaximas();
    boolean _notEquals_3 = (_caloriasMaximas != (-1));
    if (_notEquals_3) {
      final int caloriasMaximas = consulta.getCaloriasMaximas();
      final Function1<Receta, Boolean> _function_2 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          double _totalCalorias = receta.getTotalCalorias();
          return Boolean.valueOf((_totalCalorias < caloriasMaximas));
        }
      };
      Iterable<Receta> _filter_2 = IterableExtensions.<Receta>filter(recetasABuscar, _function_2);
      Set<Receta> _set_2 = IterableExtensions.<Receta>toSet(_filter_2);
      recetasABuscar = _set_2;
    }
    String _dificultad = consulta.getDificultad();
    boolean _notEquals_4 = (!Objects.equal(_dificultad, null));
    if (_notEquals_4) {
      final String dificultad = consulta.getDificultad();
      final Function1<Receta, Boolean> _function_3 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _dificultad = receta.getDificultad();
          return Boolean.valueOf(_dificultad.contains(dificultad));
        }
      };
      Iterable<Receta> _filter_3 = IterableExtensions.<Receta>filter(recetasABuscar, _function_3);
      Set<Receta> _set_3 = IterableExtensions.<Receta>toSet(_filter_3);
      recetasABuscar = _set_3;
    }
    String _temporada = consulta.getTemporada();
    boolean _isNullOrEmpty = StringExtensions.isNullOrEmpty(_temporada);
    boolean _not = (!_isNullOrEmpty);
    if (_not) {
      final String temporada = consulta.getTemporada();
      final Function1<Receta, Boolean> _function_4 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          String _temporada = receta.getTemporada();
          return Boolean.valueOf(_temporada.equalsIgnoreCase(temporada));
        }
      };
      Iterable<Receta> _filter_4 = IterableExtensions.<Receta>filter(recetasABuscar, _function_4);
      Set<Receta> _set_4 = IterableExtensions.<Receta>toSet(_filter_4);
      recetasABuscar = _set_4;
    }
    String _ingrediente = consulta.getIngrediente();
    boolean _notEquals_5 = (!Objects.equal(_ingrediente, null));
    if (_notEquals_5) {
      final String ingrediente = consulta.getIngrediente();
      final Function1<Receta, Boolean> _function_5 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta receta) {
          Set<Ingrediente> _ingredientes = receta.getIngredientes();
          return Boolean.valueOf(_ingredientes.contains(ingrediente));
        }
      };
      Iterable<Receta> _filter_5 = IterableExtensions.<Receta>filter(recetasABuscar, _function_5);
      Set<Receta> _set_5 = IterableExtensions.<Receta>toSet(_filter_5);
      recetasABuscar = _set_5;
    }
    return recetasABuscar;
  }
  
  public boolean contieneIngredienteQueDisgusta(final Ingrediente ingrediente) {
    return this.comidasQueDisgustan.contains(ingrediente);
  }
  
  public boolean contieneCondimentoQueDisgusta(final Condimento condimento) {
    return this.comidasQueDisgustan.contains(condimento);
  }
  
  @Pure
  public LocalDate getFechaActual() {
    return this.fechaActual;
  }
  
  public void setFechaActual(final LocalDate fechaActual) {
    this.fechaActual = fechaActual;
  }
  
  @Pure
  public int getCARACTERES_MINIMOS() {
    return this.CARACTERES_MINIMOS;
  }
  
  public void setCARACTERES_MINIMOS(final int CARACTERES_MINIMOS) {
    this.CARACTERES_MINIMOS = CARACTERES_MINIMOS;
  }
  
  @Pure
  public boolean isHabilitarFavoritos() {
    return this.habilitarFavoritos;
  }
  
  public void setHabilitarFavoritos(final boolean habilitarFavoritos) {
    this.habilitarFavoritos = habilitarFavoritos;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public double getAltura() {
    return this.altura;
  }
  
  public void setAltura(final double altura) {
    this.altura = altura;
  }
  
  @Pure
  public double getPeso() {
    return this.peso;
  }
  
  public void setPeso(final double peso) {
    this.peso = peso;
  }
  
  @Pure
  public LocalDate getFechaDeNacimiento() {
    return this.fechaDeNacimiento;
  }
  
  public void setFechaDeNacimiento(final LocalDate fechaDeNacimiento) {
    this.fechaDeNacimiento = fechaDeNacimiento;
  }
  
  @Pure
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(final String password) {
    this.password = password;
  }
  
  @Pure
  public GrupoUsuario getGrupoAlQuePertenece() {
    return this.grupoAlQuePertenece;
  }
  
  public void setGrupoAlQuePertenece(final GrupoUsuario grupoAlQuePertenece) {
    this.grupoAlQuePertenece = grupoAlQuePertenece;
  }
  
  @Pure
  public List<CondicionPreexistente> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final List<CondicionPreexistente> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
  
  @Pure
  public String getSexo() {
    return this.sexo;
  }
  
  public void setSexo(final String sexo) {
    this.sexo = sexo;
  }
  
  @Pure
  public List<Caracteristica> getComidasQueDisgustan() {
    return this.comidasQueDisgustan;
  }
  
  public void setComidasQueDisgustan(final List<Caracteristica> comidasQueDisgustan) {
    this.comidasQueDisgustan = comidasQueDisgustan;
  }
  
  @Pure
  public List<String> getComidaPreferida() {
    return this.comidaPreferida;
  }
  
  public void setComidaPreferida(final List<String> comidaPreferida) {
    this.comidaPreferida = comidaPreferida;
  }
  
  @Pure
  public Rutina getRutina() {
    return this.rutina;
  }
  
  public void setRutina(final Rutina rutina) {
    this.rutina = rutina;
  }
  
  @Pure
  public Set<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final Set<Receta> recetas) {
    this.recetas = recetas;
  }
  
  @Pure
  public Set<Receta> getRecetasFavoritas() {
    return this.recetasFavoritas;
  }
  
  public void setRecetasFavoritas(final Set<Receta> recetasFavoritas) {
    this.recetasFavoritas = recetasFavoritas;
  }
  
  @Pure
  public List<Filtro> getFiltrosAAplicar() {
    return this.filtrosAAplicar;
  }
  
  public void setFiltrosAAplicar(final List<Filtro> filtrosAAplicar) {
    this.filtrosAAplicar = filtrosAAplicar;
  }
  
  @Pure
  public ProcesamientoPosterior getProcesamiento() {
    return this.procesamiento;
  }
  
  public void setProcesamiento(final ProcesamientoPosterior procesamiento) {
    this.procesamiento = procesamiento;
  }
}
