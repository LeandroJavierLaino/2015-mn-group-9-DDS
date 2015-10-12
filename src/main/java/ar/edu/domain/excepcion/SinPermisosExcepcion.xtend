package ar.edu.domain.excepcion

import java.lang.Exception
//nueva excepcion
class SinPermisosExcepcion extends Exception {
	
	new (String msg) {
		super(msg)
	}
}
