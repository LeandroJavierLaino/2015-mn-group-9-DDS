package filtro


import receta.Receta
import java.util.List
import cosasUsuario.Usuario

abstract class FiltroDecorador implements Filtro {
	public Filtro decorado
	
	new(Filtro filtro){
		decorado=filtro
	}
	
	override filtrar(List<Receta> recetasAFiltrar,Usuario unUsuario){
		decorado.filtrar(recetasAFiltrar,unUsuario)
	}
}