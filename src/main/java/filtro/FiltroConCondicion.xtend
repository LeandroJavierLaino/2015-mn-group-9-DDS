package filtro

import cosasUsuario.Usuario
import receta.Receta
import java.util.List

class FiltroConCondicion extends FiltroDecorador {
	
	new(Filtro decorado) {
		super(decorado)
	}
	
	override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario){
	 var List<Receta> recetasFiltradas
    recetasFiltradas = recetasAFiltrar.filter[receta| receta.esRecomendablePara(unUsuario)].toList
	decorado.filtrar(recetasFiltradas,unUsuario)
	}	
	
}