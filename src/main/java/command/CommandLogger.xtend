package command
 import org.apache.log4j.Logger
 
class CommandLogger implements CommandMonitor {
	final static Logger logger = Logger.getLogger( "Logger")
	
	override execute(){
		
		logger.warn("Mensaje" )
	}

}