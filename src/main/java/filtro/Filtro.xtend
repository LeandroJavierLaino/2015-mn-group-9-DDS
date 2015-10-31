package filtro

import cosasUsuario.Usuario
import java.util.Set
import org.uqbar.commons.utils.TransactionalAndObservable
import receta.Receta
import uqbar.arena.persistence.annotations.PersistentClass

@PersistentClass
@TransactionalAndObservable
interface Filtro {
	def Set<Receta> filtrar(Set<Receta> recetas,Usuario usuario)
}