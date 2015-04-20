import org.junit.Test
import org.junit.Assert
import org.junit.Before

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
	Usuario usrVegano
	Usuario usrHipertenso
	Usuario usrDiabetico1	//mas de 70kg
	Usuario usrDiabetico2	//menos de 70kg
	Usuario usrCeliaco		
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
			sexo = ''
			fechaDeNacimiento = 01011980 
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
			sexo = ''
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
		
		usrVegano = new Usuario => [
			nombre = "Vegano"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaCorta
		]
		
		usrHipertenso = new Usuario => [
			nombre = "Hipertenso"
			sexo = 'F'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
		]
		
		usrDiabetico1 = new Usuario => [
			nombre = "DiabeticoUno"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 80
			rutina = rutinaCorta
		]
		
		usrDiabetico2 = new Usuario => [
			nombre = "DiabeticoDos"
			sexo = 'M'
			fechaDeNacimiento = 20112000
			altura = 1.70
			peso = 67
			rutina = rutinaLarga
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
	//TODO: testear condiciones especiales
	
	
	@Test
	def void eriEsUnUsuarioValido(){
		Assert.assertEquals(true,eri.validar())
	}
	
	@Test
	def void diegoEsUnUsuarioValido(){
		Assert.assertEquals(true,diego.validar())
	}
	
	@Test
	def void nicolasEsUnUsuarioValido(){
		Assert.assertEquals(true,nicolas.validar())
	}
	
	@Test
	def void pabloEsUnUsuarioValido(){
		Assert.assertEquals(true,pablo.validar())
	}
	
	@Test
	def void leandroEsUnUsuarioValido(){
		Assert.assertEquals(true,leandro.validar())
	}
	
	@Test
	def void usrValid1EsUnUsuarioValidoSinSexo(){
		Assert.assertEquals(true,usrValid1.validar())
	}
	
	@Test
	def void usrInvalido1NoValidoFaltanDatos(){
		Assert.assertEquals(false,usrInval1.validar())
	}
	
	@Test
	def void usrInvalido2NoValidoNombreCorto(){
		Assert.assertEquals(false,usrInval2.validar())
	}
	
	@Test
	def void usrInvalido3NoValidoSinAltura(){
		Assert.assertEquals(false,usrInval3.validar())
	}
	
	@Test
	def void usrInvalido4NoValidoSinPeso(){
		Assert.assertEquals(false,usrInval4.validar())
	}
	
	@Test
	def void usrInvalido5NoValidoFechaFutura(){
		Assert.assertEquals(false,usrInval5.validar())
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
	
	@Test
	def void pabloCalculaMalSuIMC() {
		Assert.assertEquals(0, pablo.calculaIMC, delta)
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
		Assert.assertEquals(true, leandro.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void erikaSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, eri.sigueUnaRutinaSaludable())
	}
	
		@Test
	def void diegoSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, diego.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void nicolasSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, nicolas.sigueUnaRutinaSaludable())
	}

	@Test
	def void pabloSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, pablo.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrInval2NoSigueUnaRutinaSaludable(){
		Assert.assertEquals(false, usrInval2.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrVeganoNoSigueUnaRutinaSaludable(){
		Assert.assertEquals(false, usrVegano.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrHipertensoNoSigueUnaRutinaSaludable(){
		Assert.assertEquals(false, usrHipertenso.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico1NoSigueUnaRutinaSaludable(){
		Assert.assertEquals(false, usrDiabetico1.sigueUnaRutinaSaludable())
	}
	
	@Test
	def void usrDiabetico2SigueUnaRutinaSaludable(){
		Assert.assertEquals(true, usrDiabetico2.sigueUnaRutinaSaludable())
	}
	
		@Test
	def void usrCeliacoSigueUnaRutinaSaludable(){
		Assert.assertEquals(true, usrCeliaco.sigueUnaRutinaSaludable())
	}
}


