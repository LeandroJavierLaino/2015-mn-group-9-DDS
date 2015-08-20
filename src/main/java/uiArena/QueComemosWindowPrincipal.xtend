package uiArena

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import receta.Receta
import cosasUsuario.Usuario
import receta.RecetaBuilder
import cosasUsuario.UsuarioBuilder
import repositorioUsuarios.RepositorioUsuarios

class QueComemosWindowPrincipal extends MainWindow<QueComemosPrincipal>{
	
	Usuario pepe
	Receta recetaDePepe
		
	new(Usuario usuario) {
		super(new QueComemosPrincipal(usuario))
		
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
	}	
	
	override createContents(Panel mainPanel){
		
		this.setTitle("Bienvenido a ¿Que Comemos?")
		mainPanel.setLayout(new VerticalLayout)
		
		new Label(mainPanel).setText("Estas fueron las ultimas consultas")
		
		this.createResultsGrid(mainPanel)
		
		new Button(mainPanel) => [ 
			caption = "Ver"
			onClick [ | new RecetaWindow(this, new Receta).open ]
		]
		
	}
	def protected createResultsGrid(Panel mainPanel) {
			val table = new Table<Receta>(mainPanel, typeof(Receta)) => [
				bindItemsToProperty("resultados")
				bindValueToProperty("recetaSeleccionada")
			]
			this.describeResultsGrid(table)
	}
	def void describeResultsGrid(Table<Receta> table) {
		
		new Column<Receta> (table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombrePlato")
		]
	
		new Column<Receta> (table) => [
			title = "Calorias"
			fixedSize = 200
			bindContentsToProperty("totalCalorias")
		]		
	
		new Column<Receta> (table) => [
			title = "Dificultad"
			fixedSize = 200
			bindContentsToProperty("dificultad")
		] 
					
		new Column<Receta> (table) => [
			title = "Temporada"
			fixedSize = 200
			bindContentsToProperty("temporada")
		]	
	}
		
	
	def static main(String[] args) {
		new QueComemosWindowPrincipal(new Usuario).startApplication
	}	
}