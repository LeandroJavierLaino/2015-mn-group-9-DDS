package ar.edu.domain.receta

import java.util.Set
import java.util.List
import ar.edu.domain.repositorioRecetas.RepositorioRecetas

class RecetaBuilder {
	
	Receta receta = new Receta()
	
	def RecetaBuilder nombre(String nombreDelPlato){
		receta.nombrePlato = nombreDelPlato	
		this
	}
	def RecetaBuilder ingrediente(Ingrediente vIngrediente) {
		receta.ingredientes.add(vIngrediente)
		this
	}
	def RecetaBuilder ingredientes(Set<Ingrediente> vIngredientes) {
		receta.ingredientes.addAll(vIngredientes)
		this
	}
	def RecetaBuilder condimento(Condimento vCondimento) {
		receta.condimentos.add(vCondimento)
		this
	}
	def RecetaBuilder condimentos(Set<Condimento> vCondimentos) {
		receta.condimentos.addAll(vCondimentos)
		this
	}
	def RecetaBuilder pasoInstruccion(String paso) {
		receta.procesoPreparacion.add(paso)
		this
	}
	def RecetaBuilder instrucciones(List<String> pasos) {
		receta.procesoPreparacion.addAll(pasos)
		this
	}
	def RecetaBuilder conCalorias(double calorias) {
		receta.totalCalorias = calorias
		this
	}
	def RecetaBuilder dificultad(String nivel) {
		receta.dificultad = nivel
		this
	}
	def RecetaBuilder temporada(String temporada) {
		receta.temporada = temporada
		this
	}
	def RecetaBuilder esPublica() {
		receta.esPublica = true
		this
	}
	def RecetaBuilder esPrivada() {
		receta.esPublica = false
		this
	}
	def RecetaBuilder creadaPor(String creador) {
		receta.creador = creador
		this
	}
	def Receta build() {
		RepositorioRecetas.instance.agregar(receta)
		receta
	}

}