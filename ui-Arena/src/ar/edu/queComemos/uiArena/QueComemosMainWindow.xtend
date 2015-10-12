package ar.edu.queComemos.uiArena

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import ar.edu.domain.repositorioUsuarios.RepositorioUsuarios
import ar.edu.domain.cosasUsuario.Usuario
import ar.edu.domain.cosasUsuario.UsuarioBuilder
import ar.edu.domain.receta.Receta
import ar.edu.domain.receta.RecetaBuilder
import ar.edu.appModel.MainWindowApplicationModel

class QueComemosMainWindow extends MainWindow<MainWindowApplicationModel> {
	
	Usuario pepe
	Receta recetaDePepe
	
	new() {
		super(new MainWindowApplicationModel)
		
		recetaDePepe = new RecetaBuilder()
			.nombre("Nachos con Queso")
			.conCalorias(500)
			.dificultad("Baja")
			.temporada("Otoño")
			.build
		
		pepe = new UsuarioBuilder()
			.conNombre("Pepe")
			.conReceta(recetaDePepe)
			.build
		
		RepositorioUsuarios.getInstance.add(pepe)
		
		modelObject.owner = this
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Autentificacion"
		
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = "Usuario"
		new TextBox(mainPanel) => [
			bindValueToProperty("usuario")
			width = 200
		]
		new Label(mainPanel).text = "Contraseña"
		new TextBox(mainPanel) => [
			bindValueToProperty("contrasenia")
			width = 200
		]
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [| modelObject.login]
			setAsDefault
		]
		new Label(mainPanel) => [
			text = "Autentificando"
			bindValueToProperty("logro")
		]
			
	}
	
	def Usuario getUser(String usuario) {
		RepositorioUsuarios.instance.getUserByName(usuario)
	}
	
	
	def static main(String[] args) {
		new RepositorioUsuarios
		
		new QueComemosMainWindow().startApplication
	}
}