package postProcesado

import java.util.List
import receta.Receta
import java.util.Comparator
import java.util.Collections
class PostProcesoOrdenadoCalor extends PostProcesoDecorador {

    // Comparator
    public static class Comp implements Comparator<Receta> {	
	override public int compare(Receta arg0, Receta arg1) {
	     return (arg0.cantidadMinimaCalorias.intValue).compareTo(arg1.cantidadMinimaCalorias.intValue)
        }
    }
	
	new(PostProceso decorado) {
		super(decorado)
	}
	
	override postProcesar(List<Receta> recetasAMostrar){
		Collections.sort(recetasAMostrar, new PostProcesoOrdenadoCalor.Comp())
		decorado.postProcesar(recetasAMostrar)
	}

}
