package filtro

import cosasUsuario.Usuario
import receta.Receta

class FiltroSobrepeso extends FiltroDecorador{
	
	new(Filtro decorador) {
		super(decorador)
	}

	override filtrar(Usuario unUsuario,Receta unaReceta){
		if(unUsuario.tieneSobrepeso() && unUsuario.conoceReceta(unaReceta)){
			unUsuario.filtrar(unaReceta)
		}
		decorado.filtrar(unUsuario,unaReceta)
	}
	
}