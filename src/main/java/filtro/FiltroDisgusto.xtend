package filtro

import cosasUsuario.Usuario
import receta.Receta
import excepcion.ExceptionReceta

class FiltroDisgusto extends FiltroDecorador{
	
	new(Filtro decorado) {
		super(decorado)
	}
	
override filtrar(Usuario unUsuario,Receta unaReceta){
	try unUsuario.leDisgusta(unaReceta) 
	catch(ExceptionReceta error){
		unUsuario.filtrar(unaReceta)
	}
	decorado.filtrar(unUsuario,unaReceta)
}
	
	
}