package uiMain

class QueComemosMainWindow extends MainWindow<QueComemosPrincipal> {
	
	new() {
		super(new QueComemosPrincipal)
	}	
	
	override createContents(Panel mainPanel){
		this.setTitle("Bienvenido a ¿Que Comemos?")
		mainPanel.setLayout(new VerticalLayout)
		
		new Label(mainPanel).setText("Estas fueron las ultimas consultas")
		
		var table = new Table<Receta>(mainPanel, typeof(Receta)) => [
 	    	height = 200
      		width = 450
      		bindItemsToProperty("resultados")
      		bindValueToProperty("recetaSeleccionada")                
		]
		
		new Column<Receta> (table) => [
			title = "Nombre"
			fixedsize = 200
			bindContentToProperty("nombre")
		]
		
		new Column<Receta> (table) => [
			title = "Calorias"
			fixedsize = 200
			bindContentToProperty("calorias")
		]		
		
		new Column<Receta> (table) => [
			title = "Dificultad"
			fixedsize = 200
			bindContentToProperty("dificultad")
		]
				
		new Column<Receta> (table) => [
			title = "Temporada"
			fixedsize = 200
			bindContentToProperty("temporada")
		]	
		
		new Button(mainPanel) => [ 
			caption = "Ver"
			onClick [ | modelObject.ver ]
			bindEnabled(new NotNullObservable("ver"))
		]
		
	}
	
	def static main(String[] args) {
		new QueComemosMainWindow().startApplication
	}	
}