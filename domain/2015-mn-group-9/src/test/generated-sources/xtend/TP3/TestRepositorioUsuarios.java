package TP3;

import condicion.CondicionDiabetico;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioAdministrador;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import repositorioUsuarios.RepositorioUsuarios;
import testeo.UsuariosExtras;

@Accessors
@SuppressWarnings("all")
public class TestRepositorioUsuarios extends UsuariosExtras {
  private RepositorioUsuarios repousuarios;
  
  private UsuarioAdministrador admin;
  
  private Usuario diabeticoDiego;
  
  @Before
  public void init() {
    super.init();
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    this.repousuarios = _instance;
    UsuarioAdministrador _usuarioAdministrador = new UsuarioAdministrador();
    this.admin = _usuarioAdministrador;
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        CondicionDiabetico _diabetico = TestRepositorioUsuarios.this.getDiabetico();
        it.agregarCondicion(_diabetico);
        it.setNombre("diego");
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.diabeticoDiego = _doubleArrow;
  }
  
  @Test
  public void agregarADiegoAListaDeSuscripcionPendiente() {
    Usuario _diego = this.getDiego();
    ArrayList<Usuario> listaResultadoConDiego = new ArrayList<Usuario>(Collections.<Usuario>unmodifiableList(CollectionLiterals.<Usuario>newArrayList(_diego)));
    Usuario _diego_1 = this.getDiego();
    _diego_1.solicitarIngresoASistema();
    List<Usuario> _listaPorAceptarse = this.repousuarios.getListaPorAceptarse();
    Assert.assertEquals(listaResultadoConDiego, _listaPorAceptarse);
  }
  
  @After
  public void borrarLista() {
    List<Usuario> _listaPorAceptarse = this.repousuarios.getListaPorAceptarse();
    CollectionExtensions.<Usuario>removeAll(_listaPorAceptarse);
  }
  
  /**
   * @Test
   * def void aceptarSuscripcionDeDiegoYRechazarALeandro() {
   * repousuarios.allInstances.removeAll
   * var listaAceptados = new ArrayList(#[diego])
   * diego.solicitarIngresoASistema()
   * leandro.solicitarIngresoASistema()
   * admin.rechazarSuscripcion(leandro, "no puso bien su nombre")
   * admin.aceptarSuscripcion(diego)
   * Assert.assertEquals(listaAceptados, repousuarios.allInstances)
   * }
   */
  @Test
  public void devolvermeUnUsuarioConNombreDiego() {
    Usuario usuarioPrototipo = new Usuario();
    usuarioPrototipo.setNombre("diego");
    Usuario usuarioDevuelto = new Usuario();
    Usuario _diego = this.getDiego();
    _diego.solicitarIngresoASistema();
    Usuario _leandro = this.getLeandro();
    _leandro.solicitarIngresoASistema();
    Usuario _diego_1 = this.getDiego();
    this.admin.aceptarSuscripcion(_diego_1);
    Usuario _leandro_1 = this.getLeandro();
    this.admin.aceptarSuscripcion(_leandro_1);
    Usuario _get = this.repousuarios.get(usuarioPrototipo);
    usuarioDevuelto = _get;
    Usuario _diego_2 = this.getDiego();
    Assert.assertEquals(usuarioDevuelto, _diego_2);
  }
  
  @After
  public void borrarLista3() {
    List<Usuario> _allInstances = this.repousuarios.allInstances();
    CollectionExtensions.<Usuario>removeAll(_allInstances);
    List<Usuario> _listaPorAceptarse = this.repousuarios.getListaPorAceptarse();
    CollectionExtensions.<Usuario>removeAll(_listaPorAceptarse);
  }
  
  @Test
  public void devolverListaConUsrDiabeticoDiegoPorCriterioDeNombreYCondicionDiabeticos() {
    Usuario usuarioPrototipo = new Usuario();
    usuarioPrototipo.setNombre("diego");
    CondicionDiabetico _diabetico = this.getDiabetico();
    usuarioPrototipo.agregarCondicion(_diabetico);
    Usuario _diego = this.getDiego();
    _diego.solicitarIngresoASistema();
    this.diabeticoDiego.solicitarIngresoASistema();
    Usuario _diego_1 = this.getDiego();
    this.admin.aceptarSuscripcion(_diego_1);
    this.admin.aceptarSuscripcion(this.diabeticoDiego);
    List<Usuario> _list = this.repousuarios.list(usuarioPrototipo);
    Assert.assertEquals(Collections.<Usuario>unmodifiableList(CollectionLiterals.<Usuario>newArrayList(this.diabeticoDiego)), _list);
  }
  
  @Pure
  public RepositorioUsuarios getRepousuarios() {
    return this.repousuarios;
  }
  
  public void setRepousuarios(final RepositorioUsuarios repousuarios) {
    this.repousuarios = repousuarios;
  }
  
  @Pure
  public UsuarioAdministrador getAdmin() {
    return this.admin;
  }
  
  public void setAdmin(final UsuarioAdministrador admin) {
    this.admin = admin;
  }
  
  @Pure
  public Usuario getDiabeticoDiego() {
    return this.diabeticoDiego;
  }
  
  public void setDiabeticoDiego(final Usuario diabeticoDiego) {
    this.diabeticoDiego = diabeticoDiego;
  }
}
