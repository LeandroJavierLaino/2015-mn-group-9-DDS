package uiArena

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import receta.Receta
import cosasUsuario.Usuario

@Accessors
class QueComemosPrincipal {
	Set<Receta> resultados  
	Receta seleccionada		
	
	def static String ver() {
		
	}
	
	def Receta recetaSeleccionada(){
		seleccionada
	}
	
	def getResultados (Usuario unUsuario){
		resultados = unUsuario.recetas
	}
/* 	def static Set<Receta> getRecetasDeUsuario(Usuario unUsuario){
		unUsuario.recetas
	}*/
}