package filtro

import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import cosasUsuario.Usuario
import java.util.List
import java.util.Set

@Accessors
class FiltroPosta implements Filtro {

	override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario) {
		unUsuario.recetasPorFiltros = recetasAFiltrar
	}
}