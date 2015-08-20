package uiArena


import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import receta.Ingrediente
import receta.Receta
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner

class RecetaWindow extends TransactionalDialog<Receta>{

Receta receta1	
	new(WindowOwner owner, Receta model) {
		super(owner, model)
		title = "Detalle de Receta"
	}
	
	
			
	override createFormPanel(Panel mainPanel){
		
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
		/*var table = new Table<Ingrediente>(midPanel, typeof(Ingrediente)) => [
			 	height = 200
    	  		width = 450
    	  		bindItemsToProperty("ingredientes")
    	  		bindValueToProperty("seleccionarIngrediente")
		]
		new Column<Ingrediente> (table) => [
			title = "Dosis"
			fixedSize = 100
			bindContentsToProperty("cantidad")
		]
		new Column<Ingrediente> (table) => [
			title = "Ingrediente"
			fixedSize = 200
			bindContentsToProperty("ingrediente")
		]
		new List(midPanel) => [
			allowNull(false)
			bindValueToProperty("condimentos")
		]
		new Label(midPanel).setText("")
		var checkFavorita = new CheckBox(midPanel)
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
		]	*/
	}	
	override protected addActions(Panel actions) {
		new Button(actions)
			.setCaption("Cerrar")
			.onClick [| this.close]
			
	}
	def init() {
		receta1 = new receta.RecetaBuilder()
			.nombre("Nachos")
			.conCalorias(500)
			.dificultad("baja")
			.temporada("Invierno")
			.build
	}
}