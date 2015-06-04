package filtro

import cosasUsuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta

@Accessors
class FiltroPosta implements Filtro {

	override List<Receta> filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario) {
		recetasAFiltrar
	}
}