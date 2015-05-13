package filtro

import cosasUsuario.Usuario
import receta.Receta

class FiltroDisgusto extends FiltroDecorador{
	
	new(Filtro decorado) {
		super(decorado)
	}
	
override filtrar(Usuario unUsuario,Receta unaReceta){
	if(unUsuario.leDisgusta(unaReceta) && unUsuario.conoceReceta(unaReceta)){
		unUsuario.filtrar(unaReceta)
	}
	decorado.filtrar(unUsuario,unaReceta)
}
	
	
}