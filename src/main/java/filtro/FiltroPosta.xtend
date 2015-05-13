package filtro

import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta
import cosasUsuario.Usuario
import excepcion.ExceptionReceta

@Accessors
class FiltroPosta implements Filtro {
	
	override filtrar(Usuario usuario,Receta receta) {
		if(!usuario.conoceReceta(receta)){
			throw new ExceptionReceta("usuario no conoce la receta")
		}
	}
	
}