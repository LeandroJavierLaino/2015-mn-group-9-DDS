package repositorioRecetas;

import com.google.common.base.Objects;
import com.google.common.collect.Iterables;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioBuilder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;
import receta.RecetaBuilder;
import repositorioRecetas.AdapterRepositorioRecetas;

@Accessors
@SuppressWarnings("all")
public class RepositorioRecetas {
  private Collection<Receta> recetas = new ArrayList<Receta>();
  
  private static RepositorioRecetas instance = null;
  
  private AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas();
  
  private Collection<Receta> recetasTotales = new ArrayList<Receta>();
  
  private Receta recetaSalchiPapa;
  
  private Usuario nicolas;
  
  private Ingrediente salchicha;
  
  private Condimento ketchup;
  
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
  
  public RepositorioRecetas() {
    Ingrediente _ingrediente = new Ingrediente("Salchichas", 12, "unidades");
    this.salchicha = _ingrediente;
    Condimento _condimento = new Condimento("ketchup", 200, "mililitros");
    this.ketchup = _condimento;
    RecetaBuilder _recetaBuilder = new RecetaBuilder();
    RecetaBuilder _nombre = _recetaBuilder.nombre("SalchiPapa");
    RecetaBuilder _conCalorias = _nombre.conCalorias(150);
    RecetaBuilder _dificultad = _conCalorias.dificultad("Baja");
    RecetaBuilder _pasoInstruccion = _dificultad.pasoInstruccion("Hervir Salchichas");
    RecetaBuilder _pasoInstruccion_1 = _pasoInstruccion.pasoInstruccion("Freir Papas");
    RecetaBuilder _ingrediente_1 = _pasoInstruccion_1.ingrediente(this.salchicha);
    RecetaBuilder _condimento_1 = _ingrediente_1.condimento(this.ketchup);
    RecetaBuilder _temporada = _condimento_1.temporada("Verano");
    Receta _build = _temporada.build();
    this.recetaSalchiPapa = _build;
    this.recetas.add(this.recetaSalchiPapa);
    UsuarioBuilder _usuarioBuilder = new UsuarioBuilder();
    UsuarioBuilder _conNombre = _usuarioBuilder.conNombre("Nicolas");
    UsuarioBuilder _deSexo = _conNombre.deSexo("M");
    LocalDate _localDate = new LocalDate(1980, 11, 10);
    UsuarioBuilder _fechaDeNacimiento = _deSexo.fechaDeNacimiento(_localDate);
    UsuarioBuilder _conAltura = _fechaDeNacimiento.conAltura(1.74);
    UsuarioBuilder _conPeso = _conAltura.conPeso(60);
    Usuario _build_1 = _conPeso.build();
    this.nicolas = _build_1;
    this.recetaSalchiPapa.setCreador(this.nicolas);
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
  
  public Iterable<Receta> listarRecetas() {
    List<Receta> _obtenerRecetasExternas = this.obtenerRecetasExternas();
    return Iterables.<Receta>concat(this.recetas, _obtenerRecetasExternas);
  }
  
  public boolean agregar(final Receta receta) {
    return this.recetas.add(receta);
  }
  
  public boolean quitar(final Receta receta) {
    return this.recetas.remove(receta);
  }
  
  public Set<Receta> listarRecetasVisiblesPara(final Usuario usuario) {
    Iterable<Receta> _listarRecetas = this.listarRecetas();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta unaReceta) {
        return Boolean.valueOf(unaReceta.puedeVerReceta(usuario));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(_listarRecetas, _function);
    return IterableExtensions.<Receta>toSet(_filter);
  }
  
  public List<Receta> obtenerRecetasExternas(final BusquedaRecetas busquedaRecetas) {
    return this.adapter.obtenerRecetas(busquedaRecetas);
  }
  
  public List<Receta> obtenerRecetasExternas() {
    return this.adapter.obtenerRecetas();
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
  public Receta getRecetaSalchiPapa() {
    return this.recetaSalchiPapa;
  }
  
  public void setRecetaSalchiPapa(final Receta recetaSalchiPapa) {
    this.recetaSalchiPapa = recetaSalchiPapa;
  }
  
  @Pure
  public Usuario getNicolas() {
    return this.nicolas;
  }
  
  public void setNicolas(final Usuario nicolas) {
    this.nicolas = nicolas;
  }
  
  @Pure
  public Ingrediente getSalchicha() {
    return this.salchicha;
  }
  
  public void setSalchicha(final Ingrediente salchicha) {
    this.salchicha = salchicha;
  }
  
  @Pure
  public Condimento getKetchup() {
    return this.ketchup;
  }
  
  public void setKetchup(final Condimento ketchup) {
    this.ketchup = ketchup;
  }
}
