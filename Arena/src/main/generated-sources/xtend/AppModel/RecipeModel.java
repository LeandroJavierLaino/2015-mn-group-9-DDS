package AppModel;

import com.google.common.base.Objects;
import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;

@Accessors
@Observable
@SuppressWarnings("all")
public class RecipeModel {
  private Receta recipe;
  
  private String nombrePlato;
  
  private String dificultad;
  
  private String temporada;
  
  private String procedimiento;
  
  private List<Condimento> condimentos;
  
  private List<Ingrediente> ingredientes;
  
  private List<String> procesoPreparacion;
  
  private List<Receta> subRecetas;
  
  private List<CondicionPreexistente> condicionesPreexistentes;
  
  private double totalCalorias;
  
  private String creador;
  
  private Usuario usuario;
  
  private Ingrediente ingredienteSeleccionado;
  
  private Condimento condimentoSeleccionado;
  
  private CondicionPreexistente condSelec;
  
  public RecipeModel(final Receta receta, final Usuario user) {
    this.recipe = receta;
    this.usuario = user;
  }
  
  public List<CondicionPreexistente> inspeccionarReceta() {
    List<CondicionPreexistente> _xblockexpression = null;
    {
      String _nombrePlato = this.recipe.getNombrePlato();
      this.nombrePlato = _nombrePlato;
      List<String> _procesoPreparacion = this.recipe.getProcesoPreparacion();
      this.procesoPreparacion = _procesoPreparacion;
      double _totalCalorias = this.recipe.getTotalCalorias();
      this.totalCalorias = _totalCalorias;
      String _dificultad = this.recipe.getDificultad();
      this.dificultad = _dificultad;
      String _creador = this.recipe.getCreador();
      this.creador = _creador;
      String _temporada = this.recipe.getTemporada();
      this.temporada = _temporada;
      Set<Ingrediente> _ingredientes = this.recipe.getIngredientes();
      List<Ingrediente> _list = IterableExtensions.<Ingrediente>toList(_ingredientes);
      this.ingredientes = _list;
      Set<Condimento> _condimentos = this.recipe.getCondimentos();
      List<Condimento> _list_1 = IterableExtensions.<Condimento>toList(_condimentos);
      this.condimentos = _list_1;
      Set<CondicionPreexistente> _condicionesPreexistentes = this.recipe.getCondicionesPreexistentes();
      List<CondicionPreexistente> _list_2 = IterableExtensions.<CondicionPreexistente>toList(_condicionesPreexistentes);
      _xblockexpression = this.condicionesPreexistentes = _list_2;
    }
    return _xblockexpression;
  }
  
  public boolean esFavorita() {
    Set<Receta> _recetasFavoritas = this.usuario.getRecetasFavoritas();
    return _recetasFavoritas.contains(this.recipe);
  }
  
  public String preparacion() {
    String _xblockexpression = null;
    {
      this.procedimiento = "";
      for (final String paso : this.procesoPreparacion) {
        String _last = IterableExtensions.<String>last(this.procesoPreparacion);
        boolean _notEquals = (!Objects.equal(paso, _last));
        if (_notEquals) {
          String _procedimiento = this.procedimiento;
          this.procedimiento = (_procedimiento + (paso + ", "));
        } else {
          String _procedimiento_1 = this.procedimiento;
          this.procedimiento = (_procedimiento_1 + paso);
        }
      }
      _xblockexpression = this.procedimiento;
    }
    return _xblockexpression;
  }
  
  @Pure
  public Receta getRecipe() {
    return this.recipe;
  }
  
  public void setRecipe(final Receta recipe) {
    this.recipe = recipe;
  }
  
  @Pure
  public String getNombrePlato() {
    return this.nombrePlato;
  }
  
  public void setNombrePlato(final String nombrePlato) {
    this.nombrePlato = nombrePlato;
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
  public String getProcedimiento() {
    return this.procedimiento;
  }
  
  public void setProcedimiento(final String procedimiento) {
    this.procedimiento = procedimiento;
  }
  
  @Pure
  public List<Condimento> getCondimentos() {
    return this.condimentos;
  }
  
  public void setCondimentos(final List<Condimento> condimentos) {
    this.condimentos = condimentos;
  }
  
  @Pure
  public List<Ingrediente> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<Ingrediente> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  @Pure
  public List<String> getProcesoPreparacion() {
    return this.procesoPreparacion;
  }
  
  public void setProcesoPreparacion(final List<String> procesoPreparacion) {
    this.procesoPreparacion = procesoPreparacion;
  }
  
  @Pure
  public List<Receta> getSubRecetas() {
    return this.subRecetas;
  }
  
  public void setSubRecetas(final List<Receta> subRecetas) {
    this.subRecetas = subRecetas;
  }
  
  @Pure
  public List<CondicionPreexistente> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final List<CondicionPreexistente> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
  
  @Pure
  public double getTotalCalorias() {
    return this.totalCalorias;
  }
  
  public void setTotalCalorias(final double totalCalorias) {
    this.totalCalorias = totalCalorias;
  }
  
  @Pure
  public String getCreador() {
    return this.creador;
  }
  
  public void setCreador(final String creador) {
    this.creador = creador;
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public Ingrediente getIngredienteSeleccionado() {
    return this.ingredienteSeleccionado;
  }
  
  public void setIngredienteSeleccionado(final Ingrediente ingredienteSeleccionado) {
    this.ingredienteSeleccionado = ingredienteSeleccionado;
  }
  
  @Pure
  public Condimento getCondimentoSeleccionado() {
    return this.condimentoSeleccionado;
  }
  
  public void setCondimentoSeleccionado(final Condimento condimentoSeleccionado) {
    this.condimentoSeleccionado = condimentoSeleccionado;
  }
  
  @Pure
  public CondicionPreexistente getCondSelec() {
    return this.condSelec;
  }
  
  public void setCondSelec(final CondicionPreexistente condSelec) {
    this.condSelec = condSelec;
  }
}
