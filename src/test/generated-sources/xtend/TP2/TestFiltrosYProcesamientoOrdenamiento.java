package TP2;

import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.filtro.Filtro;
import ar.edu.domain.filtro.FiltroPorExcesoDeCalorias;
import ar.edu.domain.filtro.FiltroPorGusto;
import ar.edu.domain.procesamientoPosterior.ProcesamientoParaTomarLosPrimerosN;
import ar.edu.domain.receta.Caracteristica;
import ar.edu.domain.receta.Ingrediente;
import ar.edu.domain.receta.Receta;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.junit.Assert;
import org.junit.Test;
import testeo.UsuariosPrincipales;

@SuppressWarnings("all")
public class TestFiltrosYProcesamientoOrdenamiento extends UsuariosPrincipales {
  private FiltroPorGusto filtroGusto;
  
  private FiltroPorExcesoDeCalorias filtroExceso;
  
  private Set<Receta> recetasFiltradas = new HashSet<Receta>();
  
  @Test
  public void aplicarVariosFiltros() {
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    Usuario _diego = this.getDiego();
    List<Filtro> _filtrosAAplicar = _diego.getFiltrosAAplicar();
    _filtrosAAplicar.add(this.filtroGusto);
    Usuario _diego_1 = this.getDiego();
    List<Filtro> _filtrosAAplicar_1 = _diego_1.getFiltrosAAplicar();
    _filtrosAAplicar_1.add(this.filtroExceso);
    Usuario _diego_2 = this.getDiego();
    Set<Receta> _aplicarFiltros = _diego_2.aplicarFiltros();
    this.recetasFiltradas = _aplicarFiltros;
    Usuario _diego_3 = this.getDiego();
    Set<Receta> _recetas = _diego_3.getRecetas();
    Assert.assertArrayEquals(((Object[])Conversions.unwrapArray(_recetas, Object.class)), ((Object[])Conversions.unwrapArray(this.recetasFiltradas, Object.class)));
  }
  
  @Test
  public void aplicarFiltroUnico() {
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    Usuario _leandro = this.getLeandro();
    List<Caracteristica> _comidasQueDisgustan = _leandro.getComidasQueDisgustan();
    Ingrediente _chori = this.getChori();
    _comidasQueDisgustan.add(_chori);
    Usuario _leandro_1 = this.getLeandro();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    _leandro_1.agregarReceta(_recetaAntiVegano);
    Usuario _leandro_2 = this.getLeandro();
    _leandro_2.agregarFiltro(this.filtroGusto);
    Usuario _leandro_3 = this.getLeandro();
    Set<Receta> _aplicarFiltros = _leandro_3.aplicarFiltros();
    this.recetasFiltradas = _aplicarFiltros;
    Usuario _leandro_4 = this.getLeandro();
    Set<Receta> _recetas = _leandro_4.getRecetas();
    Assert.assertNotEquals(this.recetasFiltradas, _recetas);
  }
  
  @Test
  public void listarTrasFiltrarPorVariosFiltrosYPedirLosDiezPrimeros() {
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    Usuario _diego = this.getDiego();
    List<Filtro> _filtrosAAplicar = _diego.getFiltrosAAplicar();
    _filtrosAAplicar.add(this.filtroGusto);
    Usuario _diego_1 = this.getDiego();
    List<Filtro> _filtrosAAplicar_1 = _diego_1.getFiltrosAAplicar();
    _filtrosAAplicar_1.add(this.filtroExceso);
    Usuario _diego_2 = this.getDiego();
    Set<Receta> _recetasFavoritas = _diego_2.getRecetasFavoritas();
    Receta _recetaAntiDiabetico = this.getRecetaAntiDiabetico();
    _recetasFavoritas.add(_recetaAntiDiabetico);
    Usuario _diego_3 = this.getDiego();
    List<Caracteristica> _comidasQueDisgustan = _diego_3.getComidasQueDisgustan();
    Ingrediente _chori = this.getChori();
    _comidasQueDisgustan.add(_chori);
    Usuario _diego_4 = this.getDiego();
    ProcesamientoParaTomarLosPrimerosN _procesamientoParaTomarLosPrimerosN = new ProcesamientoParaTomarLosPrimerosN();
    _diego_4.setProcesamiento(_procesamientoParaTomarLosPrimerosN);
    Usuario _diego_5 = this.getDiego();
    Set<Receta> _postProcesarRecetas = _diego_5.postProcesarRecetas();
    this.recetasFiltradas = _postProcesarRecetas;
    int _size = this.recetasFiltradas.size();
    Assert.assertEquals(1, _size);
  }
}
