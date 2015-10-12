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
import org.joda.time.LocalDate;
import org.uqbar.commons.model.Entity;
import procesamientoPosterior.ProcesamientoPosterior;
import receta.Caracteristica;
import receta.Receta;
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
    return this.recetas.contains(receta);
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
    boolean _xifexpression = false;
    boolean _or = false;
    boolean _equals = Objects.equal(usuario, null);
    if (_equals) {
      _or = true;
    } else {
      boolean _equals_1 = Objects.equal(this.grupoAlQuePertenece, null);
      _or = _equals_1;
    }
    if (_or) {
      _xifexpression = false;
    } else {
      _xifexpression = this.grupoAlQuePertenece.tieneUnUsuario(usuario);
    }
    return _xifexpression;
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
