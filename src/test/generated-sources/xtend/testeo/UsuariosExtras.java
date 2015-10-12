package testeo;

import ar.edu.domain.condicion.CondicionCeliaco;
import ar.edu.domain.condicion.CondicionDiabetico;
import ar.edu.domain.condicion.CondicionHipertenso;
import ar.edu.domain.condicion.CondicionVegano;
import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.rutina.RutinaActiva;
import ar.edu.domain.rutina.RutinaSedentaria;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;
import org.junit.Before;
import testeo.UsuariosPrincipales;

@Accessors
@SuppressWarnings("all")
public class UsuariosExtras extends UsuariosPrincipales {
  private Usuario usuarioSinSexo;
  
  private Usuario usuarioSinDatos;
  
  private Usuario usuarioNombreCortoEIMCMayorA30;
  
  private Usuario usuarioSinAltura;
  
  private Usuario usuarioSinPeso;
  
  private Usuario usuarioFechaFuturaEIMCMenorA18;
  
  private Usuario usuarioSinRutina;
  
  private Usuario usuarioVeganoLeGustaPolloYNoLaFruta;
  
  private Usuario usuarioVeganoValidoYLeGustaLaFruta;
  
  private Usuario usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio;
  
  private Usuario usuarioHipertensoValidoConRutinaActivaYSinEjercicio;
  
  private Usuario usuarioHipertensoValidoConRutinaSedentaria;
  
  private Usuario usuariaHipertensaValida;
  
  private Usuario usuarioDiabeticoSinSexoMasDe70KgYActivo;
  
  private Usuario usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo;
  
  private Usuario usuarioDiabeticoValidoMasDe70KgYSedentario;
  
  private Usuario usuarioDiabeticoValidoMenosDe70KgYSedentario;
  
  private Usuario usuarioCeliacoValido;
  
