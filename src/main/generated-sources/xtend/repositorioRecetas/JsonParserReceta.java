package repositorioRecetas;

import com.eclipsesource.json.JsonArray;
import com.eclipsesource.json.JsonObject;
import com.eclipsesource.json.JsonValue;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Extension;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.xtrest.json.JSONUtils;
import receta.Ingrediente;
import receta.Receta;
import receta.RecetaBuilder;

@Accessors
@SuppressWarnings("all")
public class JsonParserReceta {
  private String nombre;
  
  private List<String> ingredientes = new ArrayList<String>();
  
  private int tiempoPreparacion;
  
  private int totalCalorias;
  
  private String dificultadReceta;
  
  private String autor;
  
  private int anioReceta;
  
  @Extension
  private JSONUtils _jSONUtils = new JSONUtils();
  
  public Receta transformarReceta(final JsonParserReceta receta) {
    Receta _xblockexpression = null;
    {
      RecetaBuilder _recetaBuilder = new RecetaBuilder();
      RecetaBuilder _nombre = _recetaBuilder.nombre(receta.nombre);
      Set<Ingrediente> _transformarIngredientes = this.transformarIngredientes(receta.ingredientes);
      RecetaBuilder _ingredientes = _nombre.ingredientes(_transformarIngredientes);
      RecetaBuilder _conCalorias = _ingredientes.conCalorias(((double) receta.totalCalorias));
      RecetaBuilder _dificultad = _conCalorias.dificultad(receta.dificultadReceta);
      RecetaBuilder _creadaPor = _dificultad.creadaPor(receta.autor);
      RecetaBuilder _esPublica = _creadaPor.esPublica();
      Receta recetaTransformada = _esPublica.build();
      _xblockexpression = recetaTransformada;
    }
    return _xblockexpression;
  }
  
  public Set<Ingrediente> transformarIngredientes(final List<String> ingredientes) {
    Set<Ingrediente> _xblockexpression = null;
    {
      Set<Ingrediente> ingredientesTransformados = new HashSet<Ingrediente>();
      for (final String ingrediente : ingredientes) {
        {
          Ingrediente ingredienteTransformado = this._jSONUtils.<Ingrediente>fromJson(ingrediente, Ingrediente.class);
          ingredientesTransformados.add(ingredienteTransformado);
        }
      }
      _xblockexpression = ingredientesTransformados;
    }
    return _xblockexpression;
  }
  
  public JsonParserReceta parsear(final JsonObject object) {
    JsonParserReceta _xblockexpression = null;
    {
      List<String> ingrediente = new ArrayList<String>();
      JsonValue _get = object.get("nombre");
      String _asString = _get.asString();
      this.nombre = _asString;
      JsonValue _get_1 = object.get("ingredientes");
      JsonArray ingredientes = _get_1.asArray();
      for (final JsonValue value2 : ingredientes) {
        String _asString_1 = value2.asString();
        ingrediente.add(_asString_1);
      }
      JsonValue _get_2 = object.get("tiempoPreparacion");
      int _asInt = _get_2.asInt();
      this.tiempoPreparacion = _asInt;
      JsonValue _get_3 = object.get("totalCalorias");
      int _asInt_1 = _get_3.asInt();
      this.totalCalorias = _asInt_1;
      JsonValue _get_4 = object.get("dificultadReceta");
      String _asString_2 = _get_4.asString();
      this.dificultadReceta = _asString_2;
      JsonValue _get_5 = object.get("autor");
      String _asString_3 = _get_5.asString();
      this.autor = _asString_3;
      JsonValue _get_6 = object.get("anioReceta");
      int _asInt_2 = _get_6.asInt();
      this.anioReceta = _asInt_2;
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public List<String> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<String> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  @Pure
  public int getTiempoPreparacion() {
    return this.tiempoPreparacion;
  }
  
  public void setTiempoPreparacion(final int tiempoPreparacion) {
    this.tiempoPreparacion = tiempoPreparacion;
  }
  
  @Pure
  public int getTotalCalorias() {
    return this.totalCalorias;
  }
  
  public void setTotalCalorias(final int totalCalorias) {
    this.totalCalorias = totalCalorias;
  }
  
  @Pure
  public String getDificultadReceta() {
    return this.dificultadReceta;
  }
  
  public void setDificultadReceta(final String dificultadReceta) {
    this.dificultadReceta = dificultadReceta;
  }
  
  @Pure
  public String getAutor() {
    return this.autor;
  }
  
  public void setAutor(final String autor) {
    this.autor = autor;
  }
  
  @Pure
  public int getAnioReceta() {
    return this.anioReceta;
  }
  
  public void setAnioReceta(final int anioReceta) {
    this.anioReceta = anioReceta;
  }
  
  @Pure
  public JSONUtils get_jSONUtils() {
    return this._jSONUtils;
  }
  
  public void set_jSONUtils(final JSONUtils _jSONUtils) {
    this._jSONUtils = _jSONUtils;
  }
}
