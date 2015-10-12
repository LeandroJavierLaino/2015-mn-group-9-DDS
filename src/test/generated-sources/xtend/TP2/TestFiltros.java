package TP2;

import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.filtro.Filtro;
import ar.edu.domain.filtro.FiltroPorExcesoDeCalorias;
import ar.edu.domain.filtro.FiltroPorGusto;
import ar.edu.domain.receta.Caracteristica;
import ar.edu.domain.receta.Ingrediente;
import ar.edu.domain.receta.Receta;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.Assert;
import org.junit.Test;
import testeo.UsuariosPrincipales;

@SuppressWarnings("all")
public class TestFiltros extends UsuariosPrincipales {
  private FiltroPorGusto filtroGusto;
  
  private FiltroPorExcesoDeCalorias filtroExceso;
  
  private Set<Receta> recetasFiltradas = new HashSet<Receta>();
  
  @Test
  public void aplicarVariosFiltros() {
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    Usuario _eri = this.getEri();
    List<Filtro> _filtrosAAplicar = _eri.getFiltrosAAplicar();
    _filtrosAAplicar.add(this.filtroGusto);
    Usuario _eri_1 = this.getEri();
    List<Filtro> _filtrosAAplicar_1 = _eri_1.getFiltrosAAplicar();
    _filtrosAAplicar_1.add(this.filtroExceso);
    Usuario _eri_2 = this.getEri();
    Set<Receta> _aplicarFiltros = _eri_2.aplicarFiltros();
    this.recetasFiltradas = _aplicarFiltros;
    Usuario _eri_3 = this.getEri();
    Set<Receta> _recetas = _eri_3.getRecetas();
    Assert.assertNotEquals(_recetas, this.recetasFiltradas);
  }
  
  @Test
  public void aplicarUnicoFiltroParaNicolas() {
    FiltroPorGusto _filtroPorGusto = new FiltroPorGusto();
    this.filtroGusto = _filtroPorGusto;
    Usuario _nicolas = this.getNicolas();
    List<Caracteristica> _comidasQueDisgustan = _nicolas.getComidasQueDisgustan();
    Ingrediente _chori = this.getChori();
    _comidasQueDisgustan.add(_chori);
    Usuario _nicolas_1 = this.getNicolas();
    Receta _recetaAntiVegano = this.getRecetaAntiVegano();
    _nicolas_1.agregarReceta(_recetaAntiVegano);
    Usuario _nicolas_2 = this.getNicolas();
    _nicolas_2.agregarFiltro(this.filtroGusto);
    Usuario _nicolas_3 = this.getNicolas();
    Set<Receta> _aplicarFiltros = _nicolas_3.aplicarFiltros();
    this.recetasFiltradas = _aplicarFiltros;
    Usuario _nicolas_4 = this.getNicolas();
    Set<Receta> _recetas = _nicolas_4.getRecetas();
    Assert.assertEquals(this.recetasFiltradas, _recetas);
  }
  
  @Test
  public void filtroPorExcesoDeCalorias() {
    FiltroPorExcesoDeCalorias _filtroPorExcesoDeCalorias = new FiltroPorExcesoDeCalorias();
    this.filtroExceso = _filtroPorExcesoDeCalorias;
    Usuario _nicolas = this.getNicolas();
    List<Caracteristica> _comidasQueDisgustan = _nicolas.getComidasQueDisgustan();
    Ingrediente _chori = this.getChori();
    _comidasQueDisgustan.add(_chori);
    Usuario _nicolas_1 = this.getNicolas();
    Receta _recetaCaloriasMayorRango = this.getRecetaCaloriasMayorRango();
    _nicolas_1.agregarReceta(_recetaCaloriasMayorRango);
    Usuario _nicolas_2 = this.getNicolas();
    _nicolas_2.agregarFiltro(this.filtroExceso);
    Usuario _nicolas_3 = this.getNicolas();
    Set<Receta> _aplicarFiltros = _nicolas_3.aplicarFiltros();
    this.recetasFiltradas = _aplicarFiltros;
    Usuario _nicolas_4 = this.getNicolas();
    Set<Receta> _recetas = _nicolas_4.getRecetas();
    Assert.assertEquals(this.recetasFiltradas, _recetas);
  }
}
