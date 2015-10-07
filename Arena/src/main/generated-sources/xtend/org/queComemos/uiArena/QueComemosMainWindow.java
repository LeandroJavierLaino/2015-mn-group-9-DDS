package org.queComemos.uiArena;

import AppModel.MainWindowApplicationModel;
import cosasUsuario.Usuario;
import cosasUsuario.UsuarioBuilder;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import receta.Receta;
import receta.RecetaBuilder;
import repositorioUsuarios.RepositorioUsuarios;

@SuppressWarnings("all")
public class QueComemosMainWindow extends MainWindow<MainWindowApplicationModel> {
  private Usuario pepe;
  
  private Receta recetaDePepe;
  
  public QueComemosMainWindow() {
    super(new MainWindowApplicationModel());
    RecetaBuilder _recetaBuilder = new RecetaBuilder();
    RecetaBuilder _nombre = _recetaBuilder.nombre("Nachos con Queso");
    RecetaBuilder _conCalorias = _nombre.conCalorias(500);
    RecetaBuilder _dificultad = _conCalorias.dificultad("Baja");
    RecetaBuilder _temporada = _dificultad.temporada("Otoño");
    Receta _build = _temporada.build();
    this.recetaDePepe = _build;
    UsuarioBuilder _usuarioBuilder = new UsuarioBuilder();
    UsuarioBuilder _conNombre = _usuarioBuilder.conNombre("Pepe");
    UsuarioBuilder _conReceta = _conNombre.conReceta(this.recetaDePepe);
    Usuario _build_1 = _conReceta.build();
    this.pepe = _build_1;
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    _instance.add(this.pepe);
    MainWindowApplicationModel _modelObject = this.getModelObject();
    _modelObject.setOwner(this);
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Autentificacion");
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    Label _label = new Label(mainPanel);
    _label.setText("Usuario");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        it.<Object, ControlBuilder>bindValueToProperty("usuario");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Contraseña");
    TextBox _textBox_1 = new TextBox(mainPanel);
    final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        it.<Object, ControlBuilder>bindValueToProperty("contrasenia");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_1);
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function_2 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar");
        final Action _function = new Action() {
          public void execute() {
            MainWindowApplicationModel _modelObject = QueComemosMainWindow.this.getModelObject();
            _modelObject.login();
          }
        };
        it.onClick(_function);
        it.setAsDefault();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_2);
    Label _label_2 = new Label(mainPanel);
    final Procedure1<Label> _function_3 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Autentificando");
        it.<Object, ControlBuilder>bindValueToProperty("logro");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_3);
  }
  
  public Usuario getUser(final String usuario) {
    RepositorioUsuarios _instance = RepositorioUsuarios.getInstance();
    return _instance.getUserByName(usuario);
  }
  
  public static void main(final String[] args) {
    new RepositorioUsuarios();
    QueComemosMainWindow _queComemosMainWindow = new QueComemosMainWindow();
    _queComemosMainWindow.startApplication();
  }
}
