package org.queComemos.uiArena;

import AppModel.UserRecipesModel;
import cosasUsuario.Usuario;
import java.awt.Color;
import org.apache.commons.collections15.Transformer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.BackgroundProvider;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.Observable;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import receta.Receta;

@Observable
@Accessors
@SuppressWarnings("all")
public class UserRecipesWindow extends TransactionalDialog<UserRecipesModel> {
  public UserRecipesWindow(final WindowOwner owner, final UserRecipesModel model) {
    super(owner, model);
    UserRecipesModel _modelObject = this.getModelObject();
    _modelObject.setOwner(this);
  }
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ver");
        final Action _function = new Action() {
          public void execute() {
            UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
            _modelObject.verReceta();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    mainPanel.setWidth(600);
    this.setTitle("Bienvenido");
    Panel topPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    topPanel.setLayout(_horizontalLayout);
    Label _label = new Label(topPanel);
    _label.setText("Bienvenido: ");
    Label _label_1 = new Label(topPanel);
    _label_1.<Object, ControlBuilder>bindValueToProperty("user.nombre");
    Label _label_2 = new Label(mainPanel);
    _label_2.setText("Recetas recientes");
    this.createResultsGrid(mainPanel);
  }
  
  public Column<Receta> createResultsGrid(final Panel panel) {
    Column<Receta> _xblockexpression = null;
    {
      Table<Receta> _table = new Table<Receta>(panel, Receta.class);
      final Procedure1<Table<Receta>> _function = new Procedure1<Table<Receta>>() {
        public void apply(final Table<Receta> it) {
          it.bindItemsToProperty("resultados");
          it.<Object, ControlBuilder>bindValueToProperty("seleccionada");
        }
      };
      final Table<Receta> table = ObjectExtensions.<Table<Receta>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describeResultsGrid(table);
    }
    return _xblockexpression;
  }
  
  public Column<Receta> describeResultsGrid(final Table<Receta> table) {
    Column<Receta> _xblockexpression = null;
    {
      UserRecipesModel _modelObject = this.getModelObject();
      _modelObject.inspeccionarUsuario();
      Column<Receta> _column = new Column<Receta>(table);
      final Procedure1<Column<Receta>> _function = new Procedure1<Column<Receta>>() {
        public void apply(final Column<Receta> it) {
          it.setTitle("Nombre");
          it.setFixedSize(200);
          it.bindContentsToProperty("nombrePlato");
          BackgroundProvider<Receta, Color> _bindBackground = it.bindBackground("creador.nombre");
          final Transformer<Object, Color> _function = new Transformer<Object, Color>() {
            public Color transform(final Object autor) {
              Color _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = Color.GRAY;
              } else {
                _xifexpression = Color.WHITE;
              }
              return _xifexpression;
            }
          };
          _bindBackground.setTransformer(_function);
        }
      };
      ObjectExtensions.<Column<Receta>>operator_doubleArrow(_column, _function);
      Column<Receta> _column_1 = new Column<Receta>(table);
      final Procedure1<Column<Receta>> _function_1 = new Procedure1<Column<Receta>>() {
        public void apply(final Column<Receta> it) {
          it.setTitle("Calorias");
          it.setFixedSize(100);
          it.bindContentsToProperty("totalCalorias");
          BackgroundProvider<Receta, Color> _bindBackground = it.bindBackground("creador.nombre");
          final Transformer<Object, Color> _function = new Transformer<Object, Color>() {
            public Color transform(final Object autor) {
              Color _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = Color.GRAY;
              } else {
                _xifexpression = Color.WHITE;
              }
              return _xifexpression;
            }
          };
          _bindBackground.setTransformer(_function);
        }
      };
      ObjectExtensions.<Column<Receta>>operator_doubleArrow(_column_1, _function_1);
      Column<Receta> _column_2 = new Column<Receta>(table);
      final Procedure1<Column<Receta>> _function_2 = new Procedure1<Column<Receta>>() {
        public void apply(final Column<Receta> it) {
          it.setTitle("Dificultad");
          it.setFixedSize(100);
          it.bindContentsToProperty("dificultad");
          BackgroundProvider<Receta, Color> _bindBackground = it.bindBackground("creador.nombre");
          final Transformer<Object, Color> _function = new Transformer<Object, Color>() {
            public Color transform(final Object autor) {
              Color _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = Color.GRAY;
              } else {
                _xifexpression = Color.WHITE;
              }
              return _xifexpression;
            }
          };
          _bindBackground.setTransformer(_function);
        }
      };
      ObjectExtensions.<Column<Receta>>operator_doubleArrow(_column_2, _function_2);
      Column<Receta> _column_3 = new Column<Receta>(table);
      final Procedure1<Column<Receta>> _function_3 = new Procedure1<Column<Receta>>() {
        public void apply(final Column<Receta> it) {
          it.setTitle("Temporada");
          it.setFixedSize(100);
          it.bindContentsToProperty("temporada");
          BackgroundProvider<Receta, Color> _bindBackground = it.bindBackground("creador.nombre");
          final Transformer<Object, Color> _function = new Transformer<Object, Color>() {
            public Color transform(final Object autor) {
              Color _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = Color.GRAY;
              } else {
                _xifexpression = Color.WHITE;
              }
              return _xifexpression;
            }
          };
          _bindBackground.setTransformer(_function);
        }
      };
      ObjectExtensions.<Column<Receta>>operator_doubleArrow(_column_3, _function_3);
      Column<Receta> _column_4 = new Column<Receta>(table);
      final Procedure1<Column<Receta>> _function_4 = new Procedure1<Column<Receta>>() {
        public void apply(final Column<Receta> it) {
          it.setTitle("Creador");
          it.setFixedSize(100);
          PropertyLabelProvider<Receta> _bindContentsToProperty = it.bindContentsToProperty("creador.nombre");
          final Transformer<Object, String> _function = new Transformer<Object, String>() {
            public String transform(final Object autor) {
              String _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = InputOutput.<String>print("Vos");
              } else {
                _xifexpression = InputOutput.<String>print(((String) autor));
              }
              return _xifexpression;
            }
          };
          _bindContentsToProperty.setTransformer(_function);
          BackgroundProvider<Receta, Color> _bindBackground = it.bindBackground("creador.nombre");
          final Transformer<Object, Color> _function_1 = new Transformer<Object, Color>() {
            public Color transform(final Object autor) {
              Color _xifexpression = null;
              UserRecipesModel _modelObject = UserRecipesWindow.this.getModelObject();
              Usuario _user = _modelObject.getUser();
              String _nombre = _user.getNombre();
              boolean _equalsIgnoreCase = ((String) autor).equalsIgnoreCase(_nombre);
              if (_equalsIgnoreCase) {
                _xifexpression = Color.GRAY;
              } else {
                _xifexpression = Color.WHITE;
              }
              return _xifexpression;
            }
          };
          _bindBackground.setTransformer(_function_1);
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Receta>>operator_doubleArrow(_column_4, _function_4);
    }
    return _xblockexpression;
  }
}
