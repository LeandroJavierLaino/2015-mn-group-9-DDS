import org.junit.Test
import org.junit.Assert
import org.junit.Before
import java.util.ArrayList

class TestsDeIMC {

	Usuario leandro
	Usuario eri
	Usuario diego
	Usuario nicolas
	Usuario pablo
	Usuario	usrValid1	//sin sexo
	Usuario usrInval1	//sin datos
	Usuario usrInval2	//nombre corto
	Usuario usrInval3	//sin altura
	Usuario usrInval4	//sin peso
	Usuario usrInval5	//fecha futura
	Usuario usrInval6	//sin rutina
	Usuario usrVegano1		//le gusta el pollo	//no le gusta la fruta
	Usuario usrVegano2		//valido			//le gusta la fruta
	Usuario usrHipertenso1	//sin preferencia	//tiene rutina activa
	Usuario usrHipertenso2	//valido			//tiene rutina sedentaria
	Usuario usrDiabetico1	//sin sexo 			//mas de 70kg
	Usuario usrDiabetico2	//sin preferencia 	//menos de 70kg
	Usuario usrDiabetico3	//valido
	Usuario usrCeliaco		//valido
	Receta	receta1			//antiVegano
	Receta	receta2			//antiDiabetico
	Receta	receta3			//Apta para Todo Publico
	Receta	recetaLean		//hecha por Lean
	Receta	recetaEri		//hecha por Eri
	Sistema elSistema
	Rutina 	rutinaCorta
	Rutina	rutinaLarga
	
	double delta =  0.0000000001

//TODO: reparar las Fechas, tienen que tener formato de fechas y no de INT

	@Before
	def void init() {
		elSistema = new Sistema =>[
			
		]
		
		rutinaCorta = new RutinaActiva => [
			tiempo = 10
		]
		
		rutinaLarga = new RutinaActiva => [
			tiempo = 40
		]
		
		leandro = new Usuario => [
			nombre = "Leandro"
			sexo = 'M'
			fechaDeNacimiento = 27061988
			altura = 1.74
			peso = 70
			rutina = rutinaCorta
		]
		
		eri = new Usuario => [
			nombre = "Erika"
			sexo = 'F'
			fechaDeNacimiento = 1011980 
			altura = 1.52
			peso = 60
			rutina = rutinaLarga
		]

		diego = new Usuario => [
			nombre = "Diego"
			sexo = 'M'
			fechaDeNacimiento = 1011980 
			altura = 1.70
			peso = 65
			rutina = rutinaCorta
		]
		
		nicolas = new Usuario => [
			nombre = "Nicolas"
			sexo = 'M'
			fechaDeNacimiento = 1011980 
			altura = 1.74
			peso = 60
			rutina = rutinaLarga
		]
		
		pablo = new Usuario => [
			nombre = "Pablo"
			sexo = 'M'
			fechaDeNacimiento = 1011980 
			altura = 1.79
			peso = 72
			rutina = rutinaCorta
		]
		
		usrValid1 = new Usuario => [
			nombre = "Manu"
			fechaDeNacimiento = 12011980 
			altura = 1.76
			peso = 70
			rutina = rutinaCorta
		]
		
		usrInval1 = new Usuario => [
			sexo = 'M'
		]
		
		usrInval2 = new Usuario => [
			nombre = "ari"
			sexo = 'M'
			fechaDeNacimiento = 10291991
			altura = 1.45
			peso = 197
			rutina = rutinaCorta
		]
		
		usrInval3 = new Usuario => [
			nombre = "juanse"
			sexo = 'M'
			fechaDeNacimiento = 10102001
			altura = 0
			peso = 99
			rutina = rutinaCorta
		]
		
		usrInval4 = new Usuario => [
			nombre = "Marta"
			sexo = 'F'
			fechaDeNacimiento = 20012001
			altura = 1.70
			peso = 0
			rutina = rutinaCorta
		]
		
		usrInval5 = new Usuario => [
			nombre = "Florencia"
			sexo = 'F'
			fechaDeNacimiento = 20112090
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
		]
		
		usrInval6 = new Usuario => [
			nombre = "Paula"
			sexo = 'F'
			fechaDeNacimiento = 20112090
			altura = 1.70
			peso = 67
		]
		
		usrVegano1 = new Usuario => [
			nombre = "VeganoUno"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
		]
		
		usrVegano2 = new Usuario => [
			nombre = "VeganoDos"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("frutas")
		]
		
		usrHipertenso1 = new Usuario => [
			nombre = "HipertensoUno"
			sexo = 'F'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
		]
		
		usrHipertenso2 = new Usuario => [
			nombre = "HipertensoDos"
			sexo = 'F'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
		]
		
		usrDiabetico1 = new Usuario => [
			nombre = "DiabeticoUno"
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 80
			rutina = rutinaCorta
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("carne")
		]
		
		usrDiabetico2 = new Usuario => [
			nombre = "DiabeticoDos"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
		]
		
		usrDiabetico3 = new Usuario => [
			nombre = "DiabeticoTres"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
			comidaPreferida = new ArrayList<String>()
			comidaPreferida.add("pollo")
		]
		
		usrCeliaco = new Usuario => [
			nombre = "Celiaco"
			sexo = 'F'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 78
			rutina = rutinaCorta
		]
	}
//Punto 1 VALIDEZ
	//testeados sin datos, nombre corto, sin altura, sin peso, fecha futura, sin rutina
	// sin sexo (valido)
	
	
	@Test
	def void eriEsUnUsuarioValido(){
		Assert.assertTrue(eri.validar())
	}
	
