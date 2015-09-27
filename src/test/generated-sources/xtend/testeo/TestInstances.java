package testeo;

import condicion.CondicionCeliaco;
import condicion.CondicionDiabetico;
import condicion.CondicionHipertenso;
import condicion.CondicionVegano;
import cosasUsuario.GrupoUsuario;
import filtro.FiltroPorCondicionesPreexistentes;
import filtro.FiltroPorExcesoDeCalorias;
import filtro.FiltroPorGusto;
import filtro.FiltroPorSerCaros;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.junit.Before;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;
import repositorioRecetas.RepositorioRecetas;
import rutina.RutinaActiva;
import rutina.RutinaSedentaria;

@Accessors
@SuppressWarnings("all")
public class TestInstances {
  private Receta recetaAntiVegano;
  
  private Receta recetaAntiDiabetico;
  
  private Receta recetaParaCualquiera;
  
  private Receta recetaSinIngrediente;
  
  private Receta recetaCaloriasBajoRango;
  
  private Receta recetaCaloriasMayorRango;
  
  private Receta recetaSalchiPapa;
  
  private Receta recetaPolloAlOreganato;
  
  private Receta recetaLaComidaMasOrganicaDelMundo;
  
  private RutinaActiva rutinaActivaCorta;
  
  private RutinaActiva rutinaActivaLarga;
  
  private RutinaSedentaria rutinaSedentaria;
  
  private Condimento azucar;
  
  private Condimento caldo;
  
  private Condimento ajiMolido;
  
  private Condimento pimienta;
  
  private Ingrediente cuadril;
  
  private Ingrediente huevos;
  
  private Ingrediente cebollas;
  
  private Ingrediente chori;
  
  private Set<Ingrediente> ingredientesVacios = CollectionLiterals.<Ingrediente>emptySet();
  
  private CondicionCeliaco celiaco;
  
  private CondicionDiabetico diabetico;
  
  private CondicionHipertenso hipertenso;
  
  private CondicionVegano vegano;
  
  private Set<Condimento> condimentosParaCualquiera = new HashSet<Condimento>();
  
  private Set<Condimento> condimentosAntiDiabetico = new HashSet<Condimento>();
  
  private Set<Ingrediente> ingredientesParaCualquiera = new HashSet<Ingrediente>();
  
  private Set<Ingrediente> ingredientesAntiVegano = new HashSet<Ingrediente>();
  
  private List<String> preparacionDefault = new ArrayList<String>();
  
  private GrupoUsuario grupoDeLaMuerte;
  
  private GrupoUsuario grupoFlojito;
  
  private RepositorioRecetas repo = RepositorioRecetas.getInstance();
  
  private FiltroPorCondicionesPreexistentes filtroPorCondicionesPreexistentes;
  
  private FiltroPorExcesoDeCalorias filtroPorExcesoCalorias;
  
  private FiltroPorGusto filtroPorGusto;
  
  private FiltroPorSerCaros filtroPorCaros;
  
  private double delta = 0.0000000001;
  
