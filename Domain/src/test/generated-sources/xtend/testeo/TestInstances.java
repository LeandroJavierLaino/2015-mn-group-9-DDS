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
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.junit.Before;
import receta.Condimento;
import receta.Ingrediente;
import receta.Receta;
import receta.RecetaBuilder;
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
    CondicionCeliaco _condicionCeliaco = new CondicionCeliaco();
    this.celiaco = _condicionCeliaco;
    CondicionDiabetico _condicionDiabetico = new CondicionDiabetico();
    this.diabetico = _condicionDiabetico;
    CondicionHipertenso _condicionHipertenso = new CondicionHipertenso();
    this.hipertenso = _condicionHipertenso;
    CondicionVegano _condicionVegano = new CondicionVegano();
    this.vegano = _condicionVegano;
    Condimento _condimento = new Condimento("Azucar", 150, "grs");
    this.azucar = _condimento;
    Ingrediente _ingrediente = new Ingrediente("Chori", 2, "unidades");
    this.chori = _ingrediente;
    Condimento _condimento_1 = new Condimento("Caldo", 0, "cantidad necesaria");
    this.caldo = _condimento_1;
    Condimento _condimento_2 = new Condimento("Aji Molido", 0, "cantidad necesaria");
    this.ajiMolido = _condimento_2;
    Condimento _condimento_3 = new Condimento("Pimienta", 0, "cantidad necesaria");
    this.pimienta = _condimento_3;
    Ingrediente _ingrediente_1 = new Ingrediente("Cuadril", 3, "kgs");
    this.cuadril = _ingrediente_1;
    Ingrediente _ingrediente_2 = new Ingrediente("Huevos", 20, "unidades");
    this.huevos = _ingrediente_2;
    Ingrediente _ingrediente_3 = new Ingrediente("Cebollas", 1, "kgs");
    this.cebollas = _ingrediente_3;
    this.condimentosParaCualquiera.add(this.ajiMolido);
    this.condimentosAntiDiabetico.add(this.azucar);
    this.ingredientesParaCualquiera.add(this.cebollas);
    this.ingredientesAntiVegano.add(this.chori);
    this.preparacionDefault.add("paso");
    RecetaBuilder _recetaBuilder = new RecetaBuilder();
    RecetaBuilder _nombre = _recetaBuilder.nombre("antiVegano");
    RecetaBuilder _ingredientes = _nombre.ingredientes(this.ingredientesAntiVegano);
    RecetaBuilder _condimentos = _ingredientes.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones = _condimentos.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias = _instrucciones.conCalorias(150);
    RecetaBuilder _dificultad = _conCalorias.dificultad("Baja");
    RecetaBuilder _temporada = _dificultad.temporada("Verano");
    Receta _build = _temporada.build();
    this.recetaAntiVegano = _build;
    RecetaBuilder _recetaBuilder_1 = new RecetaBuilder();
    RecetaBuilder _nombre_1 = _recetaBuilder_1.nombre("antiDiabetico");
    RecetaBuilder _ingredientes_1 = _nombre_1.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_1 = _ingredientes_1.condimentos(this.condimentosAntiDiabetico);
    RecetaBuilder _instrucciones_1 = _condimentos_1.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_1 = _instrucciones_1.conCalorias(250);
    RecetaBuilder _dificultad_1 = _conCalorias_1.dificultad("Media");
    RecetaBuilder _temporada_1 = _dificultad_1.temporada("Invierno");
    Receta _build_1 = _temporada_1.build();
    this.recetaAntiDiabetico = _build_1;
    RecetaBuilder _recetaBuilder_2 = new RecetaBuilder();
    RecetaBuilder _nombre_2 = _recetaBuilder_2.nombre("default");
    RecetaBuilder _ingredientes_2 = _nombre_2.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_2 = _ingredientes_2.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_2 = _condimentos_2.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_2 = _instrucciones_2.conCalorias(150);
    RecetaBuilder _dificultad_2 = _conCalorias_2.dificultad("Baja");
    RecetaBuilder _temporada_2 = _dificultad_2.temporada("Verano");
    Receta _build_2 = _temporada_2.build();
    this.recetaParaCualquiera = _build_2;
    RecetaBuilder _recetaBuilder_3 = new RecetaBuilder();
    RecetaBuilder _nombre_3 = _recetaBuilder_3.nombre("default");
    RecetaBuilder _ingredientes_3 = _nombre_3.ingredientes(this.ingredientesVacios);
    RecetaBuilder _condimentos_3 = _ingredientes_3.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_3 = _condimentos_3.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_3 = _instrucciones_3.conCalorias(150);
    RecetaBuilder _dificultad_3 = _conCalorias_3.dificultad("Baja");
    RecetaBuilder _temporada_3 = _dificultad_3.temporada("Verano");
    Receta _build_3 = _temporada_3.build();
    this.recetaSinIngrediente = _build_3;
    RecetaBuilder _recetaBuilder_4 = new RecetaBuilder();
    RecetaBuilder _nombre_4 = _recetaBuilder_4.nombre("default");
    RecetaBuilder _ingredientes_4 = _nombre_4.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_4 = _ingredientes_4.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_4 = _condimentos_4.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_4 = _instrucciones_4.conCalorias(0);
    RecetaBuilder _dificultad_4 = _conCalorias_4.dificultad("Baja");
    RecetaBuilder _temporada_4 = _dificultad_4.temporada("Verano");
    Receta _build_4 = _temporada_4.build();
    this.recetaCaloriasBajoRango = _build_4;
    RecetaBuilder _recetaBuilder_5 = new RecetaBuilder();
    RecetaBuilder _nombre_5 = _recetaBuilder_5.nombre("default");
    RecetaBuilder _ingredientes_5 = _nombre_5.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_5 = _ingredientes_5.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_5 = _condimentos_5.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_5 = _instrucciones_5.conCalorias(100000000);
    RecetaBuilder _dificultad_5 = _conCalorias_5.dificultad("Baja");
    RecetaBuilder _temporada_5 = _dificultad_5.temporada("Verano");
    Receta _build_5 = _temporada_5.build();
    this.recetaCaloriasMayorRango = _build_5;
    RecetaBuilder _recetaBuilder_6 = new RecetaBuilder();
    RecetaBuilder _nombre_6 = _recetaBuilder_6.nombre("SalchiPapa");
    RecetaBuilder _ingredientes_6 = _nombre_6.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_6 = _ingredientes_6.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_6 = _condimentos_6.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_6 = _instrucciones_6.conCalorias(150);
    RecetaBuilder _dificultad_6 = _conCalorias_6.dificultad("Baja");
    RecetaBuilder _temporada_6 = _dificultad_6.temporada("Verano");
    Receta _build_6 = _temporada_6.build();
    this.recetaSalchiPapa = _build_6;
    RecetaBuilder _recetaBuilder_7 = new RecetaBuilder();
    RecetaBuilder _nombre_7 = _recetaBuilder_7.nombre("Pollo al Oreganato");
    RecetaBuilder _ingredientes_7 = _nombre_7.ingredientes(this.ingredientesAntiVegano);
    RecetaBuilder _condimentos_7 = _ingredientes_7.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_7 = _condimentos_7.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_7 = _instrucciones_7.conCalorias(150);
    RecetaBuilder _dificultad_7 = _conCalorias_7.dificultad("Alta");
    RecetaBuilder _temporada_7 = _dificultad_7.temporada("Invierno");
    Receta _build_7 = _temporada_7.build();
    this.recetaPolloAlOreganato = _build_7;
    RecetaBuilder _recetaBuilder_8 = new RecetaBuilder();
    RecetaBuilder _nombre_8 = _recetaBuilder_8.nombre("Ensalada");
    RecetaBuilder _ingredientes_8 = _nombre_8.ingredientes(this.ingredientesParaCualquiera);
    RecetaBuilder _condimentos_8 = _ingredientes_8.condimentos(this.condimentosParaCualquiera);
    RecetaBuilder _instrucciones_8 = _condimentos_8.instrucciones(this.preparacionDefault);
    RecetaBuilder _conCalorias_8 = _instrucciones_8.conCalorias(150);
    RecetaBuilder _dificultad_8 = _conCalorias_8.dificultad("D");
    RecetaBuilder _temporada_8 = _dificultad_8.temporada("Invierno");
    Receta _build_8 = _temporada_8.build();
    this.recetaLaComidaMasOrganicaDelMundo = _build_8;
    RutinaActiva _rutinaActiva = new RutinaActiva();
    final Procedure1<RutinaActiva> _function = new Procedure1<RutinaActiva>() {
      public void apply(final RutinaActiva it) {
        it.setTiempo(10);
      }
    };
    RutinaActiva _doubleArrow = ObjectExtensions.<RutinaActiva>operator_doubleArrow(_rutinaActiva, _function);
    this.rutinaActivaCorta = _doubleArrow;
    RutinaActiva _rutinaActiva_1 = new RutinaActiva();
    final Procedure1<RutinaActiva> _function_1 = new Procedure1<RutinaActiva>() {
      public void apply(final RutinaActiva it) {
        it.setTiempo(40);
      }
    };
    RutinaActiva _doubleArrow_1 = ObjectExtensions.<RutinaActiva>operator_doubleArrow(_rutinaActiva_1, _function_1);
    this.rutinaActivaLarga = _doubleArrow_1;
    RutinaSedentaria _rutinaSedentaria = new RutinaSedentaria();
    final Procedure1<RutinaSedentaria> _function_2 = new Procedure1<RutinaSedentaria>() {
      public void apply(final RutinaSedentaria it) {
        it.setTiempo(10);
      }
    };
    RutinaSedentaria _doubleArrow_2 = ObjectExtensions.<RutinaSedentaria>operator_doubleArrow(_rutinaSedentaria, _function_2);
    this.rutinaSedentaria = _doubleArrow_2;
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
