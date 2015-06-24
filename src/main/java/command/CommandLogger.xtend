package command
 import org.apache.log4j.Logger
import consulta.Consulta

class CommandLogger implements CommandConsulta {
	final static Logger logger = Logger.getLogger( "Logger")
	
	override execute(Consulta consulta){
		
		logger.warn("Mensaje" )
	}

}