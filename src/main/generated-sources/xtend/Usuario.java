import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario {
  private double altura;
  
  private double peso;
  
  private String nombre;
  
  private int fechaDeNacimiento;
  
  private String sexo;
  
  private List<String> comidasQueDisgustan = new ArrayList<String>();
  
  private List<String> comidaPreferida = new ArrayList<String>();
  
  private List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>();
  
  private Rutina rutina;
  
  private Collection<Receta> recetas = new HashSet<Receta>();
  
  public double calculaIMC() {
    return (this.peso / (this.altura * this.altura));
  }
  
  public void agregarCondicion(final CondicionPreexistente condicion) {
    this.condicionesPreexistentes.add(condicion);
  }
  
  public boolean validar() {
    boolean _and = false;
    boolean _and_1 = false;
    boolean _and_2 = false;
    if (!(((this.altura > 0) && (this.peso > 0)) && (this.fechaDeNacimiento > 0))) {
      _and_2 = false;
    } else {
      boolean _notEquals = (!Objects.equal(this.nombre, ""));
      _and_2 = _notEquals;
    }
    if (!_and_2) {
      _and_1 = false;
    } else {
      int _length = this.nombre.length();
      boolean _greaterThan = (_length > 4);
      _and_1 = _greaterThan;
    }
    if (!_and_1) {
      _and = false;
    } else {
      Boolean _condicionesPreexistentesSonValidas = this.condicionesPreexistentesSonValidas();
      _and = (_condicionesPreexistentesSonValidas).booleanValue();
    }
    return _and;
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
          return it.valido(Usuario.this);
        }
      };
      boolean _forall = IterableExtensions.<CondicionPreexistente>forall(this.condicionesPreexistentes, _function);
      _or = _forall;
    }
    return Boolean.valueOf(_or);
  }
  
  public Boolean sigueUnaRutinaSaludable() {
    boolean _xifexpression = false;
    boolean _and = false;
    boolean _and_1 = false;
    Boolean _noTieneCondicionesPreexistentes = this.noTieneCondicionesPreexistentes();
    if (!(_noTieneCondicionesPreexistentes).booleanValue()) {
      _and_1 = false;
    } else {
      double _calculaIMC = this.calculaIMC();
      boolean _greaterEqualsThan = (_calculaIMC >= 18);
      _and_1 = _greaterEqualsThan;
    }
    if (!_and_1) {
      _and = false;
    } else {
      double _calculaIMC_1 = this.calculaIMC();
      boolean _lessEqualsThan = (_calculaIMC_1 <= 30);
      _and = _lessEqualsThan;
    }
    if (_and) {
      _xifexpression = true;
    } else {
      final Function1<CondicionPreexistente, Boolean> _function = new Function1<CondicionPreexistente, Boolean>() {
        public Boolean apply(final CondicionPreexistente it) {
          return it.tieneRutinaSaludable(Usuario.this);
        }
      };
      _xifexpression = IterableExtensions.<CondicionPreexistente>forall(this.condicionesPreexistentes, _function);
    }
    return Boolean.valueOf(_xifexpression);
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
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public int getFechaDeNacimiento() {
    return this.fechaDeNacimiento;
  }
  
  public void setFechaDeNacimiento(final int fechaDeNacimiento) {
    this.fechaDeNacimiento = fechaDeNacimiento;
  }
  
  @Pure
  public String getSexo() {
    return this.sexo;
  }
  
  public void setSexo(final String sexo) {
    this.sexo = sexo;
  }
  
  @Pure
  public List<String> getComidasQueDisgustan() {
    return this.comidasQueDisgustan;
  }
  
  public void setComidasQueDisgustan(final List<String> comidasQueDisgustan) {
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
  public List<CondicionPreexistente> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final List<CondicionPreexistente> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
  
  @Pure
  public Rutina getRutina() {
    return this.rutina;
  }
  
  public void setRutina(final Rutina rutina) {
    this.rutina = rutina;
  }
  
  @Pure
  public Collection<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final Collection<Receta> recetas) {
    this.recetas = recetas;
  }
}
