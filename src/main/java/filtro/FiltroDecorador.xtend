package filtro

import cosasUsuario.Usuario
import receta.Receta

abstract class FiltroDecorador implements Filtro {
	public Filtro decorado
	
	new(Filtro filtro){
		decorado=filtro
	}
	
	override filtrar(Usuario usuario,Receta receta){
		decorado.filtrar(usuario,receta)
	}
}