	@Test
	def void diegoEsUnUsuarioValido(){
		Assert.assertTrue(diego.validar())
	}
	
	@Test
	def void nicolasEsUnUsuarioValido(){
		Assert.assertTrue(nicolas.validar())
	}
	
	@Test
	def void pabloEsUnUsuarioValido(){
		Assert.assertTrue(pablo.validar())
	}
	
	@Test
	def void leandroEsUnUsuarioValido(){
		Assert.assertTrue(leandro.validar())
	}
	
	@Test
	def void usrValid1EsUnUsuarioValidoSinSexo(){
		Assert.assertTrue(usrValid1.validar())
	}
	
	@Test
	def void usrInvalido1NoValidoFaltanDatos(){
		Assert.assertFalse(usrInval1.validar())
	}
	
	@Test
	def void usrInvalido2NoValidoNombreCorto(){
		Assert.assertFalse(usrInval2.validar())
	}
	
	@Test
	def void usrInvalido3NoValidoSinAltura(){
		Assert.assertFalse(usrInval3.validar())
	}
	
	@Test
	def void usrInvalido4NoValidoSinPeso(){
		Assert.assertFalse(usrInval4.validar())
	}
	
	@Test
	def void usrInvalido5NoValidoFechaFutura(){
		Assert.assertFalse(usrInval5.validar())
	}
	
	@Test
	def void usrVeganoUnoNoValidoPorGustos(){
		Assert.assertFalse(usrVegano1.validar())
	}
	
	@Test
	def void usrVeganoDosValido(){
		Assert.assertTrue(usrVegano2.validar())
	}
	
	@Test
	def void usrHipertensoUnoNoValidoPorGustos(){
		Assert.assertFalse(usrHipertenso1.validar())
	}
	
	@Test
	def void usrHipertensoDosValido(){
		Assert.assertTrue(usrHipertenso2.validar())
	}
	
	@Test
	def void usrDiabeticoUnoNoValidoSinSexo(){
		Assert.assertFalse(usrDiabetico1.validar())
	}
	
	@Test
	def void usrDiabeticoDosNoValidoPorGustos(){
		Assert.assertFalse(usrDiabetico2.validar())
	}
	
	@Test
	def void usrDiabeticoTresValido(){
		Assert.assertTrue(usrDiabetico3.validar())
	}
	
