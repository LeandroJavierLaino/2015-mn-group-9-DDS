package testeo;

import cosasUsuario.Usuario;
import cosasUsuario.UsuarioBuilder;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;
import org.junit.Before;
import receta.Condimento;
import receta.Receta;
import rutina.RutinaActiva;
import testeo.TestInstances;

@Accessors
@SuppressWarnings("all")
public class UsuariosPrincipales extends TestInstances {
  private Usuario eri;
  
  private Usuario leandro;
  
  private Usuario diego;
  
  private Usuario nicolas;
  
  private Usuario pablo;
  
  @Before
  public void init() {
    super.init();
    UsuarioBuilder _usuarioBuilder = new UsuarioBuilder();
    UsuarioBuilder _conNombre = _usuarioBuilder.conNombre("Leandro");
    UsuarioBuilder _deSexo = _conNombre.deSexo("M");
    LocalDate _localDate = new LocalDate(1988, 6, 27);
    UsuarioBuilder _fechaDeNacimiento = _deSexo.fechaDeNacimiento(_localDate);
    UsuarioBuilder _conPeso = _fechaDeNacimiento.conPeso(70);
    UsuarioBuilder _conAltura = _conPeso.conAltura(1.74);
    RutinaActiva _rutinaActivaCorta = this.getRutinaActivaCorta();
    UsuarioBuilder _conRutina = _conAltura.conRutina(_rutinaActivaCorta);
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    UsuarioBuilder _conReceta = _conRutina.conReceta(_recetaAntiDiabetico);
    Usuario _build = _conReceta.build();
    this.leandro = _build;
    UsuarioBuilder _usuarioBuilder_1 = new UsuarioBuilder();
    UsuarioBuilder _conNombre_1 = _usuarioBuilder_1.conNombre("Erika");
    UsuarioBuilder _deSexo_1 = _conNombre_1.deSexo("F");
    LocalDate _localDate_1 = new LocalDate(1980, 1, 1);
    UsuarioBuilder _fechaDeNacimiento_1 = _deSexo_1.fechaDeNacimiento(_localDate_1);
    UsuarioBuilder _conAltura_1 = _fechaDeNacimiento_1.conAltura(1.52);
    UsuarioBuilder _conPeso_1 = _conAltura_1.conPeso(60);
    RutinaActiva _rutinaActivaLarga = this.getRutinaActivaLarga();
    UsuarioBuilder _conRutina_1 = _conPeso_1.conRutina(_rutinaActivaLarga);
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    UsuarioBuilder _conReceta_1 = _conRutina_1.conReceta(_recetaParaCualquiera);
    Usuario _build_1 = _conReceta_1.build();
    this.eri = _build_1;
    UsuarioBuilder _usuarioBuilder_2 = new UsuarioBuilder();
    UsuarioBuilder _conNombre_2 = _usuarioBuilder_2.conNombre("Diego");
    UsuarioBuilder _deSexo_2 = _conNombre_2.deSexo("M");
    LocalDate _localDate_2 = new LocalDate(1980, 1, 1);
    UsuarioBuilder _fechaDeNacimiento_2 = _deSexo_2.fechaDeNacimiento(_localDate_2);
    UsuarioBuilder _conAltura_2 = _fechaDeNacimiento_2.conAltura(1.70);
    UsuarioBuilder _conPeso_2 = _conAltura_2.conPeso(65);
    RutinaActiva _rutinaActivaCorta_1 = this.getRutinaActivaCorta();
    UsuarioBuilder _conRutina_2 = _conPeso_2.conRutina(_rutinaActivaCorta_1);
    Usuario _build_2 = _conRutina_2.build();
    this.diego = _build_2;
    UsuarioBuilder _usuarioBuilder_3 = new UsuarioBuilder();
    UsuarioBuilder _conNombre_3 = _usuarioBuilder_3.conNombre("Nicolas");
    UsuarioBuilder _deSexo_3 = _conNombre_3.deSexo("M");
    LocalDate _localDate_3 = new LocalDate(1980, 11, 10);
    UsuarioBuilder _fechaDeNacimiento_3 = _deSexo_3.fechaDeNacimiento(_localDate_3);
    UsuarioBuilder _conAltura_3 = _fechaDeNacimiento_3.conAltura(1.74);
    UsuarioBuilder _conPeso_3 = _conAltura_3.conPeso(60);
    RutinaActiva _rutinaActivaLarga_1 = this.getRutinaActivaLarga();
    UsuarioBuilder _conRutina_3 = _conPeso_3.conRutina(_rutinaActivaLarga_1);
    Condimento _ajiMolido = this.getAjiMolido();
    UsuarioBuilder _leDisgusta = _conRutina_3.leDisgusta(_ajiMolido);
    Receta _recetaSalchiPapa = this.getRecetaSalchiPapa();
    UsuarioBuilder _conReceta_2 = _leDisgusta.conReceta(_recetaSalchiPapa);
    Receta _recetaPolloAlOreganato = this.getRecetaPolloAlOreganato();
    UsuarioBuilder _conReceta_3 = _conReceta_2.conReceta(_recetaPolloAlOreganato);
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    UsuarioBuilder _conReceta_4 = _conReceta_3.conReceta(_recetaAntiVegano);
    Usuario _build_3 = _conReceta_4.build();
    this.nicolas = _build_3;
    UsuarioBuilder _usuarioBuilder_4 = new UsuarioBuilder();
    UsuarioBuilder _conNombre_4 = _usuarioBuilder_4.conNombre("Pablo");
    UsuarioBuilder _deSexo_4 = _conNombre_4.deSexo("M");
    LocalDate _localDate_4 = new LocalDate(1980, 2, 2);
    UsuarioBuilder _fechaDeNacimiento_4 = _deSexo_4.fechaDeNacimiento(_localDate_4);
    UsuarioBuilder _conAltura_4 = _fechaDeNacimiento_4.conAltura(1.79);
    UsuarioBuilder _conPeso_4 = _conAltura_4.conPeso(72);
    RutinaActiva _rutinaActivaCorta_2 = this.getRutinaActivaCorta();
    UsuarioBuilder _conRutina_4 = _conPeso_4.conRutina(_rutinaActivaCorta_2);
    Usuario _build_4 = _conRutina_4.build();
    this.pablo = _build_4;
    Receta _recetaSalchiPapa_1 = this.getRecetaSalchiPapa();
    String _nombre = this.nicolas.getNombre();
    _recetaSalchiPapa_1.setCreador(_nombre);
    Receta _recetaAntiVegano_1 = this.getRecetaAntiVegano();
    String _nombre_1 = this.leandro.getNombre();
    _recetaAntiVegano_1.setCreador(_nombre_1);
    Receta _recetaPolloAlOreganato_1 = this.getRecetaPolloAlOreganato();
    String _nombre_2 = this.pablo.getNombre();
    _recetaPolloAlOreganato_1.setCreador(_nombre_2);
    Set<Receta> _recetasFavoritas = this.nicolas.getRecetasFavoritas();
    Receta _recetaPolloAlOreganato_2 = this.getRecetaPolloAlOreganato();
    _recetasFavoritas.add(_recetaPolloAlOreganato_2);
  }
  
  @Pure
  public Usuario getEri() {
    return this.eri;
  }
  
  public void setEri(final Usuario eri) {
    this.eri = eri;
  }
  
  @Pure
  public Usuario getLeandro() {
    return this.leandro;
  }
  
  public void setLeandro(final Usuario leandro) {
    this.leandro = leandro;
  }
  
  @Pure
  public Usuario getDiego() {
    return this.diego;
  }
  
  public void setDiego(final Usuario diego) {
    this.diego = diego;
  }
  
  @Pure
  public Usuario getNicolas() {
    return this.nicolas;
  }
  
  public void setNicolas(final Usuario nicolas) {
    this.nicolas = nicolas;
  }
  
  @Pure
  public Usuario getPablo() {
    return this.pablo;
  }
  
  public void setPablo(final Usuario pablo) {
    this.pablo = pablo;
  }
}
