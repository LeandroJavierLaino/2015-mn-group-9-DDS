package ar.edu.domain.consulta

import ar.edu.domain.cosasUsuario.Usuario
//import queComemos.entrega3.dominio.Receta
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.domain.receta.Receta

@Accessors
class Consulta {
	Usuario usuario
	Set<Receta> recetas
	
	new(Usuario usr, Set<Receta> vRecetas) {
		usuario = usr
		recetas = vRecetas
	}
}