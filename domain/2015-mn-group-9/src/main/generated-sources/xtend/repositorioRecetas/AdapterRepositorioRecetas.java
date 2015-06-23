package repositorioRecetas;

import com.eclipsesource.json.JsonArray;
import com.eclipsesource.json.JsonObject;
import com.eclipsesource.json.JsonValue;
import java.util.ArrayList;
import java.util.List;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import queComemos.entrega3.repositorio.RepoRecetas;
import receta.Receta;
import repositorioRecetas.JsonParserReceta;

@SuppressWarnings("all")
public class AdapterRepositorioRecetas extends RepoRecetas {
  private JsonParserReceta receta = new JsonParserReceta();
  
  private JsonParserReceta transformer = new JsonParserReceta();
  
  private Receta recetaTransformada;
  
  private List<Receta> recetasFinales = new ArrayList<Receta>();
  
  public List<Receta> obtenerRecetas() {
    BusquedaRecetas _busquedaRecetas = new BusquedaRecetas();
    return this.obtenerRecetas(_busquedaRecetas);
  }
  
  public List<Receta> obtenerRecetas(final BusquedaRecetas busquedaRecetas) {
    List<Receta> _xblockexpression = null;
    {
      String s = this.getRecetas(busquedaRecetas);
      _xblockexpression = this.parsearJSON(s);
    }
    return _xblockexpression;
  }
  
  public List<Receta> parsearJSON(final String s) {
    List<Receta> _xblockexpression = null;
    {
      JsonArray jsonArray = JsonArray.readFrom(s);
      for (final JsonValue value : jsonArray) {
        {
          JsonObject jsonObject = value.asObject();
          JsonParserReceta _parsear = this.transformer.parsear(jsonObject);
          this.receta = _parsear;
          Receta _transformarReceta = this.receta.transformarReceta(this.receta);
          this.recetaTransformada = _transformarReceta;
          this.recetasFinales.add(this.recetaTransformada);
        }
      }
      _xblockexpression = this.recetasFinales;
    }
    return _xblockexpression;
  }
}
