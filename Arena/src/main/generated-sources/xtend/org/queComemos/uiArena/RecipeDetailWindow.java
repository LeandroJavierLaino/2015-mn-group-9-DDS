package org.queComemos.uiArena;

import AppModel.RecipeModel;
import org.apache.commons.collections15.Transformer;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;
import receta.Ingrediente;

@SuppressWarnings("all")
public class RecipeDetailWindow extends TransactionalDialog<RecipeModel> {
  public RecipeDetailWindow(final WindowOwner owner, final RecipeModel model) {
    super(owner, model);
  }
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Volver");
        final Action _function = new Action() {
          public void execute() {
            RecipeDetailWindow.this.close();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Detalles de la Receta");
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    RecipeModel _modelObject = this.getModelObject();
    _modelObject.inspeccionarReceta();
    final Panel topPanel = new Panel(mainPanel);
    VerticalLayout _verticalLayout_1 = new VerticalLayout();
    topPanel.setLayout(_verticalLayout_1);
    Label _label = new Label(topPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setFontSize(24);
        it.<Object, ControlBuilder>bindValueToProperty("nombrePlato");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
    final Panel subTopPanel = new Panel(topPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    subTopPanel.setLayout(_horizontalLayout);
    final Panel caloriasPanel = new Panel(subTopPanel);
    HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
    caloriasPanel.setLayout(_horizontalLayout_1);
    Label _label_1 = new Label(caloriasPanel);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Calorias: ");
        it.setFontSize(12);
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
    Label _label_2 = new Label(caloriasPanel);
    final Procedure1<Label> _function_2 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setFontSize(12);
        it.<Object, ControlBuilder>bindValueToProperty("totalCalorias");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
    Label _label_3 = new Label(subTopPanel);
    final Procedure1<Label> _function_3 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setFontSize(12);
        it.setText("Creado por: ");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
    Label _label_4 = new Label(subTopPanel);
    final Procedure1<Label> _function_4 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setFontSize(12);
        it.<Object, ControlBuilder>bindValueToProperty("creador.nombre");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
    final Panel midPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    midPanel.setLayout(_columnLayout);
    final Panel dificultadPanel = new Panel(midPanel);
    VerticalLayout _verticalLayout_2 = new VerticalLayout();
    dificultadPanel.setLayout(_verticalLayout_2);
    Label _label_5 = new Label(dificultadPanel);
    _label_5.setText("Dificultad:");
    Label _label_6 = new Label(dificultadPanel);
    _label_6.<Object, ControlBuilder>bindValueToProperty("dificultad");
    final Panel temporadaPanel = new Panel(midPanel);
    VerticalLayout _verticalLayout_3 = new VerticalLayout();
    temporadaPanel.setLayout(_verticalLayout_3);
    Label _label_7 = new Label(temporadaPanel);
    _label_7.setText("Temporada");
    Label _label_8 = new Label(temporadaPanel);
    _label_8.<Object, ControlBuilder>bindValueToProperty("temporada");
    final Panel ingredientesPanel = new Panel(midPanel);
    VerticalLayout _verticalLayout_4 = new VerticalLayout();
    ingredientesPanel.setLayout(_verticalLayout_4);
    Label _label_9 = new Label(ingredientesPanel);
    _label_9.setText("Ingredientes");
    this.createIngredientsGrid(ingredientesPanel);
    Panel condimentosPanel = new Panel(midPanel);
    VerticalLayout _verticalLayout_5 = new VerticalLayout();
    condimentosPanel.setLayout(_verticalLayout_5);
    Label _label_10 = new Label(condimentosPanel);
    _label_10.setText("Condimentos");
    List<Object> _list = new List<Object>(condimentosPanel);
    final Procedure1<List<Object>> _function_5 = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.setWidth(150);
        it.allowNull(false);
        Binding<?, Selector<Object>, ListBuilder<Object>> _bindItemsToProperty = it.bindItemsToProperty("condimentos");
        _bindItemsToProperty.toString();
        it.<Object, ControlBuilder>bindValueToProperty("condimentoSeleccionado");
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function_5);
    final Panel favPanel = new Panel(midPanel);
    HorizontalLayout _horizontalLayout_2 = new HorizontalLayout();
    favPanel.setLayout(_horizontalLayout_2);
    Label _label_11 = new Label(favPanel);
    _label_11.setText("Favorita");
    CheckBox _checkBox = new CheckBox(favPanel);
    _checkBox.<Object, ControlBuilder>bindValueToProperty("esFavorita");
    final Panel condPanel = new Panel(midPanel);
    VerticalLayout _verticalLayout_6 = new VerticalLayout();
    condPanel.setLayout(_verticalLayout_6);
    Label _label_12 = new Label(condPanel);
    _label_12.setText("Condiciones Preexistentes");
    List<Object> _list_1 = new List<Object>(condPanel);
    final Procedure1<List<Object>> _function_6 = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.setWidth(150);
        it.allowNull(false);
        it.bindItemsToProperty("condicionesPreexistentes");
        it.<Object, ControlBuilder>bindValueToProperty("condSelec");
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list_1, _function_6);
    Panel botPanel = new Panel(mainPanel);
    VerticalLayout _verticalLayout_7 = new VerticalLayout();
    botPanel.setLayout(_verticalLayout_7);
    Label _label_13 = new Label(botPanel);
    _label_13.setText("Proceso de Preparacion");
    Label _label_14 = new Label(botPanel);
    _label_14.<Object, ControlBuilder>bindValueToProperty("preparacion");
  }
  
  public Column<Ingrediente> createIngredientsGrid(final Panel panel) {
    Column<Ingrediente> _xblockexpression = null;
    {
      Table<Ingrediente> _table = new Table<Ingrediente>(panel, Ingrediente.class);
      final Procedure1<Table<Ingrediente>> _function = new Procedure1<Table<Ingrediente>>() {
        public void apply(final Table<Ingrediente> it) {
          RecipeDetailWindow.this.setMinHeight(200);
          it.setWidth(300);
          it.bindItemsToProperty("ingredientes");
          it.<Object, ControlBuilder>bindValueToProperty("ingredienteSeleccionado");
        }
      };
      final Table<Ingrediente> ingredientesTable = ObjectExtensions.<Table<Ingrediente>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describeResultsGrid(ingredientesTable);
    }
    return _xblockexpression;
  }
  
  public Column<Ingrediente> describeResultsGrid(final Table<Ingrediente> ingredientesTable) {
    Column<Ingrediente> _xblockexpression = null;
    {
      RecipeModel _modelObject = this.getModelObject();
      _modelObject.inspeccionarReceta();
      Column<Ingrediente> _column = new Column<Ingrediente>(ingredientesTable);
      final Procedure1<Column<Ingrediente>> _function = new Procedure1<Column<Ingrediente>>() {
        public void apply(final Column<Ingrediente> it) {
          it.setTitle("Dosis");
          it.setFixedSize(50);
          PropertyLabelProvider<Ingrediente> _bindContentsToProperty = it.bindContentsToProperty("cantidad");
          final Transformer<Object, String> _function = new Transformer<Object, String>() {
            public String transform(final Object cant) {
              String _plus = (cant + " ");
              return InputOutput.<String>println(_plus);
            }
          };
          _bindContentsToProperty.setTransformer(_function);
        }
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column, _function);
      Column<Ingrediente> _column_1 = new Column<Ingrediente>(ingredientesTable);
      final Procedure1<Column<Ingrediente>> _function_1 = new Procedure1<Column<Ingrediente>>() {
        public void apply(final Column<Ingrediente> it) {
          it.setTitle("Ingrediente");
          it.setFixedSize(200);
          it.bindContentsToProperty("nombre");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_1, _function_1);
    }
    return _xblockexpression;
  }
}
