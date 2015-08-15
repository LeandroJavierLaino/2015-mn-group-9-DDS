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
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.DateTime;
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre;
import procesamientoPosterior.ProcesamientoParaTomarResultadosPares;
import receta.Receta;
import testeo.UsuariosExtras;

@Accessors
@SuppressWarnings("all")
public class IntanciacionTP3Consultas extends UsuariosExtras {
  private FiltroPorGusto filtroGusto;
  
  private FiltroPorExcesoDeCalorias filtroExceso;
  
  private Set<Receta> recetasFiltradas = new HashSet<Receta>();
  
  private MonitorHora monitor1;
  
  private MonitorRecetas monitor2;
  
  private MonitorRecetasM monitorRecetasHombre;
  
  private MonitorRecetasF monitorRecetasMujer;
  
  private MonitorVegano monitorVegano;
  
  private DateTime time;
  
  private int hora;
  
  public void init() {
    super.init();
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    MonitorHora _monitorHora = new MonitorHora();
    this.monitor1 = _monitorHora;
    MonitorRecetas _monitorRecetas = new MonitorRecetas();
    this.monitor2 = _monitorRecetas;
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
    _monitores.add(this.monitor1);
    GestorDeConsultas _instance_1 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_1 = _instance_1.getMonitores();
    _monitores_1.add(this.monitor2);
    GestorDeConsultas _instance_2 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_2 = _instance_2.getMonitores();
    _monitores_2.add(this.monitorRecetasHombre);
    GestorDeConsultas _instance_3 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_3 = _instance_3.getMonitores();
    _monitores_3.add(this.monitorRecetasMujer);
    GestorDeConsultas _instance_4 = GestorDeConsultas.getInstance();
    Set<Monitor> _monitores_4 = _instance_4.getMonitores();
    _monitores_4.add(this.monitorVegano);
    Usuario _nicolas = this.getNicolas();
    Set<Receta> _recetasFavoritas = _nicolas.getRecetasFavoritas();
    Receta _recetaSalchiPapa = this.getRecetaSalchiPapa();
    _recetasFavoritas.add(_recetaSalchiPapa);
    Usuario _nicolas_1 = this.getNicolas();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    _nicolas_1.agregarReceta(_recetaAntiVegano);
    Usuario _nicolas_2 = this.getNicolas();
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    _nicolas_2.agregarReceta(_recetaAntiDiabetico);
    Usuario _nicolas_3 = this.getNicolas();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre = new ProcesamientoOrdenarlosPorNombre();
    _nicolas_3.setProcesamiento(_procesamientoOrdenarlosPorNombre);
    Usuario _nicolas_4 = this.getNicolas();
    _nicolas_4.postProcesarRecetas();
    Usuario _nicolas_5 = this.getNicolas();
    Set<Receta> _postProcesarRecetas = _nicolas_5.postProcesarRecetas();
    this.recetasFiltradas = _postProcesarRecetas;
    Usuario _leandro = this.getLeandro();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre_1 = new ProcesamientoOrdenarlosPorNombre();
    _leandro.setProcesamiento(_procesamientoOrdenarlosPorNombre_1);
    Usuario _leandro_1 = this.getLeandro();
    Set<Receta> _recetas = _leandro_1.getRecetas();
    Receta _recetaSalchiPapa_1 = this.getRecetaSalchiPapa();
    _recetas.add(_recetaSalchiPapa_1);
    Usuario _leandro_2 = this.getLeandro();
    List<Filtro> _filtrosAAplicar = _leandro_2.getFiltrosAAplicar();
    _filtrosAAplicar.add(this.filtroGusto);
    Usuario _leandro_3 = this.getLeandro();
    Set<Receta> _recetasFavoritas_1 = _leandro_3.getRecetasFavoritas();
    Receta _recetaSalchiPapa_2 = this.getRecetaSalchiPapa();
    _recetasFavoritas_1.add(_recetaSalchiPapa_2);
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
    Usuario _diego = this.getDiego();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre_2 = new ProcesamientoOrdenarlosPorNombre();
    _diego.setProcesamiento(_procesamientoOrdenarlosPorNombre_2);
    Usuario _diego_1 = this.getDiego();
    Set<Receta> _recetasFavoritas_2 = _diego_1.getRecetasFavoritas();
    Receta _recetaSalchiPapa_3 = this.getRecetaSalchiPapa();
    _recetasFavoritas_2.add(_recetaSalchiPapa_3);
    Usuario _eri = this.getEri();
    ProcesamientoParaTomarResultadosPares _procesamientoParaTomarResultadosPares_1 = new ProcesamientoParaTomarResultadosPares();
    _eri.setProcesamiento(_procesamientoParaTomarResultadosPares_1);
    Usuario _eri_1 = this.getEri();
    List<Filtro> _filtrosAAplicar_2 = _eri_1.getFiltrosAAplicar();
    _filtrosAAplicar_2.add(this.filtroGusto);
    Usuario _eri_2 = this.getEri();
    Set<Receta> _recetasFavoritas_3 = _eri_2.getRecetasFavoritas();
    Receta _recetaPolloAlOreganato = this.getRecetaPolloAlOreganato();
    _recetasFavoritas_3.add(_recetaPolloAlOreganato);
    Usuario _eri_3 = this.getEri();
    _eri_3.postProcesarRecetas();
    Usuario _usuarioVeganoValidoYLeGustaLaFruta = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre_3 = new ProcesamientoOrdenarlosPorNombre();
    _usuarioVeganoValidoYLeGustaLaFruta.setProcesamiento(_procesamientoOrdenarlosPorNombre_3);
    Usuario _usuarioVeganoValidoYLeGustaLaFruta_1 = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    Set<Receta> _recetasFavoritas_4 = _usuarioVeganoValidoYLeGustaLaFruta_1.getRecetasFavoritas();
    Receta _recetaLaComidaMasOrganicaDelMundo = this.getRecetaLaComidaMasOrganicaDelMundo();
    _recetasFavoritas_4.add(_recetaLaComidaMasOrganicaDelMundo);
    Usuario _usuarioVeganoValidoYLeGustaLaFruta_2 = this.getUsuarioVeganoValidoYLeGustaLaFruta();
    _usuarioVeganoValidoYLeGustaLaFruta_2.postProcesarRecetas();
  }
  
