package cosasUsuario

import repositorioUsuarios.RepositorioUsuarios

class UsuarioAdministrador extends Usuario{
	
	def aceptarSuscripcion(Usuario usuario){
		var repo = RepositorioUsuarios.getInstance
		repo.removerDeListaPendientes(usuario)
		repo.add(usuario)
	}
	
	def rechazarSuscripcion(Usuario usuario, String motivo){
		var repo = RepositorioUsuarios.getInstance
		repo.removerDeListaPendientes(usuario)
	}
	
	def listarPendientes(){
		var repo = RepositorioUsuarios.getInstance
		repo.listaPorAceptarse
	}
}