  @Before
  public void init() {
    super.init();
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Manu");
        it.setSexo("");
        LocalDate _localDate = new LocalDate(1980, 11, 12);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.76);
        it.setPeso(70);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.usuarioSinSexo = _doubleArrow;
    Usuario _usuario_1 = new Usuario();
    final Procedure1<Usuario> _function_1 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setSexo("M");
      }
    };
    Usuario _doubleArrow_1 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_1, _function_1);
    this.usuarioSinDatos = _doubleArrow_1;
    Usuario _usuario_2 = new Usuario();
    final Procedure1<Usuario> _function_2 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("ari");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(1991, 10, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.45);
        it.setPeso(197);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
      }
    };
    Usuario _doubleArrow_2 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_2, _function_2);
    this.usuarioNombreCortoEIMCMayorA30 = _doubleArrow_2;
    Usuario _usuario_3 = new Usuario();
    final Procedure1<Usuario> _function_3 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("juanse");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2001, 10, 10);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(0);
        it.setPeso(99);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
      }
    };
    Usuario _doubleArrow_3 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_3, _function_3);
    this.usuarioSinAltura = _doubleArrow_3;
    Usuario _usuario_4 = new Usuario();
    final Procedure1<Usuario> _function_4 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Marta");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2021, 11, 10);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(0);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
      }
    };
    Usuario _doubleArrow_4 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_4, _function_4);
    this.usuarioSinPeso = _doubleArrow_4;
    Usuario _usuario_5 = new Usuario();
    final Procedure1<Usuario> _function_5 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Florencia");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2090, 11, 10);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(2.10);
        it.setPeso(40);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
      }
    };
    Usuario _doubleArrow_5 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_5, _function_5);
    this.usuarioFechaFuturaEIMCMenorA18 = _doubleArrow_5;
    Usuario _usuario_6 = new Usuario();
    final Procedure1<Usuario> _function_6 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Paula");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2090, 5, 23);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
      }
    };
    Usuario _doubleArrow_6 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_6, _function_6);
    this.usuarioSinRutina = _doubleArrow_6;
    Usuario _usuario_7 = new Usuario();
    final Procedure1<Usuario> _function_7 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("VeganoUno");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2021, 11, 04);
        it.setFechaDeNacimiento(_localDate);
        it.setPeso(67);
        it.setAltura(1.71);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Pollo");
        CondicionVegano _vegano = UsuariosExtras.this.getVegano();
        it.agregarCondicion(_vegano);
      }
    };
    Usuario _doubleArrow_7 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_7, _function_7);
    this.usuarioVeganoLeGustaPolloYNoLaFruta = _doubleArrow_7;
    Usuario _usuario_8 = new Usuario();
    final Procedure1<Usuario> _function_8 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("VeganoDos");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Fruta");
        CondicionVegano _vegano = UsuariosExtras.this.getVegano();
        it.agregarCondicion(_vegano);
      }
    };
    Usuario _doubleArrow_8 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_8, _function_8);
    this.usuarioVeganoValidoYLeGustaLaFruta = _doubleArrow_8;
    Usuario _usuario_9 = new Usuario();
    final Procedure1<Usuario> _function_9 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("HipertensoUno");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaActiva _rutinaActivaLarga = UsuariosExtras.this.getRutinaActivaLarga();
        it.setRutina(_rutinaActivaLarga);
        CondicionHipertenso _hipertenso = UsuariosExtras.this.getHipertenso();
        it.agregarCondicion(_hipertenso);
      }
    };
    Usuario _doubleArrow_9 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_9, _function_9);
    this.usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = _doubleArrow_9;
    Usuario _usuario_10 = new Usuario();
    final Procedure1<Usuario> _function_10 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("HipertensoDos");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Carne");
        CondicionHipertenso _hipertenso = UsuariosExtras.this.getHipertenso();
        it.agregarCondicion(_hipertenso);
      }
    };
    Usuario _doubleArrow_10 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_10, _function_10);
    this.usuarioHipertensoValidoConRutinaActivaYSinEjercicio = _doubleArrow_10;
    Usuario _usuario_11 = new Usuario();
    final Procedure1<Usuario> _function_11 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("HipertensoTres");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaSedentaria _rutinaSedentaria = UsuariosExtras.this.getRutinaSedentaria();
        it.setRutina(_rutinaSedentaria);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Pollo");
        CondicionHipertenso _hipertenso = UsuariosExtras.this.getHipertenso();
        it.agregarCondicion(_hipertenso);
      }
    };
    Usuario _doubleArrow_11 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_11, _function_11);
    this.usuarioHipertensoValidoConRutinaSedentaria = _doubleArrow_11;
    Usuario _usuario_12 = new Usuario();
    final Procedure1<Usuario> _function_12 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("HipertensaCuatro");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaSedentaria _rutinaSedentaria = UsuariosExtras.this.getRutinaSedentaria();
        it.setRutina(_rutinaSedentaria);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Pollo");
        CondicionHipertenso _hipertenso = UsuariosExtras.this.getHipertenso();
        it.agregarCondicion(_hipertenso);
      }
    };
    Usuario _doubleArrow_12 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_12, _function_12);
    this.usuariaHipertensaValida = _doubleArrow_12;
    Usuario _usuario_13 = new Usuario();
    final Procedure1<Usuario> _function_13 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("DiabeticoUno");
        it.setSexo("");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(80);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Carne");
        CondicionDiabetico _diabetico = UsuariosExtras.this.getDiabetico();
        it.agregarCondicion(_diabetico);
      }
    };
    Usuario _doubleArrow_13 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_13, _function_13);
    this.usuarioDiabeticoSinSexoMasDe70KgYActivo = _doubleArrow_13;
    Usuario _usuario_14 = new Usuario();
    final Procedure1<Usuario> _function_14 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("DiabeticoDos");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(67);
        RutinaActiva _rutinaActivaLarga = UsuariosExtras.this.getRutinaActivaLarga();
        it.setRutina(_rutinaActivaLarga);
        CondicionDiabetico _diabetico = UsuariosExtras.this.getDiabetico();
        it.agregarCondicion(_diabetico);
      }
    };
    Usuario _doubleArrow_14 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_14, _function_14);
    this.usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo = _doubleArrow_14;
    Usuario _usuario_15 = new Usuario();
    final Procedure1<Usuario> _function_15 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("DiabeticoTres");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(78);
        RutinaSedentaria _rutinaSedentaria = UsuariosExtras.this.getRutinaSedentaria();
        it.setRutina(_rutinaSedentaria);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Pollo");
        CondicionDiabetico _diabetico = UsuariosExtras.this.getDiabetico();
        it.agregarCondicion(_diabetico);
      }
    };
    Usuario _doubleArrow_15 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_15, _function_15);
    this.usuarioDiabeticoValidoMasDe70KgYSedentario = _doubleArrow_15;
    Usuario _usuario_16 = new Usuario();
    final Procedure1<Usuario> _function_16 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("DiabeticoCuatro");
        it.setSexo("M");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(65);
        RutinaSedentaria _rutinaSedentaria = UsuariosExtras.this.getRutinaSedentaria();
        it.setRutina(_rutinaSedentaria);
        ArrayList<String> _arrayList = new ArrayList<String>();
        it.setComidaPreferida(_arrayList);
        List<String> _comidaPreferida = it.getComidaPreferida();
        _comidaPreferida.add("Fruta");
        CondicionDiabetico _diabetico = UsuariosExtras.this.getDiabetico();
        it.agregarCondicion(_diabetico);
      }
    };
    Usuario _doubleArrow_16 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_16, _function_16);
    this.usuarioDiabeticoValidoMenosDe70KgYSedentario = _doubleArrow_16;
    Usuario _usuario_17 = new Usuario();
    final Procedure1<Usuario> _function_17 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Celiaco");
        it.setSexo("F");
        LocalDate _localDate = new LocalDate(2000, 11, 20);
        it.setFechaDeNacimiento(_localDate);
        it.setAltura(1.70);
        it.setPeso(78);
        RutinaActiva _rutinaActivaCorta = UsuariosExtras.this.getRutinaActivaCorta();
        it.setRutina(_rutinaActivaCorta);
        CondicionCeliaco _celiaco = UsuariosExtras.this.getCeliaco();
        it.agregarCondicion(_celiaco);
      }
    };
    Usuario _doubleArrow_17 = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_17, _function_17);
    this.usuarioCeliacoValido = _doubleArrow_17;
    super.init();
  }
  
  @Pure
  public Usuario getUsuarioSinSexo() {
    return this.usuarioSinSexo;
  }
  
  public void setUsuarioSinSexo(final Usuario usuarioSinSexo) {
    this.usuarioSinSexo = usuarioSinSexo;
  }
  
  @Pure
  public Usuario getUsuarioSinDatos() {
    return this.usuarioSinDatos;
  }
  
  public void setUsuarioSinDatos(final Usuario usuarioSinDatos) {
    this.usuarioSinDatos = usuarioSinDatos;
  }
  
  @Pure
  public Usuario getUsuarioNombreCortoEIMCMayorA30() {
    return this.usuarioNombreCortoEIMCMayorA30;
  }
  
  public void setUsuarioNombreCortoEIMCMayorA30(final Usuario usuarioNombreCortoEIMCMayorA30) {
    this.usuarioNombreCortoEIMCMayorA30 = usuarioNombreCortoEIMCMayorA30;
  }
  
  @Pure
  public Usuario getUsuarioSinAltura() {
    return this.usuarioSinAltura;
  }
  
  public void setUsuarioSinAltura(final Usuario usuarioSinAltura) {
    this.usuarioSinAltura = usuarioSinAltura;
  }
  
  @Pure
  public Usuario getUsuarioSinPeso() {
    return this.usuarioSinPeso;
  }
  
  public void setUsuarioSinPeso(final Usuario usuarioSinPeso) {
    this.usuarioSinPeso = usuarioSinPeso;
  }
  
  @Pure
  public Usuario getUsuarioFechaFuturaEIMCMenorA18() {
    return this.usuarioFechaFuturaEIMCMenorA18;
  }
  
  public void setUsuarioFechaFuturaEIMCMenorA18(final Usuario usuarioFechaFuturaEIMCMenorA18) {
    this.usuarioFechaFuturaEIMCMenorA18 = usuarioFechaFuturaEIMCMenorA18;
  }
  
  @Pure
  public Usuario getUsuarioSinRutina() {
    return this.usuarioSinRutina;
  }
  
  public void setUsuarioSinRutina(final Usuario usuarioSinRutina) {
    this.usuarioSinRutina = usuarioSinRutina;
  }
  
  @Pure
  public Usuario getUsuarioVeganoLeGustaPolloYNoLaFruta() {
    return this.usuarioVeganoLeGustaPolloYNoLaFruta;
  }
  
  public void setUsuarioVeganoLeGustaPolloYNoLaFruta(final Usuario usuarioVeganoLeGustaPolloYNoLaFruta) {
    this.usuarioVeganoLeGustaPolloYNoLaFruta = usuarioVeganoLeGustaPolloYNoLaFruta;
  }
  
  @Pure
  public Usuario getUsuarioVeganoValidoYLeGustaLaFruta() {
    return this.usuarioVeganoValidoYLeGustaLaFruta;
  }
  
  public void setUsuarioVeganoValidoYLeGustaLaFruta(final Usuario usuarioVeganoValidoYLeGustaLaFruta) {
    this.usuarioVeganoValidoYLeGustaLaFruta = usuarioVeganoValidoYLeGustaLaFruta;
  }
  
  @Pure
  public Usuario getUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio() {
    return this.usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio;
  }
  
  public void setUsuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio(final Usuario usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio) {
    this.usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio = usuarioHipertensoSinPreferenciasYRutinaActivaConEjercicio;
  }
  
  @Pure
  public Usuario getUsuarioHipertensoValidoConRutinaActivaYSinEjercicio() {
    return this.usuarioHipertensoValidoConRutinaActivaYSinEjercicio;
  }
  
  public void setUsuarioHipertensoValidoConRutinaActivaYSinEjercicio(final Usuario usuarioHipertensoValidoConRutinaActivaYSinEjercicio) {
    this.usuarioHipertensoValidoConRutinaActivaYSinEjercicio = usuarioHipertensoValidoConRutinaActivaYSinEjercicio;
  }
  
  @Pure
  public Usuario getUsuarioHipertensoValidoConRutinaSedentaria() {
    return this.usuarioHipertensoValidoConRutinaSedentaria;
  }
  
  public void setUsuarioHipertensoValidoConRutinaSedentaria(final Usuario usuarioHipertensoValidoConRutinaSedentaria) {
    this.usuarioHipertensoValidoConRutinaSedentaria = usuarioHipertensoValidoConRutinaSedentaria;
  }
  
  @Pure
  public Usuario getUsuariaHipertensaValida() {
    return this.usuariaHipertensaValida;
  }
  
  public void setUsuariaHipertensaValida(final Usuario usuariaHipertensaValida) {
    this.usuariaHipertensaValida = usuariaHipertensaValida;
  }
  
  @Pure
  public Usuario getUsuarioDiabeticoSinSexoMasDe70KgYActivo() {
    return this.usuarioDiabeticoSinSexoMasDe70KgYActivo;
  }
  
  public void setUsuarioDiabeticoSinSexoMasDe70KgYActivo(final Usuario usuarioDiabeticoSinSexoMasDe70KgYActivo) {
    this.usuarioDiabeticoSinSexoMasDe70KgYActivo = usuarioDiabeticoSinSexoMasDe70KgYActivo;
  }
  
  @Pure
  public Usuario getUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo() {
    return this.usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo;
  }
  
  public void setUsuarioDiabeticoSinPreferenciaMenosDe70KgYActivo(final Usuario usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo) {
    this.usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo = usuarioDiabeticoSinPreferenciaMenosDe70KgYActivo;
  }
  
  @Pure
  public Usuario getUsuarioDiabeticoValidoMasDe70KgYSedentario() {
    return this.usuarioDiabeticoValidoMasDe70KgYSedentario;
  }
  
  public void setUsuarioDiabeticoValidoMasDe70KgYSedentario(final Usuario usuarioDiabeticoValidoMasDe70KgYSedentario) {
    this.usuarioDiabeticoValidoMasDe70KgYSedentario = usuarioDiabeticoValidoMasDe70KgYSedentario;
  }
  
  @Pure
  public Usuario getUsuarioDiabeticoValidoMenosDe70KgYSedentario() {
    return this.usuarioDiabeticoValidoMenosDe70KgYSedentario;
  }
  
  public void setUsuarioDiabeticoValidoMenosDe70KgYSedentario(final Usuario usuarioDiabeticoValidoMenosDe70KgYSedentario) {
    this.usuarioDiabeticoValidoMenosDe70KgYSedentario = usuarioDiabeticoValidoMenosDe70KgYSedentario;
  }
  
  @Pure
  public Usuario getUsuarioCeliacoValido() {
    return this.usuarioCeliacoValido;
  }
  
  public void setUsuarioCeliacoValido(final Usuario usuarioCeliacoValido) {
    this.usuarioCeliacoValido = usuarioCeliacoValido;
  }
}
