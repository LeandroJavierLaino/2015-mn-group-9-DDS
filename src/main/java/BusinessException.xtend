

import java.lang.RuntimeException

class BusinessException extends RuntimeException {
	new(String msg){
		super(msg)
	}
}