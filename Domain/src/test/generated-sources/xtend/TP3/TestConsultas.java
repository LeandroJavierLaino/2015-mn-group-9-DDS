package TP3;

import cosasUsuario.Usuario;
import filtro.FiltroPorExcesoDeCalorias;
import filtro.FiltroPorGusto;
import java.util.HashSet;
import java.util.Set;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre;
import receta.Receta;
import testeo.UsuariosExtras;

@SuppressWarnings("all")
public class TestConsultas extends UsuariosExtras {
  private FiltroPorGusto filtroGusto;
  
  private FiltroPorExcesoDeCalorias filtroExceso;
  
  private Set<Receta> recetasFiltradas = new HashSet<Receta>();
  
  @Before
  public void init() {
    super.init();
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
  }
  
  @Test
  public void NicolasConsultaRecetas() {
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
    int _size = this.recetasFiltradas.size();
    Assert.assertEquals(3, _size);
  }
  
  @Test
  public void DiegoConsultaRecetas() {
    Usuario _diego = this.getDiego();
    Set<Receta> _recetasFavoritas = _diego.getRecetasFavoritas();
    Receta _recetaSalchiPapa = this.getRecetaSalchiPapa();
    _recetasFavoritas.add(_recetaSalchiPapa);
    Usuario _diego_1 = this.getDiego();
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    _diego_1.agregarReceta(_recetaParaCualquiera);
    Usuario _diego_2 = this.getDiego();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre = new ProcesamientoOrdenarlosPorNombre();
    _diego_2.setProcesamiento(_procesamientoOrdenarlosPorNombre);
    Usuario _diego_3 = this.getDiego();
    _diego_3.postProcesarRecetas();
    Usuario _diego_4 = this.getDiego();
    Set<Receta> _postProcesarRecetas = _diego_4.postProcesarRecetas();
    this.recetasFiltradas = _postProcesarRecetas;
    int _size = this.recetasFiltradas.size();
    Assert.assertEquals(2, _size);
  }
  
  @Test
  public void usuarioHipertensoValidoConRutinaSedentariaConsultaRecetas() {
    Usuario _usuarioHipertensoValidoConRutinaSedentaria = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Set<Receta> _recetasFavoritas = _usuarioHipertensoValidoConRutinaSedentaria.getRecetasFavoritas();
    Receta _recetaSalchiPapa = this.getRecetaSalchiPapa();
    _recetasFavoritas.add(_recetaSalchiPapa);
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_1 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Receta _recetaCaloriasBajoRango = this.getRecetaCaloriasBajoRango();
    _usuarioHipertensoValidoConRutinaSedentaria_1.agregarReceta(_recetaCaloriasBajoRango);
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_2 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    _usuarioHipertensoValidoConRutinaSedentaria_2.agregarReceta(_recetaParaCualquiera);
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_3 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    _usuarioHipertensoValidoConRutinaSedentaria_3.agregarReceta(_recetaAntiDiabetico);
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_4 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre = new ProcesamientoOrdenarlosPorNombre();
    _usuarioHipertensoValidoConRutinaSedentaria_4.setProcesamiento(_procesamientoOrdenarlosPorNombre);
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_5 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    _usuarioHipertensoValidoConRutinaSedentaria_5.postProcesarRecetas();
    Usuario _usuarioHipertensoValidoConRutinaSedentaria_6 = this.getUsuarioHipertensoValidoConRutinaSedentaria();
    Set<Receta> _postProcesarRecetas = _usuarioHipertensoValidoConRutinaSedentaria_6.postProcesarRecetas();
    this.recetasFiltradas = _postProcesarRecetas;
    int _size = this.recetasFiltradas.size();
    Assert.assertEquals(4, _size);
  }
  
  @Test
  public void usuariaHipertensaValidaConsultaRecetas() {
    Usuario _usuariaHipertensaValida = this.getUsuariaHipertensaValida();
    Set<Receta> _recetasFavoritas = _usuariaHipertensaValida.getRecetasFavoritas();
    Receta _recetaPolloAlOreganato = this.getRecetaPolloAlOreganato();
    _recetasFavoritas.add(_recetaPolloAlOreganato);
    Usuario _usuariaHipertensaValida_1 = this.getUsuariaHipertensaValida();
    Receta _recetaCaloriasBajoRango = this.getRecetaCaloriasBajoRango();
    _usuariaHipertensaValida_1.agregarReceta(_recetaCaloriasBajoRango);
    Usuario _usuariaHipertensaValida_2 = this.getUsuariaHipertensaValida();
    Receta _recetaParaCualquiera = this.getRecetaParaCualquiera();
    _usuariaHipertensaValida_2.agregarReceta(_recetaParaCualquiera);
    Usuario _usuariaHipertensaValida_3 = this.getUsuariaHipertensaValida();
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    _usuariaHipertensaValida_3.agregarReceta(_recetaAntiDiabetico);
    Usuario _usuariaHipertensaValida_4 = this.getUsuariaHipertensaValida();
    ProcesamientoOrdenarlosPorNombre _procesamientoOrdenarlosPorNombre = new ProcesamientoOrdenarlosPorNombre();
    _usuariaHipertensaValida_4.setProcesamiento(_procesamientoOrdenarlosPorNombre);
    Usuario _usuariaHipertensaValida_5 = this.getUsuariaHipertensaValida();
    _usuariaHipertensaValida_5.postProcesarRecetas();
    Usuario _usuariaHipertensaValida_6 = this.getUsuariaHipertensaValida();
    Set<Receta> _postProcesarRecetas = _usuariaHipertensaValida_6.postProcesarRecetas();
    this.recetasFiltradas = _postProcesarRecetas;
    int _size = this.recetasFiltradas.size();
    Assert.assertEquals(4, _size);
  }
}
