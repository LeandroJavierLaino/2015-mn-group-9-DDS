package filtro

import cosasUsuario.Usuario
import java.util.Set
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta

@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
@Entity
@Accessors
abstract class Filtro {
	@Id	@GeneratedValue(strategy=GenerationType.TABLE)
	private long idFiltro	
	def Set<Receta> filtrar(Set<Receta> recetas,Usuario usuario)
}