  @Before
  public void init() {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The constructor Condimento() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Ingrediente() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Condimento() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Condimento() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Condimento() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Ingrediente() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Ingrediente() is not applicable for the arguments (String,int,String)"
      + "\nInvalid number of arguments. The constructor Ingrediente() is not applicable for the arguments (String,int,String)");
  }
  
  @Pure
  public Receta getRecetaAntiVegano() {
    return this.recetaAntiVegano;
  }
  
  public void setRecetaAntiVegano(final Receta recetaAntiVegano) {
    this.recetaAntiVegano = recetaAntiVegano;
  }
  
  @Pure
  public Receta getRecetaAntiDiabetico() {
    return this.recetaAntiDiabetico;
  }
  
  public void setRecetaAntiDiabetico(final Receta recetaAntiDiabetico) {
    this.recetaAntiDiabetico = recetaAntiDiabetico;
  }
  
  @Pure
  public Receta getRecetaParaCualquiera() {
    return this.recetaParaCualquiera;
  }
  
  public void setRecetaParaCualquiera(final Receta recetaParaCualquiera) {
    this.recetaParaCualquiera = recetaParaCualquiera;
  }
  
  @Pure
  public Receta getRecetaSinIngrediente() {
    return this.recetaSinIngrediente;
  }
  
  public void setRecetaSinIngrediente(final Receta recetaSinIngrediente) {
    this.recetaSinIngrediente = recetaSinIngrediente;
  }
  
  @Pure
  public Receta getRecetaCaloriasBajoRango() {
    return this.recetaCaloriasBajoRango;
  }
  
  public void setRecetaCaloriasBajoRango(final Receta recetaCaloriasBajoRango) {
    this.recetaCaloriasBajoRango = recetaCaloriasBajoRango;
  }
  
  @Pure
  public Receta getRecetaCaloriasMayorRango() {
    return this.recetaCaloriasMayorRango;
  }
  
  public void setRecetaCaloriasMayorRango(final Receta recetaCaloriasMayorRango) {
    this.recetaCaloriasMayorRango = recetaCaloriasMayorRango;
  }
  
  @Pure
  public Receta getRecetaSalchiPapa() {
    return this.recetaSalchiPapa;
  }
  
  public void setRecetaSalchiPapa(final Receta recetaSalchiPapa) {
    this.recetaSalchiPapa = recetaSalchiPapa;
  }
  
  @Pure
  public Receta getRecetaPolloAlOreganato() {
    return this.recetaPolloAlOreganato;
  }
  
  public void setRecetaPolloAlOreganato(final Receta recetaPolloAlOreganato) {
    this.recetaPolloAlOreganato = recetaPolloAlOreganato;
  }
  
  @Pure
  public Receta getRecetaLaComidaMasOrganicaDelMundo() {
    return this.recetaLaComidaMasOrganicaDelMundo;
  }
  
  public void setRecetaLaComidaMasOrganicaDelMundo(final Receta recetaLaComidaMasOrganicaDelMundo) {
    this.recetaLaComidaMasOrganicaDelMundo = recetaLaComidaMasOrganicaDelMundo;
  }
  
  @Pure
  public RutinaActiva getRutinaActivaCorta() {
    return this.rutinaActivaCorta;
  }
  
  public void setRutinaActivaCorta(final RutinaActiva rutinaActivaCorta) {
    this.rutinaActivaCorta = rutinaActivaCorta;
  }
  
  @Pure
  public RutinaActiva getRutinaActivaLarga() {
    return this.rutinaActivaLarga;
  }
  
  public void setRutinaActivaLarga(final RutinaActiva rutinaActivaLarga) {
    this.rutinaActivaLarga = rutinaActivaLarga;
  }
  
  @Pure
  public RutinaSedentaria getRutinaSedentaria() {
    return this.rutinaSedentaria;
  }
  
  public void setRutinaSedentaria(final RutinaSedentaria rutinaSedentaria) {
    this.rutinaSedentaria = rutinaSedentaria;
  }
  
  @Pure
  public Condimento getAzucar() {
    return this.azucar;
  }
  
  public void setAzucar(final Condimento azucar) {
    this.azucar = azucar;
  }
  
  @Pure
  public Condimento getCaldo() {
    return this.caldo;
  }
  
  public void setCaldo(final Condimento caldo) {
    this.caldo = caldo;
  }
  
  @Pure
  public Condimento getAjiMolido() {
    return this.ajiMolido;
  }
  
  public void setAjiMolido(final Condimento ajiMolido) {
    this.ajiMolido = ajiMolido;
  }
  
  @Pure
  public Condimento getPimienta() {
    return this.pimienta;
  }
  
  public void setPimienta(final Condimento pimienta) {
    this.pimienta = pimienta;
  }
  
  @Pure
  public Ingrediente getCuadril() {
    return this.cuadril;
  }
  
  public void setCuadril(final Ingrediente cuadril) {
    this.cuadril = cuadril;
  }
  
  @Pure
  public Ingrediente getHuevos() {
    return this.huevos;
  }
  
  public void setHuevos(final Ingrediente huevos) {
    this.huevos = huevos;
  }
  
  @Pure
  public Ingrediente getCebollas() {
    return this.cebollas;
  }
  
  public void setCebollas(final Ingrediente cebollas) {
    this.cebollas = cebollas;
  }
  
  @Pure
  public Ingrediente getChori() {
    return this.chori;
  }
  
  public void setChori(final Ingrediente chori) {
    this.chori = chori;
  }
  
  @Pure
  public Set<Ingrediente> getIngredientesVacios() {
    return this.ingredientesVacios;
  }
  
  public void setIngredientesVacios(final Set<Ingrediente> ingredientesVacios) {
    this.ingredientesVacios = ingredientesVacios;
  }
  
  @Pure
  public CondicionCeliaco getCeliaco() {
    return this.celiaco;
  }
  
  public void setCeliaco(final CondicionCeliaco celiaco) {
    this.celiaco = celiaco;
  }
  
  @Pure
  public CondicionDiabetico getDiabetico() {
    return this.diabetico;
  }
  
  public void setDiabetico(final CondicionDiabetico diabetico) {
    this.diabetico = diabetico;
  }
  
  @Pure
  public CondicionHipertenso getHipertenso() {
    return this.hipertenso;
  }
  
  public void setHipertenso(final CondicionHipertenso hipertenso) {
    this.hipertenso = hipertenso;
  }
  
  @Pure
  public CondicionVegano getVegano() {
    return this.vegano;
  }
  
  public void setVegano(final CondicionVegano vegano) {
    this.vegano = vegano;
  }
  
  @Pure
  public Set<Condimento> getCondimentosParaCualquiera() {
    return this.condimentosParaCualquiera;
  }
  
  public void setCondimentosParaCualquiera(final Set<Condimento> condimentosParaCualquiera) {
    this.condimentosParaCualquiera = condimentosParaCualquiera;
  }
  
  @Pure
  public Set<Condimento> getCondimentosAntiDiabetico() {
    return this.condimentosAntiDiabetico;
  }
  
  public void setCondimentosAntiDiabetico(final Set<Condimento> condimentosAntiDiabetico) {
    this.condimentosAntiDiabetico = condimentosAntiDiabetico;
  }
  
  @Pure
  public Set<Ingrediente> getIngredientesParaCualquiera() {
    return this.ingredientesParaCualquiera;
  }
  
  public void setIngredientesParaCualquiera(final Set<Ingrediente> ingredientesParaCualquiera) {
    this.ingredientesParaCualquiera = ingredientesParaCualquiera;
  }
  
  @Pure
  public Set<Ingrediente> getIngredientesAntiVegano() {
    return this.ingredientesAntiVegano;
  }
  
  public void setIngredientesAntiVegano(final Set<Ingrediente> ingredientesAntiVegano) {
    this.ingredientesAntiVegano = ingredientesAntiVegano;
  }
  
  @Pure
  public List<String> getPreparacionDefault() {
    return this.preparacionDefault;
  }
  
  public void setPreparacionDefault(final List<String> preparacionDefault) {
    this.preparacionDefault = preparacionDefault;
  }
  
  @Pure
  public GrupoUsuario getGrupoDeLaMuerte() {
    return this.grupoDeLaMuerte;
  }
  
  public void setGrupoDeLaMuerte(final GrupoUsuario grupoDeLaMuerte) {
    this.grupoDeLaMuerte = grupoDeLaMuerte;
  }
  
  @Pure
  public GrupoUsuario getGrupoFlojito() {
    return this.grupoFlojito;
  }
  
  public void setGrupoFlojito(final GrupoUsuario grupoFlojito) {
    this.grupoFlojito = grupoFlojito;
  }
  
  @Pure
  public RepositorioRecetas getRepo() {
    return this.repo;
  }
  
  public void setRepo(final RepositorioRecetas repo) {
    this.repo = repo;
  }
  
  @Pure
  public FiltroPorCondicionesPreexistentes getFiltroPorCondicionesPreexistentes() {
    return this.filtroPorCondicionesPreexistentes;
  }
  
  public void setFiltroPorCondicionesPreexistentes(final FiltroPorCondicionesPreexistentes filtroPorCondicionesPreexistentes) {
    this.filtroPorCondicionesPreexistentes = filtroPorCondicionesPreexistentes;
  }
  
  @Pure
  public FiltroPorExcesoDeCalorias getFiltroPorExcesoCalorias() {
    return this.filtroPorExcesoCalorias;
  }
  
  public void setFiltroPorExcesoCalorias(final FiltroPorExcesoDeCalorias filtroPorExcesoCalorias) {
    this.filtroPorExcesoCalorias = filtroPorExcesoCalorias;
  }
  
  @Pure
  public FiltroPorGusto getFiltroPorGusto() {
    return this.filtroPorGusto;
  }
  
  public void setFiltroPorGusto(final FiltroPorGusto filtroPorGusto) {
    this.filtroPorGusto = filtroPorGusto;
  }
  
  @Pure
  public FiltroPorSerCaros getFiltroPorCaros() {
    return this.filtroPorCaros;
  }
  
  public void setFiltroPorCaros(final FiltroPorSerCaros filtroPorCaros) {
    this.filtroPorCaros = filtroPorCaros;
  }
  
  @Pure
  public double getDelta() {
    return this.delta;
  }
  
  public void setDelta(final double delta) {
    this.delta = delta;
  }
}
