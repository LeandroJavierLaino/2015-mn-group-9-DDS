package org.queComemos.uiArena

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import receta.Receta
import java.awt.Color

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
			bindBackground("creador.nombre").transformer = [Object autor | if ((autor as String).equalsIgnoreCase(modelObject.user.nombre)) Color.GRAY else Color.WHITE ]
		]
		new Column<Receta> (table) => [
			title = "Calorias"
			fixedSize = 100
			bindContentsToProperty("totalCalorias")
			bindBackground("creador.nombre").transformer = [Object autor | if ((autor as String).equalsIgnoreCase(modelObject.user.nombre)) Color.GRAY else Color.WHITE ]
		]		
		new Column<Receta> (table) => [
			title = "Dificultad"
			fixedSize = 100
			bindContentsToProperty("dificultad")
			bindBackground("creador.nombre").transformer = [Object autor | if ((autor as String).equalsIgnoreCase(modelObject.user.nombre)) Color.GRAY else Color.WHITE ]
		] 
					
		new Column<Receta> (table) => [
			title = "Temporada"
			fixedSize = 100
			bindContentsToProperty("temporada")
			bindBackground("creador.nombre").transformer = [Object autor | if ((autor as String).equalsIgnoreCase(modelObject.user.nombre)) Color.GRAY else Color.WHITE ]
		]	
		new Column<Receta> (table) => [
			title = "Creador"
			fixedSize = 100
			bindContentsToProperty("creador.nombre").transformer = [Object autor | if((autor as String).equalsIgnoreCase(modelObject.user.nombre)) print("Vos") else print(autor as String)]
			bindBackground("creador.nombre").transformer = [Object autor | if ((autor as String).equalsIgnoreCase(modelObject.user.nombre)) Color.GRAY else Color.WHITE ]
		]
	
	}
	
}