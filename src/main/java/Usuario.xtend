
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection

@Accessors
class Usuario {
	
	//Atributos
	double altura
	double peso
	String nombre
	int fechaDeNacimiento
	String sexo
	
	List<String> comidasQueDisgustan
	List<String> comidaPreferida
	
	List<CondicionPreexistente> condicionesPreexistentes
		
	Rutina rutina
	
	Collection<Receta> recetas = new HashSet<Receta>
	
	//Mensajes
	def double calculaIMC(){
		peso / (altura*altura)
	}
	
	def boolean validar(){
		(altura > 0 && peso > 0 && fechaDeNacimiento > 0 && nombre != ""  && nombre.length()>4 && condicionesPreexistentesSonValidas())
	}
	
	def tieneLaReceta(Receta receta){
		recetas.contains(receta)
	}
	
	def Boolean noTieneCondicionesPreexistentes(){
		condicionesPreexistentes.empty
	}
	
	def Boolean condicionesPreexistentesSonValidas(){
		noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.valido(this)]
	}
	
	def Boolean sigueUnaRutinaSaludable(){
		if(noTieneCondicionesPreexistentes() && calculaIMC()>=18 && calculaIMC()<=30){true}
		else{
			condicionesPreexistentes.forall[it.tieneRutinaSaludable(this)]
		}
	}
}