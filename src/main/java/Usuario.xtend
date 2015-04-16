
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Usuario {
	
	double altura
	double peso
	String nombre
	int fechaDeNacimiento
	String sexo /** aunque podria hacerce de otra manera :S */ 
	List<String> comidasQueDisgustan
	/** para las condiciones preexistentes podriamos usar un Strategy o un List de Strategys :O */ 
	/** se puede usar un Interface a una Rutina y que de esa salgand dos "subtipos" de rutinas ej. Sedentaria o Activa */
	
	def double calculaIMC(){
		peso / (altura*altura)
	}
}