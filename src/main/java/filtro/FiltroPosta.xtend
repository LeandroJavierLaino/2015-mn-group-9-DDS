package filtro

import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import cosasUsuario.Usuario
import java.util.List

@Accessors
class FiltroPosta implements Filtro {
	
	override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario) {
		recetasAFiltrar.toSet
	}

}