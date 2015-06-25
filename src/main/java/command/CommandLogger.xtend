package command
 import org.apache.log4j.Logger
import consulta.Consulta

class CommandLogger implements CommandConsulta {
	public Logger logger = Logger.getLogger("Logger")
	
	override void execute(Consulta consulta){
		if(consulta.cantRecetas() >= 100){
			logger.info("Se realizó una consulta con más de 100 resultados por el usuario:" + consulta.usuario)
		}
	}

}