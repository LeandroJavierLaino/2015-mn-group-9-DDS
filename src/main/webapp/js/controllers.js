function transformarAReceta(jsonReceta) {
	return angular.extend(new Receta(), jsonReceta);
}
function transformarAUsuario(jsonUsuario) {
	return angular.extend(new Usuario(), jsonUsuario);
}
function transformarACaracteristica(jsonCaracteristica) {
	return angular.extend(new Caracteristica(), jsonCaracteristica);
}
var jsonify = function(obj) {
	var seen = [];
	var json = JSON.stringify(obj, function(key, value) {
		if (typeof value === 'object') {
			if (!seen.indexOf(value)) {
				return '__cycle__' + (typeof value) + '[' + key + ']';
			}
			seen.push(value);
		}
		return value;
	}, 4);
	return json;
};

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

logeoApp.controller('logeoCtrl', [ 'logeoSrvc', function(logeoSrvc) {

	var self = this
	this.usuario = null;
	this.nombre = null;
	this.password = null;
	this.mostrar = false;

	this.getUsuario = function() {
		logeoSrvc.getUsuario(self.nombre, function(data) {
			self.usuario = transformarAUsuario(data);
		});
		return self.usuario;
	}

	this.acceder = function() {

		// var busq = repo.buscarUsuario(this.usuario);
		var usuario = self.getUsuario()
		if (usuario != null && this.password == "123") {

			// METODO por LOCALSTORAGE
			sessionStorage.setItem('usuario1', jsonify(usuario));

			/* METODO por IFRAME */
			// window.parent.usuario = busq;
			this.mostrar = true;
			console.log(usuario);
			var myWindow = window.open("recetas.html", "_self");// deberiamos
																// llevarlo a
																// principal.html
		}

		else
			alert("Error: el usuario o la contraseña son erroneos");

	}
} ]);

recipeDetailApp.controller('recipeDetailCtrl', function(recipeDetailSrvc) {
	
	function contains(a, obj) {
	    for (var i = 0; i < a.length; i++) {
	        if (a[i] == obj) {
	            return true;
	        }
	    }
	    return false;
	}
	
	var recipe = JSON.parse(sessionStorage.getItem('recetaAVer'));
	recipe.recetaClon = recipe;
	
	recipe.user = JSON.parse(sessionStorage.getItem('usuario1'));
	recipe.esFavorita = contains(recipe.user.recetasFavoritas, recipe.recetaClon)
	console.log(recipe.recetaClon.esFavorita)
	
	recipe.favoritos = function() {
		if(recipe.esFavorita) {
			recipe.user.recetasFavoritas.splice(indexOf(recipe.recetaClon), 1)
		}
		else {
			recipe.user.recetasFavoritas.push(recipe.recetaClon);
			console.log(recipe.recetaClon.esFavorita)
			console.log(recipe.user.recetasFavoritas)
		}
	}
	recipe.tEsFavorita = function() {
		if(recipe.esFavorita) {
			return "Eliminar de Favoritas";
		}
		else return "Agregar a Favoritas";
	}

	recipe.mostrarDivNuevoCondimento = false;
	recipe.mostrarDivNuevoIngrediente = false;
	recipe.nuevoPaso = null;

	recipe.condimentoAAgregar = new Caracteristica;
	recipe.ingredienteAAgregar = new Caracteristica
	
	recipe.mostrarPrep = true;
	
	recipe.agregarPaso = function() {
		console.log(recipe.nuevoPaso)
		if (recipe.nuevoPaso == null)
			alert("debe llenar el campo");
		
		else {
			recipe.procesoPreparacion.push(recipe.nuevoPaso);
			console.log(recipe.recetaClon.procesoPreparacion.toString())

		}

	}
	recipe.nuevoCondimento = function() {
		recipe.mostrarDivNuevoCondimento = !recipe.mostrarDivNuevoCondimento;
		recipe.condimentoAAgregar = new Caracteristica;
	}
	recipe.agregarCondimento = function() {
		recipe.recetaClon.condimentos.push(recipe.condimentoAAgregar);
		console.log(recipe.recetaClon.condimentos)
		recipe.condimentoAAgregar = new Caracteristica;
		recipe.mostrarDivNuevoCondimento = !recipe.mostrarDivNuevoCondimento;
	}
	recipe.nuevoIngrediente = function() {
		recipe.mostrarDivNuevoIngrediente = !recipe.mostrarDivNuevoIngrediente;
		recipe.condimentoAAgregar = new Caracteristica;
	}
	recipe.agregarIngrediente = function() {
		recipe.recetaClon.ingredientes.push(recipe.ingredienteAAgregar)
		console.log(recipe.recetaClon.ingredientes);
		recipe.ingredienteAAgregar = new Caracteristica;
		recipe.mostrarDivNuevoIngrediente = !recipe.mostrarDivNuevoIngrediente;
	}
	recipe.guardar = function() {
		
		console.log(recipe.recetaClon.nombrePlato)
		console.log(recipe.recetaClon.totalCalorias)
		console.log(recipe.recetaClon.ingredientes);
		console.log(recipe.recetaClon.condimentos)
		console.log(jsonify(recipe.recetaClon))
		
		recipeDetailSrvc.guardarReceta(jsonify(recipe.recetaClon), function() {
			alert("Cambios guardados");
		})
	}
	recipe.volver = function() {
		window.open("recetas.html", "_self");
	}
	recipe.buscarUsuario = function() {
		window.open("buscarUsuario.html", "_self");
	}
	recipe.buscarReceta = function() {
		window.open("buscarReceta.html", "_self");
	}
	return recipe;
})

recipeApp.controller('recipeCtrl', [
		'recipeSrvc',
		function(recipeSrvc, $state) {

			var user = JSON.parse(sessionStorage.getItem('usuario1'));

			user.verReceta = function() {
				sessionStorage.setItem('recetaAVer', JSON
						.stringify(user.recetaSeleccionada));
				window.parent.receta = user.recetaSeleccionada;
				window.open("detallereceta.html", "_self");
			}
			user.listarRecetas = function() {
				recipeSrvc.listarRecetas(user.nombre, function(data) {
					user.recetas = data.map(transformarAReceta);
				})
				$state.go("listarRecetas");
				return user.recetas;
			}
			user.abrirReceta = function(receta) {
				sessionStorage.setItem('recetaAVer', JSON.stringify(receta));

				window.open("detallereceta.html", "_self");
			}
			user.buscarUsuario = function() {
				window.open("buscarUsuario.html", "_self");
			}
			user.buscarReceta = function() {
				window.open("buscarReceta.html", "_self");
			}
			return user;

		} ])
usuariosApp.controller('UsuariosController', [ 'usuariosSrvc',
		function(usuariosSrvc) {

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
		} ])