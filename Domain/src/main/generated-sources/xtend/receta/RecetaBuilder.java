package receta;

import java.util.List;
import java.util.Set;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;

@SuppressWarnings("all")
public class RecetaBuilder {
  private Receta receta = new Receta();
  
  public RecetaBuilder nombre(final String nombreDelPlato) {
    RecetaBuilder _xblockexpression = null;
    {
      this.receta.setNombrePlato(nombreDelPlato);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder ingrediente(final Ingrediente vIngrediente) {
    RecetaBuilder _xblockexpression = null;
    {
      Set<Ingrediente> _ingredientes = this.receta.getIngredientes();
      _ingredientes.add(vIngrediente);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder ingredientes(final Set<Ingrediente> vIngredientes) {
    RecetaBuilder _xblockexpression = null;
    {
      Set<Ingrediente> _ingredientes = this.receta.getIngredientes();
      _ingredientes.addAll(vIngredientes);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder condimento(final Condimento vCondimento) {
    RecetaBuilder _xblockexpression = null;
    {
      Set<Condimento> _condimentos = this.receta.getCondimentos();
      _condimentos.add(vCondimento);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder condimentos(final Set<Condimento> vCondimentos) {
    RecetaBuilder _xblockexpression = null;
    {
      Set<Condimento> _condimentos = this.receta.getCondimentos();
      _condimentos.addAll(vCondimentos);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder pasoInstruccion(final String paso) {
    RecetaBuilder _xblockexpression = null;
    {
      List<String> _procesoPreparacion = this.receta.getProcesoPreparacion();
      _procesoPreparacion.add(paso);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder instrucciones(final List<String> pasos) {
    RecetaBuilder _xblockexpression = null;
    {
      List<String> _procesoPreparacion = this.receta.getProcesoPreparacion();
      _procesoPreparacion.addAll(pasos);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder conCalorias(final double calorias) {
    RecetaBuilder _xblockexpression = null;
    {
      this.receta.setTotalCalorias(calorias);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder dificultad(final String nivel) {
    RecetaBuilder _xblockexpression = null;
    {
      this.receta.setDificultad(nivel);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public RecetaBuilder temporada(final String temporada) {
    RecetaBuilder _xblockexpression = null;
    {
      this.receta.setTemporada(temporada);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public Receta build() {
    return this.receta;
  }
}