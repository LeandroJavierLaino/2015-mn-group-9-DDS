package repositorioRecetas

import cosasUsuario.Usuario
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import receta.Receta
import receta.RecetaBuilder
import cosasUsuario.UsuarioBuilder
import org.joda.time.LocalDate
import receta.Ingrediente
import receta.Condimento

@Accessors
class RepositorioRecetas {
	Collection<Receta> recetas = new ArrayList<Receta>
	static RepositorioRecetas instance = null
	AdapterRepositorioRecetas adapter = new AdapterRepositorioRecetas
	
	Collection<Receta> recetasTotales = new ArrayList<Receta>
	
	//PARA EL EJEMPLO
	Receta recetaSalchiPapa
	Usuario nicolas
	Ingrediente salchicha
	Condimento ketchup
	
	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
		}
		instance
	}
	new() {
		
		salchicha = new Ingrediente("Salchichas", 12, "unidades")
		ketchup = new Condimento("ketchup", 200, "mililitros")
		
		recetaSalchiPapa = new RecetaBuilder()
		.nombre("SalchiPapa")
		.conCalorias(150)
		.dificultad("Baja")
		.pasoInstruccion("Hervir Salchichas")
		.pasoInstruccion("Freir Papas")
		.ingrediente(salchicha)
		.condimento(ketchup)
		.temporada("Verano")
		.build
		
		recetas.add(recetaSalchiPapa)
		
		nicolas = new UsuarioBuilder()
		.conNombre("Nicolas")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,11,10))
		.conAltura(1.74)
		.conPeso(60)
		.build
		
		recetaSalchiPapa.creador = nicolas

	}
	
	def tieneLaReceta(Receta receta) {
		(!recetas.nullOrEmpty) && recetas.contains(receta)
	}

	def listarRecetas() {
		recetas + obtenerRecetasExternas()
	}

	def agregar(Receta receta) {
		recetas.add(receta)
	}

	def quitar(Receta receta) {
		recetas.remove(receta)
	}

	def listarRecetasVisiblesPara(Usuario usuario) {
		listarRecetas.filter[unaReceta|unaReceta.puedeVerReceta(usuario)].toSet
	}
	
	def obtenerRecetasExternas(BusquedaRecetas busquedaRecetas) {
		adapter.obtenerRecetas(busquedaRecetas)
	}
	def obtenerRecetasExternas() {
		adapter.obtenerRecetas()
	}
	
}