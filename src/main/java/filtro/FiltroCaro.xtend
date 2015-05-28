package filtro

import receta.Receta
import java.util.List
import cosasUsuario.Usuario

class FiltroCaro extends FiltroDecorador {
	
	new(Filtro decorado){
		super(decorado)
	}
	
override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario){
    var List<Receta> recetasFiltradas
    recetasFiltradas = recetasAFiltrar.filter[receta| receta.tieneIngredientesCaros()].toList
	decorado.filtrar(recetasFiltradas,unUsuario)	
    }
}