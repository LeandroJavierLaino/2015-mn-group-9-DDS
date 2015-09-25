

import receta.Receta
import cosasUsuario.Usuario
import receta.Ingrediente
import receta.Condimento
import cosasUsuario.UsuarioBuilder
import receta.RecetaBuilder
import org.joda.time.LocalDate

class Iniciador {
	
	Receta recetaSalchiPapa
	Usuario nicolas
	Usuario leandro
	Ingrediente salchicha
	Condimento ketchup
	
	new() {
		
		salchicha = new Ingrediente("Salchicha", 12, "unidades")
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
		
		recetaSalchiPapa.creador = nicolas
	}
}