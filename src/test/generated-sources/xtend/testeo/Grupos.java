package testeo;

import ar.edu.domain.cosasUsuario.GrupoUsuario;
import ar.edu.domain.cosasUsuario.Usuario;
import ar.edu.domain.receta.Caracteristica;
import ar.edu.domain.receta.Condimento;
import ar.edu.domain.receta.Ingrediente;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Before;
import testeo.UsuariosExtras;

@Accessors
@SuppressWarnings("all")
public class Grupos extends UsuariosExtras {
  @Before
  public void init() {
    super.init();
    GrupoUsuario _grupoUsuario = new GrupoUsuario();
    final Procedure1<GrupoUsuario> _function = new Procedure1<GrupoUsuario>() {
      public void apply(final GrupoUsuario it) {
        Usuario _leandro = Grupos.this.getLeandro();
        it.agregarUsuario(_leandro);
        Usuario _diego = Grupos.this.getDiego();
        it.agregarUsuario(_diego);
        List<Caracteristica> _palabrasClave = it.getPalabrasClave();
        Condimento _azucar = Grupos.this.getAzucar();
        _palabrasClave.add(_azucar);
        List<Caracteristica> _palabrasClave_1 = it.getPalabrasClave();
        Condimento _ajiMolido = Grupos.this.getAjiMolido();
        _palabrasClave_1.add(_ajiMolido);
        List<Caracteristica> _palabrasClave_2 = it.getPalabrasClave();
        Ingrediente _cebollas = Grupos.this.getCebollas();
        _palabrasClave_2.add(_cebollas);
      }
    };
    GrupoUsuario _doubleArrow = ObjectExtensions.<GrupoUsuario>operator_doubleArrow(_grupoUsuario, _function);
    this.setGrupoDeLaMuerte(_doubleArrow);
    GrupoUsuario _grupoUsuario_1 = new GrupoUsuario();
    final Procedure1<GrupoUsuario> _function_1 = new Procedure1<GrupoUsuario>() {
      public void apply(final GrupoUsuario it) {
        Usuario _eri = Grupos.this.getEri();
        it.agregarUsuario(_eri);
        Usuario _pablo = Grupos.this.getPablo();
        it.agregarUsuario(_pablo);
        Usuario _nicolas = Grupos.this.getNicolas();
        it.agregarUsuario(_nicolas);
        List<Caracteristica> _palabrasClave = it.getPalabrasClave();
        Condimento _azucar = Grupos.this.getAzucar();
        _palabrasClave.add(_azucar);
      }
    };
    GrupoUsuario _doubleArrow_1 = ObjectExtensions.<GrupoUsuario>operator_doubleArrow(_grupoUsuario_1, _function_1);
    this.setGrupoFlojito(_doubleArrow_1);
  }
}
