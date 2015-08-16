package cosasUsuario;

import condicion.CondicionPreexistente;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioAdministrador;
import java.util.List;
import java.util.Set;
import org.joda.time.LocalDate;
import receta.Caracteristica;
import receta.Receta;
import rutina.Rutina;

@SuppressWarnings("all")
public class UsuarioBuilder {
  private Usuario usuario = new Usuario();
  
  public UsuarioBuilder administrador() {
    UsuarioBuilder _xblockexpression = null;
    {
      UsuarioAdministrador _usuarioAdministrador = new UsuarioAdministrador();
      this.usuario = _usuarioAdministrador;
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conNombre(final String nombre) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setNombre(nombre);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conPeso(final double peso) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setPeso(peso);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conAltura(final double altura) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setAltura(altura);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder fechaDeNacimiento(final LocalDate fecha) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setFechaDeNacimiento(fecha);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conCondicion(final CondicionPreexistente cond) {
    UsuarioBuilder _xblockexpression = null;
    {
      List<CondicionPreexistente> _condicionesPreexistentes = this.usuario.getCondicionesPreexistentes();
      _condicionesPreexistentes.add(cond);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder deSexo(final String sex) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setSexo(sex);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder leDisgusta(final Caracteristica comida) {
    UsuarioBuilder _xblockexpression = null;
    {
      List<Caracteristica> _comidasQueDisgustan = this.usuario.getComidasQueDisgustan();
      _comidasQueDisgustan.add(comida);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder leGusta(final String comida) {
    UsuarioBuilder _xblockexpression = null;
    {
      List<String> _comidaPreferida = this.usuario.getComidaPreferida();
      _comidaPreferida.add(comida);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conRutina(final Rutina rutina) {
    UsuarioBuilder _xblockexpression = null;
    {
      this.usuario.setRutina(rutina);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public UsuarioBuilder conReceta(final Receta receta) {
    UsuarioBuilder _xblockexpression = null;
    {
      Set<Receta> _recetas = this.usuario.getRecetas();
      _recetas.add(receta);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
  
  public Usuario build() {
    return this.usuario;
  }
}
