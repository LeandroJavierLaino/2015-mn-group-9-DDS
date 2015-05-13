package filtro

import cosasUsuario.Usuario
import receta.Receta

class FiltroCaro extends FiltroDecorador {
	
	new(Filtro decorado){
		super(decorado)
	}
	
override filtrar(Usuario usuario,Receta receta){
	if(receta.tieneIngredientesCaros() && usuario.conoceReceta(receta)){
		usuario.filtrar(receta)
	}
	decorado.filtrar(usuario,receta)	
    }
}