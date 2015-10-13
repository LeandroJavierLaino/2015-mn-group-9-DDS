package receta

import cosasUsuario.GrupoUsuario
import cosasUsuario.Usuario
import excepcion.RecetaInvalidaExcepcion
import excepcion.SinPermisosExcepcion
import java.util.ArrayList
import java.util.Collection
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import repositorioRecetas.RepositorioRecetas
import condicion.CondicionPreexistente
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.databind.annotation.JsonSerialize

@Accessors
@JsonIgnoreProperties(ignoreUnknown=true)
@JsonSerialize
class Receta {

	String nombrePlato
	Set<Ingrediente> ingredientes = new HashSet<Ingrediente>
	Set<Condimento> condimentos = new HashSet<Condimento>
	List<String> procesoPreparacion = new ArrayList<String>
	double totalCalorias
	String dificultad
	String temporada
	double cantidadMinimaCalorias = 10
	double cantidadMaximaCalorias = 5000
	Set<Receta> subRecetas = new HashSet<Receta>
	String creador
	Set<CondicionPreexistente> condicionesPreexistentes = new HashSet<CondicionPreexistente>
	Boolean esPublica

	def puedeSerCreada() {
		if (hayUnIngrediente(this.ingredientes) && totalDeCaloriasEnRango(this.totalCalorias)) {
			this
		} else {
			throw new RecetaInvalidaExcepcion("No está en el rango de calorías o no tiene un ingrediente la receta")
		}
	}

	def init() {
		esPublica = true
	}

	def hayUnIngrediente(Collection<Ingrediente> ingredientes) {
		ingredientes.size >= 1
	}

	def totalDeCaloriasEnRango(double totalCalorias) {
		(totalCalorias > cantidadMinimaCalorias) && (totalCalorias < cantidadMaximaCalorias)
	}

	def boolean puedeVerReceta(Usuario usuario) {

		esPublica != null && esPublica || (!creador.nullOrEmpty && usuario != null) && (usuario.comparteGrupoCon(creador) || creador.equals(usuario.nombre) || usuario.tieneLaReceta(this))
	}

	def boolean tienePermisosParaModificarReceta(Usuario usuario) {
		usuario.tieneLaReceta(this) || (RepositorioRecetas.getInstance.tieneLaReceta(this) && creador.equals(usuario.nombre))
	}

	def puedeModificarReceta(Usuario usuario) {
		if (tienePermisosParaModificarReceta(usuario) && puedeVerReceta(usuario)) {
		} else {
			throw new SinPermisosExcepcion("No puede ver o modificar la receta")
		}
	}

	def contieneComida(String unaComida, int unaCantidad) {
		condimentos.exists[condimento|condimento.esParteDe(unaComida, unaCantidad)] ||
			ingredientes.exists[ingrediente|ingrediente.esParteDe(unaComida, unaCantidad)]
	}

	def esRecomendablePara(Usuario unUsuario) {
		unUsuario.noTieneCondicionesPreexistentes() || unUsuario.condicionesPreexistentes.forall[it.tolera(this)]
	}

	def aniadirReceta(Receta receta) {
		subRecetas.add(receta)
	}

	def crearReceta(Usuario usuario) {
		puedeSerCreada()
		usuario.agregarReceta(this)
		creador = usuario.nombre
	}

	def modificarReceta(Usuario usuario, Receta recetaModificada) {
		puedeModificarReceta(usuario)
		var Receta recetaClon = this
		recetaClon.nombrePlato = recetaModificada.nombrePlato
		recetaClon.ingredientes = recetaModificada.ingredientes
		recetaClon.condimentos = recetaModificada.condimentos
		recetaClon.procesoPreparacion = recetaModificada.procesoPreparacion
		recetaClon.dificultad = recetaModificada.dificultad
		recetaClon.temporada = recetaModificada.temporada
		if (usuario.tieneLaReceta(recetaClon)) {
			usuario.borrarReceta(recetaClon)
			usuario.agregarReceta(recetaModificada)
		} else {
			usuario.agregarReceta(recetaModificada)
		}
	}

	def tieneUnIngredienteOCondimentoQueDisgustaPara(Usuario usuario) {
		ingredientes.exists[comidaQueDisgusta|usuario.contienteComidaQueDisgusta(comidaQueDisgusta)] ||
			condimentos.exists[comidaQueDisgusta|usuario.contienteComidaQueDisgusta(comidaQueDisgusta)]
	}

	def tieneUnIngredienteOCondimentoQueGustaPara(GrupoUsuario usuario) {
		ingredientes.exists[comidaQueGusta|usuario.perteneceALasPalabrasClave(comidaQueGusta)] ||
			condimentos.exists[comidaQueGusta|usuario.perteneceALasPalabrasClave(comidaQueGusta)]
	}

	def tieneExcesoDeCalorias() {
		totalCalorias > 500
	}

	def tieneIngredientesCaros() {
		ingredientes.forall[ingrediente|ingrediente.esCaro]
	}

	def esDificil() {
		dificultad.equalsIgnoreCase("Alta") || dificultad.equalsIgnoreCase("A") || dificultad.equalsIgnoreCase("D")
	}

	def asignarAutor(String string) {
		creador = string
	}

	def esInadecuadaParaLasCondiciones() {
		condicionesPreexistentes.filter[condicion|condicion.tolera(this)].toSet
	}

}
