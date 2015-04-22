import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import java.util.HashSet

@Accessors
class RepositorioRecetas {
	public static Collection<Receta> recetas = new HashSet<Receta>
	
	static def agregarReceta(Receta receta){
		recetas.add(receta)
	}
	
	static def tieneLaReceta(Receta receta){
		recetas.contains(receta)
	}	
}