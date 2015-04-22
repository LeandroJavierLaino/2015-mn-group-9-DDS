import org.junit.Test
import org.junit.Assert
import org.junit.Before
import java.util.ArrayList
import java.util.Set
import java.util.List
import java.util.HashSet

class TestsDeIMC {
//dos errores menos :/
	Usuario leandro
	Usuario eri
	Usuario diego
	Usuario nicolas
	Usuario pablo
	Usuario usrValid1 //sin sexo
	Usuario usrInval1 //sin datos
	Usuario usrInval2 //nombre corto
	Usuario usrInval3 //sin altura
	Usuario usrInval4 //sin peso
	Usuario usrInval5 //fecha futura
	Usuario usrInval6 //sin rutina
	Usuario usrVegano1 //le gusta el pollo	//no le gusta la fruta
	Usuario usrVegano2 //valido			//le gusta la fruta
	Usuario usrHipertenso1 //sin preferencia	//tiene rutina activa
	Usuario usrHipertenso2 //valido			//tiene rutina sedentaria
	Usuario usrDiabetico1 //sin sexo 			//mas de 70kg
	Usuario usrDiabetico2 //sin preferencia 	//menos de 70kg
	Usuario usrDiabetico3 //valido
	Usuario usrCeliaco //valido
	Receta receta1 //antiVegano
	Receta receta2 //antiDiabetico
	Receta receta3 //Apta para Todo Publico
	Receta recetaLean //hecha por Lean
	Receta recetaEri //hecha por Eri
	Rutina rutinaCorta
	Rutina rutinaLarga
	Condimento azucar
	Ingrediente papa
	Condimento caldo
	Condimento ajiMolido
	Condimento pimienta
	Ingrediente cuadril
	Ingrediente huevos
	Ingrediente cebollas
	Ingrediente chori
	RepositorioRecetas repo
	CondicionCeliaco celiaco
	CondicionDiabetico diabetico
	CondicionHipertenso hipertenso
	CondicionVegano vegano

	double delta = 0.0000000001

	@Before
	def void init() {
		celiaco = new CondicionCeliaco
		diabetico = new CondicionDiabetico
		hipertenso = new CondicionHipertenso
		vegano = new CondicionVegano
		azucar = new Condimento("azucar", 150, "grs")
		chori = new Ingrediente("chori",2,"unidades")
		caldo = new Condimento("caldo", 0, "cantidad necesaria")
		ajiMolido = new Condimento("aji molido", 0, "cantidad necesaria")
		pimienta = new Condimento("pimienta", 0, "cantidad necesaria")
		cuadril = new Ingrediente("cuadril", 3, "kgs")
		huevos = new Ingrediente("huevos", 20, "unidades")
		cebollas = new Ingrediente("cebollas", 1, "kgs")
		val condimentosAntiDiabetico = new HashSet<Condimento>
		val preparacionDefaul = new ArrayList<String>
		val ingredientesAntiVegano = new HashSet<Ingrediente>
		condimentosAntiDiabetico.add(azucar)
		ingredientesAntiVegano.add(chori)
		preparacionDefaul.add("paso")
//		repo.recetas.add(receta1)
		
		receta1 = new Receta("antiVegano",ingredientesAntiVegano,condimentosAntiDiabetico,preparacionDefaul,150,"Baja","Verano")
		receta2 = new Receta("antiDiabetico",ingredientesAntiVegano,condimentosAntiDiabetico,preparacionDefaul,250,"Media","Invierno")
		receta3 = new Receta("default",ingredientesAntiVegano,condimentosAntiDiabetico,preparacionDefaul,150,"Baja","Verano")

		rutinaCorta = new RutinaActiva => [
			tiempo = 10
		]

		rutinaLarga = new RutinaActiva => [
			tiempo = 40
		]

		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = "M"
			fechaDeNacimiento = 19880627
			altura = 1.74
			peso = 70
			rutina = rutinaCorta
			recetas.add(receta2)
		]

