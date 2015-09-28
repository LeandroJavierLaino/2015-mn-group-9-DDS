import receta.Receta
import cosasUsuario.Usuario
import receta.Ingrediente
import receta.Condimento
import cosasUsuario.UsuarioBuilder
import receta.RecetaBuilder
import org.joda.time.LocalDate
import consulta.MonitorRecetas
import consulta.MonitorHora
import consulta.MonitorRecetasM
import consulta.MonitorRecetasF
import org.joda.time.DateTime
import consulta.GestorDeConsultas
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import java.util.Set
import java.util.HashSet
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import repositorioRecetas.RepositorioRecetas

class Iniciador {
	
	Receta recetaSalchiPapa
	Usuario nicolas
	Usuario leandro
	Ingrediente salchicha
	Condimento ketchup
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	Set<Receta> recetasFiltradas = new HashSet<Receta>
	MonitorHora monitorHora
	MonitorRecetas monitorRecetas
	MonitorRecetasM monitorRecetasHombre
	MonitorRecetasF monitorRecetasMujer
	DateTime time
	int hora
	
	new() {
		
		salchicha = new Ingrediente => [
			nombre = "Salchicha"
			cantidad = 12
			tipo =  "unidades"
		]
		ketchup = new Condimento => [ 
			nombre = "ketchup"
			cantidad = 200
			tipo =  "mililitros"	
		]
		
		recetaSalchiPapa = new RecetaBuilder()
		.nombre("SalchiPapa")
		.conCalorias(150)
		.dificultad("Baja")
		.pasoInstruccion("Hervir Salchichas")
		.pasoInstruccion("Freir Papas")
		.ingrediente(salchicha)
		.condimento(ketchup)
		.temporada("Verano")
		.esPrivada
		.creadaPor("Nicolas")
		.build
		
		
		nicolas = new UsuarioBuilder()
		.conNombre("Nicolas")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,11,10))
		.conAltura(1.74)
		.conPeso(60)
		.conPass("123")
		.build
		
		leandro = new UsuarioBuilder()
		.conNombre("Leandro")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1988,6,27))
		.conPeso(70)
		.conAltura(1.74)
		.conPass("123")
		.build
		
		RepositorioRecetas.instance.cargarTodasLasRecetas
		
		//CONSULTAS
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		
		monitorHora = new MonitorHora
		monitorRecetas = new MonitorRecetas
		monitorRecetasHombre = new MonitorRecetasM
		monitorRecetasMujer = new MonitorRecetasF
		
		time = new DateTime()
		hora = time.getHourOfDay()
		
		GestorDeConsultas.getInstance.monitores.add(monitorHora)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetas)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasHombre)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasMujer)
		
		nicolas.recetasFavoritas.add(recetaSalchiPapa)
		nicolas.habilitarFavoritos = true
		
		nicolas.procesamiento = new ProcesamientoOrdenarlosPorNombre
		
		leandro.procesamiento = new ProcesamientoOrdenarlosPorNombre
		leandro.filtrosAAplicar.add(filtroGusto) 
		
	}
}