	@Test
	def void usrCeliacoValido(){
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
	
	
	@Test (expected=typeof(BusinessException))	//sin altura
	def void usrInval3CalculaSuIMC() {
		usrInval3.calculaIMC
	}
	
	@Test (expected=typeof(BusinessException))	//sin peso
	def void usrInval4CalculaSuIMC() {
		usrInval4.calculaIMC
	}
	
//Punto 2 RUTINA SALUDABLE
	
	@Test
	def void leandroSigueUnaRutinaSaludable(){
		Assert.assertTrue(leandro.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void erikaSigueUnaRutinaSaludable(){
		Assert.assertTrue(eri.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void diegoSigueUnaRutinaSaludable(){
		Assert.assertTrue(diego.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void nicolasSigueUnaRutinaSaludable(){
		Assert.assertTrue(nicolas.sigueUnaRutinaSaludable())
	}

	@Test
	def void pabloSigueUnaRutinaSaludable(){
		Assert.assertTrue(pablo.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrInval2NoSigueUnaRutinaSaludable(){
		Assert.assertFalse(usrInval2.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrVeganoNoSigueUnaRutinaSaludable(){
		Assert.assertFalse(usrVegano1.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrHipertensoNoSigueUnaRutinaSaludable(){
		Assert.assertFalse(usrHipertenso1.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico1NoSigueUnaRutinaSaludable(){
		Assert.assertFalse(usrDiabetico1.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico2SigueUnaRutinaSaludable(){
		Assert.assertTrue(usrDiabetico2.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrCeliacoSigueUnaRutinaSaludable(){
		Assert.assertTrue(usrCeliaco.sigueUnaRutinaSaludable())
	}
	
//Punto 3 CREAR RECETAS

//TODO: necesito bien los tipos de la funcion crearReceta

	@Test	(expected=typeof(BusinessException))	//sin Ingrediente
	def void leandroCreaReceta(){
		leandro.crearReceta("RecetaLean",,,"pasoXpaso",450,1,1)
	}		
	
	@Test	(expected=typeof(BusinessException))	//calorias Fuera de Rango
	def void eriCreaReceta(){
		eri.crearReceta("RecetaEri",,,"pasoXpaso",8,1,1)
	}		
	
	@Test
	def void crearReceta(){
		diego.crearReceta("RecetaDiego",,,"pasoXpaso",300,1,1)
	}		
	
	@Test
	def void nicolasCreaReceta(){
		nicolas.crearReceta("RecetaNico",,,"pasoXpaso",120,1,1)
	}	
	
	@Test
	def void pabloCreaReceta(){
		pablo.crearReceta("RecetaPablo",,,"pasoXpaso",110,1,1)
	}		
	
//Punto 3 CONDICIONES PREEX

	@Test
	def void Receta1NoAdecuadaParaVegano(){
		Assert.assertEquals(Vegano, receta1.esInadecuadaPara())
	}
	
	@Test
	def void Receta3InadecuadaParaDiabetico(){
		Assert.assertEquals(Diabetico, receta2.esInadecuadaPara())
	}
	
	@Test
	def void Receta2AdecuadaParaTodos(){
		Assert.assertNull(receta3.esInadecuadaPara())
	}
	
//Punto 4 PUEDE VER/MODIFICAR RECETAS
	@Test
	def void leandroPuedeVerRecetaLean(){
		Assert.assertTrue(receta3.puedeVerOModificarReceta(recetaLean))
	}
	
	@Test
	def void leandroNoPuedeVerRecetaEri(){
		Assert.assertFalse(leandro.puedeVerOModificarReceta(recetaEri))
	}

	@Test
	def void leandroPuedeVerReceta1(){
		Assert.assertFalse(leandro.puedeVerOModificarReceta(receta1))
	}
	
//Punto 4 MODIFICAR RECETAS
	@Test
	def void leandroModificaReceta1(){
		leandro.modificarReceta(receta1)
	}

	@Test	(expected=typeof(BusinessException))	//no Tiene Permitido Modificar
	def void eriModificaRecetaLean(){
		leandro.modificarReceta(recetaLean)
	}
	
//Punto 5 RECETA CON SUBRECETAS
}