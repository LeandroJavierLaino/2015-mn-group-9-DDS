package excepcion

import java.lang.Exception
//nueva excepcion
class UsuarioInvalidoExcepcion extends Exception {
	
	new (String msg) {
		super(msg)
	}
}