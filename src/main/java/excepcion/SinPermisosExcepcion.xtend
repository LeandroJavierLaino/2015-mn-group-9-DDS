package excepcion

import java.lang.Exception

class SinPermisosExcepcion extends Exception {
	
	new (String msg) {
		super(msg)
	}
}
