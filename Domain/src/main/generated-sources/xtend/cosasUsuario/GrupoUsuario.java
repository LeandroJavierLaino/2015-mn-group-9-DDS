package cosasUsuario;

import cosasUsuario.Usuario;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import receta.Caracteristica;
import receta.Receta;

@Accessors
@SuppressWarnings("all")
public class GrupoUsuario {
  private List<Caracteristica> palabrasClave = new ArrayList<Caracteristica>();
  
  private Set<Usuario> usuarios = new HashSet<Usuario>();
  
  private String nombre;
  
  private Set<Receta> recetas;
  
  public boolean perteneceALasPalabrasClave(final Caracteristica caracteristica) {
    return this.palabrasClave.contains(caracteristica);
  }
  
  public Boolean esApropiadoParaTodos(final Receta receta) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        return Boolean.valueOf(usuario.esRecomendable(receta));
      }
    };
    return Boolean.valueOf(IterableExtensions.<Usuario>forall(this.usuarios, _function));
  }
  
  public boolean tieneUnUsuario(final Usuario usuario) {
    return this.usuarios.contains(usuario);
  }
  
  public void agregarUsuario(final Usuario usuario) {
    this.usuarios.add(usuario);
    usuario.setGrupoAlQuePertenece(this);
  }
  
  public boolean sacarUsuario(final Usuario usuario) {
    return this.usuarios.remove(usuario);
  }
  
  public boolean puedeSerSugeridaRecetaAlGrupo(final Receta receta) {
    boolean _and = false;
    boolean _tieneUnIngredienteOCondimentoQueGustaPara = receta.tieneUnIngredienteOCondimentoQueGustaPara(this);
    if (!_tieneUnIngredienteOCondimentoQueGustaPara) {
      _and = false;
    } else {
      Boolean _esApropiadoParaTodos = this.esApropiadoParaTodos(receta);
      _and = (_esApropiadoParaTodos).booleanValue();
    }
    return _and;
  }
  
  public Set<Receta> todasLasRecetas() {
    Set<Receta> _xblockexpression = null;
    {
      Set<Receta> todasLasRecetas = new HashSet<Receta>();
      Set<Receta> _emptySet = CollectionLiterals.<Receta>emptySet();
      todasLasRecetas = _emptySet;
      for (final Usuario usuario : this.usuarios) {
        Set<Receta> _recetas = usuario.getRecetas();
        todasLasRecetas.addAll(_recetas);
      }
      System.out.println(todasLasRecetas);
      _xblockexpression = todasLasRecetas;
    }
    return _xblockexpression;
  }
  
  @Pure
  public List<Caracteristica> getPalabrasClave() {
    return this.palabrasClave;
  }
  
  public void setPalabrasClave(final List<Caracteristica> palabrasClave) {
    this.palabrasClave = palabrasClave;
  }
  
  @Pure
  public Set<Usuario> getUsuarios() {
    return this.usuarios;
  }
  
  public void setUsuarios(final Set<Usuario> usuarios) {
    this.usuarios = usuarios;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Set<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final Set<Receta> recetas) {
    this.recetas = recetas;
  }
}
