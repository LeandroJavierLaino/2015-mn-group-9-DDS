package filtro

import cosasUsuario.Usuario
import receta.Receta

class FiltroConCondicion extends FiltroDecorador {
	
	new(Filtro decorado) {
		super(decorado)
	}
	
	override filtrar(Usuario unUsuario,Receta unaReceta){
		if(!unaReceta.esRecomendablePara(unUsuario) && unUsuario.conoceReceta(unaReceta)){
			unUsuario.filtrar(unaReceta)
		}
		else{
			decorado.filtrar(unUsuario,unaReceta)
		}
	}	
	
}