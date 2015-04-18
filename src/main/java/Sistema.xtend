import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import java.util.HashSet

@Accessors
class Sistema {
	static Collection<Receta> recetas = new HashSet<Receta>
	
	static def tieneLaReceta(Receta receta){
		recetas.contains(receta)
	}
}