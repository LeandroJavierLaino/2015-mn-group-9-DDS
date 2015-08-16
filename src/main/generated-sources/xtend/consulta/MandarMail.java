package consulta;

import com.google.common.base.Objects;
import consulta.Consulta;
import consulta.Monitor;
import cosasUsuario.Usuario;
import email.Email;
import filtro.Filtro;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import procesamientoPosterior.ProcesamientoPosterior;

@SuppressWarnings("all")
public class MandarMail implements Monitor {
  private static String NOMBRE = "Jcontardo";
  
  private static String ADMIN;
  
  public void monitorear(final Consulta consulta) {
    Usuario _usuario = consulta.getUsuario();
    String _nombre = _usuario.getNombre();
    boolean _equals = Objects.equal(_nombre, MandarMail.NOMBRE);
    if (_equals) {
      final String filtros = this.obtenerNombresDeClases(consulta);
      Email _email = new Email();
      final Procedure1<Email> _function = new Procedure1<Email>() {
        public void apply(final Email it) {
          it.setFrom("Sistema");
          it.setTo(MandarMail.ADMIN);
          it.setSubject(("Resultados de consulta del usuario " + MandarMail.NOMBRE));
          it.setContent(((("Nombre de Usuario: " + MandarMail.NOMBRE) + "\nFiltros y Procesamiento: ") + filtros));
        }
      };
      Email correo = ObjectExtensions.<Email>operator_doubleArrow(_email, _function);
    }
  }
  
  public String mostrarResultados() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public String obtenerNombresDeClases(final Consulta consulta) {
    String _xblockexpression = null;
    {
      String nombresClaseFiltros = null;
      Usuario _usuario = consulta.getUsuario();
      List<Filtro> _filtrosAAplicar = _usuario.getFiltrosAAplicar();
      for (final Filtro filtro : _filtrosAAplicar) {
        Class<? extends Filtro> _class = filtro.getClass();
        String _string = _class.toString();
        String _plus = ((nombresClaseFiltros + ", ") + _string);
        nombresClaseFiltros = _plus;
      }
      Usuario _usuario_1 = consulta.getUsuario();
      ProcesamientoPosterior _procesamiento = _usuario_1.getProcesamiento();
      String _string_1 = _procesamiento.toString();
      _xblockexpression = (nombresClaseFiltros + _string_1);
    }
    return _xblockexpression;
  }
}
