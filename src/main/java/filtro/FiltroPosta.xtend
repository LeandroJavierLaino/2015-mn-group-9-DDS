package filtro

import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import cosasUsuario.Usuario

@Accessors
class FiltroPosta implements Filtro {
	
	override filtrar(Usuario usuario,Receta receta) {
		if(usuario.conoceReceta(receta)){
			usuario.agregarRecetaAFiltradas(receta)
		}
		else{
			throw new ExceptionReceta("usuario no conoce la receta")
		}
	}
	
}