package filtro

import receta.Receta
//import excepcion.ExceptionReceta
import java.util.List
import cosasUsuario.Usuario

class FiltroDisgusto extends FiltroDecorador{
	
	new(Filtro decorado) {
		super(decorado)
	}
	
override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario){
    var List<Receta> recetasFiltradas
    recetasFiltradas = recetasAFiltrar.filter[receta| unUsuario.leDisgusta(receta)].toList
	decorado.filtrar(recetasFiltradas,unUsuario)	
}
	
	
}