  @Pure
  public FiltroPorGusto getFiltroGusto() {
    return this.filtroGusto;
  }
  
  public void setFiltroGusto(final FiltroPorGusto filtroGusto) {
    this.filtroGusto = filtroGusto;
  }
  
  @Pure
  public FiltroPorExcesoDeCalorias getFiltroExceso() {
    return this.filtroExceso;
  }
  
  public void setFiltroExceso(final FiltroPorExcesoDeCalorias filtroExceso) {
    this.filtroExceso = filtroExceso;
  }
  
  @Pure
  public Set<Receta> getRecetasFiltradas() {
    return this.recetasFiltradas;
  }
  
  public void setRecetasFiltradas(final Set<Receta> recetasFiltradas) {
    this.recetasFiltradas = recetasFiltradas;
  }
  
  @Pure
  public MonitorHora getMonitor1() {
    return this.monitor1;
  }
  
  public void setMonitor1(final MonitorHora monitor1) {
    this.monitor1 = monitor1;
  }
  
  @Pure
  public MonitorRecetas getMonitor2() {
    return this.monitor2;
  }
  
  public void setMonitor2(final MonitorRecetas monitor2) {
    this.monitor2 = monitor2;
  }
  
  @Pure
  public MonitorRecetasM getMonitorRecetasHombre() {
    return this.monitorRecetasHombre;
  }
  
  public void setMonitorRecetasHombre(final MonitorRecetasM monitorRecetasHombre) {
    this.monitorRecetasHombre = monitorRecetasHombre;
  }
  
  @Pure
  public MonitorRecetasF getMonitorRecetasMujer() {
    return this.monitorRecetasMujer;
  }
  
  public void setMonitorRecetasMujer(final MonitorRecetasF monitorRecetasMujer) {
    this.monitorRecetasMujer = monitorRecetasMujer;
  }
  
  @Pure
  public MonitorVegano getMonitorVegano() {
    return this.monitorVegano;
  }
  
  public void setMonitorVegano(final MonitorVegano monitorVegano) {
    this.monitorVegano = monitorVegano;
  }
  
  @Pure
  public DateTime getTime() {
    return this.time;
  }
  
  public void setTime(final DateTime time) {
    this.time = time;
  }
  
  @Pure
  public int getHora() {
    return this.hora;
  }
  
  public void setHora(final int hora) {
    this.hora = hora;
  }
}
