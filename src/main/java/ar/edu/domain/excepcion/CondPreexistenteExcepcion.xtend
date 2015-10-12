package ar.edu.domain.excepcion

import java.lang.Exception
//nueva excepcion
class CondPreexistenteExcepcion extends Exception {
	
	new (String msg) {
		super(msg)
	}
}