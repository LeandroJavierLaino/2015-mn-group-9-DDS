package postProcesado

abstract class PostProcesoDecorador implements PostProceso {
	PostProceso decorado
	
	new(PostProceso postProceso){
		decorado = postProceso
	}
	
	override postProcesar(){
		decorado.postProcesar()
	}
	
}