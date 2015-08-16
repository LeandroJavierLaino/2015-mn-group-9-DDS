
class RecetaWindow extends MainWindow<QueComemosReceta>{

	new() {
		super(new QueComemosReceta)
	}
			
override createContents(Panel mainPanel){
	this.setTitle("Detalle de Receta")
	mainPanel.setLayout(new VerticalLayout)
	
	var topPanel = new Panel(mainPanel)
	topPanel.setLayout(new VerticalLayout)
	new Label(topPanel).bindValueToProperty("nombre")
	new Label(topPanel).bindValueToProperty("calorias")
	new Label(topPanel).bindValueToProperty("creador")
	
	var midPanel = new Panel(mainPanel)
	midPanel.setLayout(new ColumnLayout(2))
	new Label(midPanel).setText("Dificultad")
	new Label(midPanel).setText("Temporada")
	new Label(midPanel).bindValueToProperty("dificultad")
	new Label(midPanel).bindValueToProperty("temporada")
	new Label(midPanel).setText("Ingredientes")
	new Label(midPanel).setText("Condimentos")
	var table = new Table<Ingrediente>(midPanel, typeof(Ingrediente)) => [
		 	height = 200
      		width = 450
      		bindItemsToProperty("resultados")
      		bindValueToProperty("ingredienteSeleccionado")
	]
	new Column<Ingrediente> (table) => [
		title = "Dosis"
		fixedsize = 100
		bindContentToProperty("dosis")
	]
	new Column<Ingrediente> (table) => [
		title = "Ingrediente"
		fixedsize = 200
		bindContentToProperty("ingrediente")
	]		
	new List(midPanel) => [
		allowNull(false)
		bindValueToProperty("condimentos")
	]
	new Label(midPanel).setText("")
	var checkFavorita = new CheckBox(form)
		checkFavorita.bindEnabledToProperty("habilitaFavorita")
		checkFavorita.bindValueToProperty("favorita")	
	new Label(midPanel).setText("Condiciones Preexistentes")	
	new List(midPanel) => [
		allowNull(false)
		bindValueToProperty("condicionesPreexistentes")
	]
	
	var botPanel = new Panel(mainPanel) 
	botPanel.setLayout(new VerticalLayout)
	new Label(botPanel).setText("Proceso de Preparacion")
	new Label(botPanel).bindValueToProperty("preparacion")
	new Button(botPanel) => [ 
		caption = "Volver"
		onClick [ | modelObject.volver ]
		bindEnabled(new NotNullObservable("volver"))
	]	
}	

	def static main(String[] args) {
		new RecetaWindow().startApplication
	}	
}