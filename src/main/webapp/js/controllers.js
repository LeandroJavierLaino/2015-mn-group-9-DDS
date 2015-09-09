function transformarAReceta(jsonReceta) {
	return angular.extend(new Receta(), jsonReceta);
}

recetaApp.controller('RecetasController', [ 'recetaSrvc', function(recetaSrvc) {

	var self = this;
	this.recetas = null;
	this.recetaSeleccionada = null;
	this.nombreABuscar = null;
	this.mostrarError = false;
	this.mostrarTabla = false;

	this.buscar = function() {

		recetaSrvc.buscar(self.nombreABuscar, function(data) {
			self.recetaSeleccionada = JSON.parse(data);
		});

		if (self.recetaSeleccionada == null)
			this.mostrarError = true;
		else
			this.mostrarTabla = true;

	}
	this.buscarVarias = function() {
		recetaSrvc.buscarVarias(self.nombreABuscar, function(data) {
			self.recetas = _.map(data, transformarAReceta);
		});
		if (self.recetas == null)
			this.mostrarError = true;
		else
			this.mostrarTabla = true;
	}
	
	this.abrirReceta = function(receta) {
		sessionStorage.setItem('recetaAVer', JSON.stringify(receta));
		
		window.open("detallereceta.html", "_self");
	}

} ])

logeoApp.controller('logeoCtrl', function(){
	return new Logeo();
});

recipeDetailApp.controller('recipeDetailCtrl', function(){

	var recipe = JSON.parse(sessionStorage.getItem('recetaAVer'));

	//var recipe = window.parent.receta;
	
	return recipe;
})

recipeApp.controller('recipeCtrl', function(){

	//Este solo lo pude hacer Funcionar en Firefox y Opera
	//console.log(JSON.parse(localStorage.getItem('usuario'))); 
	//Usar la consola es malo.

	var user = JSON.parse(sessionStorage.getItem('usuario1'));

	//Metodo por Frame
	//var user = window.parent.usuario;

	user.verReceta = function() {
		sessionStorage.setItem('recetaAVer', JSON.stringify(user.recetaSeleccionada));
		window.parent.receta = user.recetaSeleccionada;
		window.open("detallereceta.html", "_self");
	} 
	
	return user;
	/*Esto funciona en EDGE pero requiere un frame (y en Opera tira error)*/

	
})