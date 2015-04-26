package excepcion

import java.lang.Exception

class UsuarioInvalidoExcepcion extends Exception {
	
	new (String msg) {
		super(msg)
	}
}