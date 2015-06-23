package consulta;

import com.google.common.base.Objects;
import consulta.Consulta;
import consulta.Monitor;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class GestorDeConsultas {
  private static GestorDeConsultas instance = null;
  
  public static GestorDeConsultas getInstance() {
    GestorDeConsultas _xifexpression = null;
    boolean _equals = Objects.equal(GestorDeConsultas.instance, null);
    if (_equals) {
      GestorDeConsultas _gestorDeConsultas = new GestorDeConsultas();
      _xifexpression = GestorDeConsultas.instance = _gestorDeConsultas;
    } else {
      _xifexpression = GestorDeConsultas.instance;
    }
    return _xifexpression;
  }
  
  private Set<Monitor> monitores = new HashSet<Monitor>();
  
  public void monitorear(final Consulta post) {
    final Consumer<Monitor> _function = new Consumer<Monitor>() {
      public void accept(final Monitor it) {
        it.monitorear(post);
      }
    };
    this.monitores.forEach(_function);
  }
  
  @Pure
  public Set<Monitor> getMonitores() {
    return this.monitores;
  }
  
  public void setMonitores(final Set<Monitor> monitores) {
    this.monitores = monitores;
  }
}
