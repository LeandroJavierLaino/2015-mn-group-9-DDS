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

class QueComemosWindowPrincipal extends MainWindow<QueComemosPrincipal>{
		
	new() {
		super(new QueComemosPrincipal)
	}	
	
	override createContents(Panel mainPanel){
		
		this.setTitle("Bienvenido a �Que Comemos?")
		mainPanel.setLayout(new VerticalLayout)
		
		new Label(mainPanel).setText("Estas fueron las ultimas consultas")
		
		var table = new Table<Receta>(mainPanel, typeof(Receta)) => [
 	    	height = 200
      		width = 450
   			bindItemsToProperty("resultados")
     		bindValueToProperty("recetaSeleccionada")
     		bindEnabled(new NotNullObservable("ver"))                
		] 
	
		new Column<Receta> (table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
	
		new Column<Receta> (table) => [
			title = "Calorias"
			fixedSize = 200
			bindContentsToProperty("calorias")
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
		
		new Button(mainPanel) => [ 
			caption = "Ver"
			onClick [ | QueComemosPrincipal.ver ]
			bindEnabled(new NotNullObservable("ver"))
		]
		
	}
	
	def static main(String[] args) {
		new QueComemosWindowPrincipal().startApplication
	}	
}