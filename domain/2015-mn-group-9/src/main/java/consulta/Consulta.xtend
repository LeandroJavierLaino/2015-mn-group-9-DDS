package consulta

import cosasUsuario.Usuario
//import queComemos.entrega3.dominio.Receta
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import receta.Receta

@Accessors
class Consulta {
	Usuario usuario
	Set<Receta> recetas
	
	new(Usuario usr, Set<Receta> vRecetas) {
		usuario = usr
		recetas = vRecetas
	}
}