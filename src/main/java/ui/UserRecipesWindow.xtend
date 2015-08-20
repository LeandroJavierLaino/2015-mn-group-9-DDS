package ui

import org.uqbar.arena.widgets.Panel
import cosasUsuario.Usuario
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import receta.Receta

@Observable
@Accessors
class UserRecipesWindow extends TransactionalDialog<UserRecipesModel> {
	
	new(WindowOwner owner, UserRecipesModel model) {
		super(owner, model)
		modelObject.owner = this
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Ver"
			onClick [| modelObject.verReceta()]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		mainPanel.width = 600
		title = "Bienvenido"
		var topPanel = new Panel(mainPanel)
		topPanel.layout = new HorizontalLayout
		new Label(topPanel).text = "Bienvenido: "
		new Label(topPanel).bindValueToProperty("user.nombre")
		
		new Label(mainPanel).text = "Recetas recientes"
		createResultsGrid(mainPanel)
	}
	
	def createResultsGrid(Panel panel) {
		val table = new Table<Receta>(panel, typeof(Receta)) => [
			bindItemsToProperty("resultados")
			bindValueToProperty("seleccionada")
		]
		describeResultsGrid(table)
	}
	
	def describeResultsGrid(Table<Receta> table) {
		
		modelObject.inspeccionarUsuario()
		
		new Column<Receta>(table) => [
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
	
}