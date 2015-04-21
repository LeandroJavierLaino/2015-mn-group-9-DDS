import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuarioEsValido {
	
	Usuario marcos // el mas simple
	Usuario jerry // vegano
	Usuario eva // nombre corto
	Usuario tomas // solo nombre
	Usuario mauro // diabetico con rutina activa
	Usuario david // hipertenso con rutina intensa
	Usuario eugene // todas las condiciones
	Usuario santiago // vegano pero le gusta la carne
	
	@Before
	def void init() {
		val vegano =  new CondicionVegano
		val diabetico = new CondicionDiabetico
		val celiaco = new CondicionCeliaco
		val hipertenso = new CondicionHipertenso
		val rutinaDeMauro = new RutinaActiva
		val rutinaDeDavid = new RutinaActiva
		
		marcos = new Usuario => [
			nombre = "Marcos"
			altura = 1.85
			peso = 88.0
			fechaDeNacimiento = 2495
			condicionesPreexistentes = emptyList
		]
		jerry = new Usuario => [
			nombre = "Jerry"
			altura = 1.85
			peso = 88.0
			fechaDeNacimiento = 2495
			agregarCondicion((vegano))
			agregarComidaALista(comidaPreferida, "Fruta")
		]
		eva = new Usuario => [
			nombre = "Eva"
			altura = 1.55
			peso = 50.0
			fechaDeNacimiento = 2490
		]
		tomas = new Usuario => [
			nombre = "Tomas"
			
		]
		mauro = new Usuario => [
			nombre = "Mauro"
			altura = 1.79
			peso = 71.0
			fechaDeNacimiento = 25495
			sexo = 'M'
			agregarCondicion(diabetico)
			agregarComidaALista(comidaPreferida, "Carne")
			rutina = rutinaDeMauro
		]
		david = new Usuario => [
			nombre = "David"
			altura = 1.98
			peso = 100.0
			fechaDeNacimiento = 26590
			agregarCondicion(hipertenso)
			agregarComidaALista(comidaPreferida, "Chori")
			rutina = rutinaDeDavid
			rutina.tiempo = 40
		]
		eugene = new Usuario => [
			nombre = "Eugene"
			altura = 1.60
			peso = 50.0
			sexo = 'M'
			fechaDeNacimiento = 13991
			agregarCondicion(hipertenso)
			agregarCondicion(celiaco)
			agregarCondicion(diabetico)
			agregarCondicion(vegano)
			
			agregarComidaALista(comidaPreferida, "Fruta")
		]
		santiago = new Usuario => [
			nombre = "Santiago"
			altura = 1.70
			peso = 80.0
			fechaDeNacimiento = 5490
			agregarCondicion(vegano)
			
			agregarComidaALista(comidaPreferida, "Chori")
		]
	}
	
	@Test
	def void marcosEsUsuarioValido() {
		Assert.assertTrue(marcos.validar())
	}
	
	@Test
	def void jerryEsUsuarioValido() {
		Assert.assertTrue(jerry.validar())
	}
	@Test
	def void evaNoEsUsuarioValido() {
		Assert.assertFalse(eva.validar())
	}
	@Test
	def void tomasNoEsValidoPorqueNoTieneNiAlturaNiPeso() {
		Assert.assertFalse(tomas.validar())
	}
	@Test
	def void mauroEsDiabeticoYUnUsuarioValido() {
		Assert.assertTrue(mauro.validar())
	}
	@Test
	def void davidEsHipertensoYUnUsuarioValido() {
		Assert.assertTrue(david.validar())
	}
	@Test
	def void eugeneEsUnUsuarioValido() {
		Assert.assertTrue(eugene.validar())
	}
	@Test
	def void santiagoEsUnVeganoCareta() {
		Assert.assertFalse(santiago.validar())
	}
	@Test
	def void mauroSigueUnaDietaSaludable() {
		Assert.assertTrue(mauro.sigueUnaRutinaSaludable)
	}
	@Test
	def void davidSigueUnaDietaSaludable() {
		Assert.assertTrue(david.sigueUnaRutinaSaludable)
	}
	@Test
	def void jerrySigueUnaDietaSaludable() {
		Assert.assertTrue(jerry.sigueUnaRutinaSaludable)
	}
}