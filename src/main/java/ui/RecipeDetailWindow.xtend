package ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import receta.Ingrediente
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.CheckBox

class RecipeDetailWindow extends TransactionalDialog<RecipeModel> {
	
	new(WindowOwner owner, RecipeModel model) {
		super(owner, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Volver"
			onClick [| close()]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Detalles de la Receta"
		mainPanel.layout = new VerticalLayout
		modelObject.inspeccionarReceta
		
		val topPanel = new Panel(mainPanel)
		topPanel.layout = new VerticalLayout
		new Label(topPanel).bindValueToProperty("nombrePlato")
		
		val subTopPanel = new Panel(topPanel)
		subTopPanel.layout = new HorizontalLayout
		
		val caloriasPanel = new Panel(subTopPanel)
		caloriasPanel.layout = new HorizontalLayout
		
		new Label(caloriasPanel).text = "Calorias: "
		new Label(caloriasPanel).bindValueToProperty("totalCalorias")
		
		new Label(subTopPanel).text = "Creado por: "
		new Label(subTopPanel).bindValueToProperty("creador.nombre")
		
		val midPanel = new Panel(mainPanel)
		midPanel.layout = new ColumnLayout(2)

		val dificultadPanel = new Panel(midPanel)
		dificultadPanel.layout = new VerticalLayout
		new Label(dificultadPanel).text = "Dificultad:"
		new Label(dificultadPanel).bindValueToProperty("dificultad")
		
		val temporadaPanel = new Panel(midPanel)
		temporadaPanel.layout = new VerticalLayout
		new Label(temporadaPanel).text = "Temporada"
		new Label(temporadaPanel).bindValueToProperty("temporada")
		
		val ingredientesPanel = new Panel(midPanel)
		ingredientesPanel.layout = new VerticalLayout
		new Label(ingredientesPanel).text = "Ingredientes"
		createIngredientsGrid(ingredientesPanel)
		
		var condimentosPanel = new Panel(midPanel)
		condimentosPanel.layout = new VerticalLayout
		new Label(condimentosPanel).text = "Condimentos"
		new List(condimentosPanel) => [
			width = 150
			allowNull(false)
			bindValueToProperty("condimentos")
		]
		
		val favPanel = new Panel(midPanel)
		favPanel.layout = new HorizontalLayout
		new Label(favPanel).text = "Favorita"
		new CheckBox(favPanel).bindValueToProperty("esFavorita")
		
		val condPanel = new Panel(midPanel)
		condPanel.layout = new VerticalLayout
		new Label(condPanel).setText("Condiciones Preexistentes")	
		new List(condPanel) => [
			width = 150
			allowNull(false)
			bindValueToProperty("condicionesPreexistentes")
		]
		
		var botPanel = new Panel(mainPanel) 
		botPanel.setLayout(new VerticalLayout)
		new Label(botPanel).setText("Proceso de Preparacion")
		new Label(botPanel).bindValueToProperty("preparacion")
	}
	
	def createIngredientsGrid(Panel panel) {
		val ingredientesTable = new Table<Ingrediente>(panel, Ingrediente) => [
			
			width = 300
			bindItemsToProperty("ingredientes")
			bindValueToProperty("ingredienteSeleccionado")
		]
		describeResultsGrid(ingredientesTable)
	}
	
	def describeResultsGrid(Table<Ingrediente> ingredientesTable) {
		
		modelObject.inspeccionarReceta
		new Column<Ingrediente> (ingredientesTable) => [
			title = "Dosis"
			fixedSize = 100
			bindContentsToProperty("cantidad")
		]
		new Column<Ingrediente> (ingredientesTable) => [
			title = "Ingrediente"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
	}
	
}