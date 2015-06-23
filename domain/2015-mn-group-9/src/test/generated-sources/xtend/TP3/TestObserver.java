package TP3;

import consulta.GestorDeConsultas;
import consulta.Monitor;
import consulta.MonitorHora;
import consulta.MonitorRecetas;
import consulta.MonitorRecetasF;
import consulta.MonitorRecetasM;
import consulta.MonitorVegano;
import cosasUsuario.Usuario;
import filtro.Filtro;
import filtro.FiltroPorExcesoDeCalorias;
import filtro.FiltroPorGusto;
import java.util.List;
import java.util.Set;
import org.joda.time.DateTime;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre;
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares;
import receta.Receta;
import testeo.UsuariosExtras;

@SuppressWarnings("all")
public class TestObserver extends UsuariosExtras {
  private FiltroPorGusto filtroGusto;
  
  private FiltroPorExcesoDeCalorias filtroExceso;
  
  private MonitorHora monitorHora;
  
  private MonitorRecetas monitorReceta;
  
  private MonitorRecetasM monitorRecetasHombre;
  
  private MonitorRecetasF monitorRecetasMujer;
  
  private MonitorVegano monitorVegano;
  
  private DateTime time;
  
  private int hora;
  
  @Before
  public void init() {
    super.init();
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    MonitorHora _monitorHora = new MonitorHora();
    this.monitorHora = _monitorHora;
    MonitorRecetas _monitorRecetas = new MonitorRecetas();
    this.monitorReceta = _monitorRecetas;
    MonitorRecetasM _monitorRecetasM = new MonitorRecetasM();
    this.monitorRecetasHombre = _monitorRecetasM;
    MonitorRecetasF _monitorRecetasF = new MonitorRecetasF();
    this.monitorRecetasMujer = _monitorRecetasF;
    MonitorVegano _monitorVegano = new MonitorVegano();
    this.monitorVegano = _monitorVegano;
    DateTime _dateTime = new DateTime();
    this.time = _dateTime;
    int _hourOfDay = this.time.getHourOfDay();
    this.hora = _hourOfDay;
    GestorDeConsultas _instance = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores = _instance.getMonitores();
    _monitores.add(this.monitorHora);
    GestorDeConsultas _instance_1 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_1 = _instance_1.getMonitores();
    _monitores_1.add(this.monitorReceta);
    GestorDeConsultas _instance_2 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_2 = _instance_2.getMonitores();
    _monitores_2.add(this.monitorRecetasHombre);
    GestorDeConsultas _instance_3 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_3 = _instance_3.getMonitores();
    _monitores_3.add(this.monitorRecetasMujer);
    GestorDeConsultas _instance_4 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_4 = _instance_4.getMonitores();
    _monitores_4.add(this.monitorVegano);
    Usuario _leandro = this.getLeandro();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre = new ProcesamientoOrdenarlosPorNombre();
    _leandro.setProcesamiento(_procesamientoOrdenarlosPorNombre);
    Usuario _leandro_1 = this.getLeandro();
    Set<Receta> _recetas = _leandro_1.getRecetas();
    Receta _recetaSalchiPapa = this.getRecetaSalchiPapa();
    _recetas.add(_recetaSalchiPapa);
    Usuario _leandro_2 = this.getLeandro();
    List<Filtro> _filtrosAAplicar = _leandro_2.getFiltrosAAplicar();
    _filtrosAAplicar.add(this.filtroGusto);
    Usuario _leandro_3 = this.getLeandro();
    Set<Receta> _recetasFavoritas = _leandro_3.getRecetasFavoritas();
    Receta _recetaSalchiPapa_1 = this.getRecetaSalchiPapa();
    _recetasFavoritas.add(_recetaSalchiPapa_1);
    Usuario _leandro_4 = this.getLeandro();
    _leandro_4.postProcesarRecetas();
    Usuario _pablo = this.getPablo();
    ProcesamientoParaTomarResultadosPares _procesamientoParaTomarResultadosPares = new ProcesamientoParaTomarResultadosPares();
    _pablo.setProcesamiento(_procesamientoParaTomarResultadosPares);
    Usuario _pablo_1 = this.getPablo();
    List<Filtro> _filtrosAAplicar_1 = _pablo_1.getFiltrosAAplicar();
    _filtrosAAplicar_1.add(this.filtroGusto);
    Usuario _pablo_2 = this.getPablo();
    _pablo_2.postProcesarRecetas();
    Usuario _eri = this.getEri();
    ProcesamientoParaTomarResultadosPares _procesamientoParaTomarResultadosPares_1 = new ProcesamientoParaTomarResultadosPares();
    _eri.setProcesamiento(_procesamientoParaTomarResultadosPares_1);
    Usuario _eri_1 = this.getEri();
    List<Filtro> _filtrosAAplicar_2 = _eri_1.getFiltrosAAplicar();
    _filtrosAAplicar_2.add(this.filtroGusto);
    Usuario _eri_2 = this.getEri();
    Set<Receta> _recetasFavoritas_1 = _eri_2.getRecetasFavoritas();
    Receta _recetaPolloAlOreganato = this.getRecetaPolloAlOreganato();
    _recetasFavoritas_1.add(_recetaPolloAlOreganato);
    Usuario _eri_3 = this.getEri();
    _eri_3.postProcesarRecetas();
    Usuario _usuarioVeganoValidoYLeGustaLaFruta = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre_1 = new ProcesamientoOrdenarlosPorNombre();
    _usuarioVeganoValidoYLeGustaLaFruta.setProcesamiento(_procesamientoOrdenarlosPorNombre_1);
    Usuario _usuarioVeganoValidoYLeGustaLaFruta_1 = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    Set<Receta> _recetasFavoritas_2 = _usuarioVeganoValidoYLeGustaLaFruta_1.getRecetasFavoritas();
    Receta _recetaLaComidaMasOrganicaDelMundo = this.getRecetaLaComidaMasOrganicaDelMundo();
    _recetasFavoritas_2.add(_recetaLaComidaMasOrganicaDelMundo);
    Usuario _usuarioVeganoValidoYLeGustaLaFruta_2 = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    _usuarioVeganoValidoYLeGustaLaFruta_2.postProcesarRecetas();
  }
  
  @Test
  public void verHorasMasConsultadas() {
    String _string = Integer.valueOf(this.hora).toString();
    String _mostrarResultados = this.monitorHora.mostrarResultados();
    Assert.assertEquals(_string, _mostrarResultados);
  }
  
  @Test
  public void RecetasMasConsultadas() {
    String _mostrarResultados = this.monitorReceta.mostrarResultados();
    Assert.assertEquals("Ensalada", _mostrarResultados);
  }
  
  @Test
  public void recetasMasConsultadasPorHombres() {
    String _mostrarResultados = this.monitorRecetasHombre.mostrarResultados();
    Assert.assertEquals("SalchiPapa", _mostrarResultados);
  }
  
  @Test
  public void recetasMasConsultadasPorMujeres() {
    String _mostrarResultados = this.monitorRecetasMujer.mostrarResultados();
    Assert.assertEquals("Pollo al Oreganato", _mostrarResultados);
  }
  
  @Test
  public void contadorDeVeganos() {
    String _mostrarResultados = this.monitorVegano.mostrarResultados();
    Assert.assertEquals("1", _mostrarResultados);
  }
}