		eri = new Usuario => [
			nombre = "Erika"
			sexo = "F"
			fechaDeNacimiento = 19800101
			altura = 1.52
			peso = 60
			rutina = rutinaLarga
			recetas.add(receta3)
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = "M"
			fechaDeNacimiento =19800101
			altura = 1.70
			peso = 65
			rutina = rutinaCorta
			
		]

		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = 'M'
			fechaDeNacimiento = 19801110
			altura = 1.74
			peso = 60
			rutina = rutinaLarga
			condicionesPreexistentes = emptyList	
		]

		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = "M"
			fechaDeNacimiento = 19800202
			altura = 1.79
			peso = 72
			rutina = rutinaCorta
			
		]

		usrValid1 = new Usuario => [
			nombre = "Manu"
			fechaDeNacimiento = 19801112
			altura = 1.76
			peso = 70
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval1 = new Usuario => [
			sexo = "M"
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval2 = new Usuario => [
			nombre = "ari"
			sexo = "M"
			fechaDeNacimiento = 19911020
			altura = 1.45
			peso = 197
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval3 = new Usuario => [
			nombre = "juanse"
			sexo = "M"
			fechaDeNacimiento = 20011010
			altura = 0
			peso = 99
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval4 = new Usuario => [
			nombre = "Marta"
			sexo = "F"
			fechaDeNacimiento = 20012010
			altura = 1.70
			peso = 0
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval5 = new Usuario => [
			nombre = "Florencia"
			sexo = "F"
			fechaDeNacimiento = 20901110
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrInval6 = new Usuario => [
			nombre = "Paula"
			sexo = "F"
			fechaDeNacimiento = 20900523
			altura = 1.70
			peso = 67
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrVegano1 = new Usuario => [
			nombre = "VeganoUno"
			sexo = "M"
			fechaDeNacimiento = 20112004
			peso = 67
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrVegano2 = new Usuario => [
			nombre = "VeganoDos"
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("frutas")
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrHipertenso1 = new Usuario => [
			nombre = "HipertensoUno"
			sexo = "F"
			agregarCondicion(hipertenso)
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrHipertenso2 = new Usuario => [
			nombre = "HipertensoDos"
			sexo = "F"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrDiabetico1 = new Usuario => [
			nombre = "DiabeticoUno"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 80
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
			agregarCondicion(diabetico)
		]

		usrDiabetico2 = new Usuario => [
			nombre = "DiabeticoDos"
			agregarCondicion(diabetico)
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrDiabetico3 = new Usuario => [
			nombre = "DiabeticoTres"
			sexo = "M"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]

		usrCeliaco = new Usuario => [
			nombre = "Celiaco"
			sexo = "F"
			fechaDeNacimiento = 20001120
			altura = 1.70
			peso = 78
			rutina = rutinaCorta
			val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		]
	}

	//Punto 1 VALIDEZ
	//testeados sin datos, nombre corto, sin altura, sin peso, fecha futura, sin rutina
	// sin sexo (valido)
	@Test
	def void eriEsUnUsuarioValido() {
		Assert.assertTrue(eri.validar())
	}

	@Test
	def void diegoEsUnUsuarioValido() {
		Assert.assertTrue(diego.validar())
	}

	@Test
	def void nicolasEsUnUsuarioValido() {
		Assert.assertTrue(nicolas.validar())
	}

	@Test
	def void pabloEsUnUsuarioValido() {
		Assert.assertTrue(pablo.validar())
	}

	@Test
	def void leandroEsUnUsuarioValido() {
		Assert.assertTrue(leandro.validar())
	}

	@Test
	def void usrValid1EsUnUsuarioValidoSinSexo() {
		Assert.assertTrue(usrValid1.validar())
	}

	@Test
	def void usrInvalido1NoValidoFaltanDatos() {
		Assert.assertFalse(usrInval1.validar())
	}

	@Test
	def void usrInvalido2NoValidoNombreCorto() {
		Assert.assertFalse(usrInval2.validar())
	}

	@Test
	def void usrInvalido3NoValidoSinAltura() {
		Assert.assertFalse(usrInval3.validar())
	}

	@Test
	def void usrInvalido4NoValidoSinPeso() {
		Assert.assertFalse(usrInval4.validar())
	}

	@Test
	def void usrInvalido5NoValidoFechaFutura() {
		Assert.assertFalse(usrInval5.validar())
	}

	@Test
	def void usrVeganoUnoNoValidoPorGustos() {
		Assert.assertFalse(usrVegano1.validar())
	}

	@Test
	def void usrVeganoDosValido() {
		Assert.assertTrue(usrVegano2.validar())
	}

	@Test (expected=typeof(Exception))
	def void usrHipertensoUnoNoValidoPorGustos() {
		usrHipertenso1.validar()
	}

	@Test
	def void usrHipertensoDosValido() {
		Assert.assertTrue(usrHipertenso2.validar())
	}

	@Test (expected=typeof(Exception))
	def void usrDiabeticoUnoNoValidoSinSexo() {
		usrDiabetico1.validar()
	}

	@Test (expected=typeof(Exception))
	def void usrDiabeticoDosNoValidoPorGustos() {
		usrDiabetico2.validar()
	}

	@Test
	def void usrDiabeticoTresValido() {
		Assert.assertTrue(usrDiabetico3.validar())
	}

	@Test
	def void usrCeliacoValido() {
		Assert.assertTrue(usrCeliaco.validar())
	}

	//Punto 2 IMC
	@Test
	def void leandroCalculaSuIMC() {

		/** Cuando usamos un assertEquals para un float o un double se tiene que tener en cuenta un tercer parametro que es el delta. */
		Assert.assertEquals(23.1206235962, leandro.calculaIMC, delta)
	}

	@Test
	def void eriCalculaSuIMC() {
		Assert.assertEquals(25.9695290859, eri.calculaIMC, delta)
	}

	@Test
	def void diegoCalculaSuIMC() {
		Assert.assertEquals(22.4913494809, diego.calculaIMC, delta)
	}

	@Test
	def void nicolasCalculaSuIMC() {
		Assert.assertEquals(19.8176773682, nicolas.calculaIMC, delta)
	}

	@Test
	def void pabloCalculaSuIMC() {
		Assert.assertEquals(22.4712087637, pablo.calculaIMC, delta)
	}

	@Test(expected=typeof(Exception)) //sin altura
	def void usrInval3CalculaSuIMC() {
		usrInval3.calculaIMC
	}

	@Test(expected=typeof(Exception)) //sin peso
	def void usrInval4CalculaSuIMC() {
		usrInval4.calculaIMC
	}

	//Punto 2 RUTINA SALUDABLE
	@Test
	def void leandroSigueUnaRutinaSaludable() {
		Assert.assertTrue(leandro.sigueUnaRutinaSaludable())
	}

	@Test
	def void erikaSigueUnaRutinaSaludable() {
		Assert.assertTrue(eri.sigueUnaRutinaSaludable())
	}

	@Test
	def void diegoSigueUnaRutinaSaludable() {
		Assert.assertTrue(diego.sigueUnaRutinaSaludable())
	}

	@Test
	def void nicolasSigueUnaRutinaSaludable() {
		Assert.assertTrue(nicolas.sigueUnaRutinaSaludable())
	}

	@Test
	def void pabloSigueUnaRutinaSaludable() {
		Assert.assertTrue(pablo.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrInval2NoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrInval2.sigueUnaRutinaSaludable())
	}

	@Test (expected=typeof(Exception))
	def void usrVeganoNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrVegano1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrHipertensoNoSigueUnaRutinaSaludable() {
		Assert.assertFalse(usrHipertenso1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrDiabetico1SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico1.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrDiabetico2SigueUnaRutinaSaludable() {
		Assert.assertTrue(usrDiabetico2.sigueUnaRutinaSaludable())
	}

	@Test
	def void usrCeliacoSigueUnaRutinaSaludable() {
		Assert.assertTrue(usrCeliaco.sigueUnaRutinaSaludable())
	}

	//Punto 3 CREAR RECETAS
	@Test(expected=typeof(BusinessException)) //sin Ingrediente
	def void leandroCreaReceta() {
		var Set<Condimento> condimentos = new HashSet<Condimento>
		var Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
		var List<String> procesoPreparacion = new ArrayList<String>
		ingredientes = emptySet
		procesoPreparacion.add("pasoxpaso")
		condimentos.add(azucar)
		condimentos.add(caldo)
		leandro.crearReceta("RecetaLean",ingredientes,condimentos,procesoPreparacion, 450, "Media", "Verano")
	}

	@Test(expected=typeof(BusinessException)) //calorias Fuera de Rango
	def void eriCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		eri.crearReceta("RecetaEri",ingredientes,condimentos,procesoPreparacion, 8, "Media", "Invierno")
	}

	@Test
	def void crearReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		diego.crearReceta("RecetaDiego",ingredientes,condimentos,procesoPreparacion, 300,"Media","Verano")
	}

	@Test
	def void nicolasCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		nicolas.crearReceta("RecetaNico",ingredientes,condimentos,procesoPreparacion, 120,"Media","Verano")
	}

	@Test
	def void pabloCreaReceta() {
		val Set<Condimento> condimentos = new HashSet<Condimento>
			val Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
			val List<String> procesoPreparacion = new ArrayList<String>
			ingredientes.add(huevos)
			ingredientes.add(cebollas)
			procesoPreparacion.add("pasoxpaso")
			condimentos.add(azucar)
			condimentos.add(caldo)
		pablo.crearReceta("RecetaPablo",ingredientes ,condimentos,procesoPreparacion, 110,"Media","Verano")
	}

	//Punto 3 CONDICIONES PREEX
	@Test
	def void Receta1NoAdecuadaParaVegano() {
		Assert.assertFalse(receta1.esRecomendablePara(usrVegano1))
	}

	@Test
	def void Receta3InadecuadaParaDiabetico() {
		Assert.assertFalse(receta2.esRecomendablePara(usrDiabetico1))
	}

	@Test
	def void Receta2AdecuadaParaTodos() {
		Assert.assertTrue(receta3.esRecomendablePara(usrDiabetico1))
	}

	//Punto 4 PUEDE VER/MODIFICAR RECETAS
	@Test
	def void leandroPuedeVerRecetaLean() {
		Assert.assertFalse(receta3.puedeVerReceta(leandro))
	}

	@Test
	def void eriNoPuedeVerRecetaDeLeandro() {
		Assert.assertFalse(receta2.puedeVerReceta(eri))
	}

	@Test
	def void leandroPuedeVerReceta1() {
		Assert.assertTrue(receta1.puedeVerReceta(leandro))
	}

//	//Punto 4 MODIFICAR RECETAS
//	@Test
//	def void leandroModificaReceta1() {
//		leandro.modificarReceta(receta1,"Nuevo")
//	}
//
//	@Test(expected=typeof(BusinessException)) //no Tiene Permitido Modificar
//	def void eriModificaRecetaLean() {
//		leandro.modificarReceta(recetaLean)
//	}
//
////Punto 5 RECETA CON SUBRECETAS
}
