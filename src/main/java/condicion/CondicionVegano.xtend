package condicion
import cosasUsuario.Usuario
import receta.Receta
import excepcion.CondPreexistenteExcepcion
import uqbar.arena.persistence.annotations.PersistentClass

//Nuevas excepciones modificadas
class CondicionVegano implements CondicionPreexistente {

	override valido(Usuario unUsuario) {

		if(unUsuario.comidaPreferida.contains("Carne") || unUsuario.comidaPreferida.contains("Pollo") || 
			unUsuario.comidaPreferida.contains("Chivito") || unUsuario.comidaPreferida.contains("Chori")) {
				
			throw new CondPreexistenteExcepcion("Le gustan alimentos no propios de un vegano")
		}
		else true

	}

	override tieneRutinaSaludable(Usuario unUsuario) {

		if (unUsuario.comidaPreferida.nullOrEmpty) throw new CondPreexistenteExcepcion("La lista comidaPreferida no se declaro o esta vacia")

		unUsuario.comidaPreferida.contains("Fruta")
	}

	override tolera(Receta unaReceta) {
		(!unaReceta.contieneComida("carne",1) && !unaReceta.contieneComida("pollo",1) && !unaReceta.contieneComida ("chivito",1) &&
			!unaReceta.contieneComida("chori",1))
	}
	
	override esCondicionVegana(){
		true
	}
}
