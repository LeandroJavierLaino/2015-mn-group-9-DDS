package command
 import org.apache.log4j.Logger
import consulta.Consulta

class CommandLogger implements CommandConsulta {
	final static Logger logger = Logger.getLogger( "Logger")
	
	override execute(Consulta consulta){
		if(consulta.recetas.size >= 100){
			logger.info("Se realizó una consulta con más de 100 resultados por el usuario:" + consulta.usuario)
		}
	}

}