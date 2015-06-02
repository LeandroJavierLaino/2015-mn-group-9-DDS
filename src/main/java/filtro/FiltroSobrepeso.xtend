package filtro

import cosasUsuario.Usuario
import receta.Receta
import java.util.List

class FiltroSobrepeso extends FiltroDecorador{
	
	new(Filtro decorador) {
		super(decorador)
	}

	override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario){
	var List<Receta> recetasFiltradas
	if(unUsuario.tieneSobrepeso){
    recetasFiltradas = recetasAFiltrar.filter[receta| receta.superaCalorias()].toList
	decorado.filtrar(recetasFiltradas,unUsuario)
	//	if(unUsuario.tieneSobrepeso() && unaReceta.cantidadMaximaCalorias >= 500 && unUsuario.conoceReceta(unaReceta)){
	//		unUsuario.filtrar(unaReceta)
		}
	else{
		decorado.filtrar(recetasAFiltrar,unUsuario)
	}	
	}
	
}