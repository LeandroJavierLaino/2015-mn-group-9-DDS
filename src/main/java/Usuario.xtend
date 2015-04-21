
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.HashSet
import java.util.Collection
import java.util.ArrayList

@Accessors
class Usuario {
	
	//Atributos
	double altura
	double peso
	String nombre
	int fechaDeNacimiento
	char sexo
	
	List<String> comidasQueDisgustan = new ArrayList<String>
	List<String> comidaPreferida = new ArrayList<String>
	
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	
	Rutina rutina
	
	Collection<Receta> recetas = new HashSet<Receta>
	
	//Mensajes
	def double calculaIMC(){
		peso / (altura*altura)
	}
	
	def void agregarCondicion(CondicionPreexistente condicion){
		condicionesPreexistentes.add(condicion)
	}
	def void agregarComidaALista(List<String> lista, String comida) {
		lista.add(comida)
	}
		
	def boolean validar(){
		altura > 0 && peso > 0 && fechaDeNacimiento > 0 && nombre != ""  && nombre.length()>4 && condicionesPreexistentesSonValidas()
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
		(noTieneCondicionesPreexistentes() || condicionesPreexistentes.forall[it.tieneRutinaSaludable(this)]) && calculaIMC()>=18 && calculaIMC()<=30
	}
}