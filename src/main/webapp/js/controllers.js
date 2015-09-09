function transformarAReceta(jsonReceta) {
	return angular.extend(new Receta(), jsonReceta);
}
function transformarAUsuario(jsonUsuario) {
	return angular.extend(new Usuario(), jsonUsuario);
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
	
	return recipe;
})

recipeApp.controller('recipeCtrl', ['recipeSrvc',  function(recipeSrvc){
	
	var user = JSON.parse(sessionStorage.getItem('usuario1'));

	user.verReceta = function() {
		sessionStorage.setItem('recetaAVer', JSON.stringify(user.recetaSeleccionada));
		window.parent.receta = user.recetaSeleccionada;
		window.open("detallereceta.html", "_self");
	} 
	user.listarRecetas = function() {
		recipeSrvc.listarRecetas(user.nombre, function(data) {
			user.recetas = data.map(transformarAReceta);
		})
		return user.recetas;
	}
	user.abrirReceta = function(receta) {
		sessionStorage.setItem('recetaAVer', JSON.stringify(receta));
		
		window.open("detallereceta.html", "_self");
	}
	return user;

	
}])
usuariosApp.controller('UsuariosController', ['usuariosSrvc', function(usuariosSrvc) {
	
	var self = this;
	this.usuarios = null;
	this.mostrarError = false;
	this.mostrarTabla = false;
	this.nombreABuscar = null;
	
	this.buscar = function() {
		usuariosSrvc.buscar(self.nombreABuscar, function(data) {
			self.usuarios = _.map(data, transformarAUsuario);
		});
		if (self.usuarios == null)
			this.mostrarError = true;
		else
			this.mostrarTabla = true;
	}
	this.abrirPerfil = function(usuario) {
		sessionStorage.setItem('usuario1', JSON.stringify(usuario));
		
		window.open("recetas.html", "_self");
	}
}])