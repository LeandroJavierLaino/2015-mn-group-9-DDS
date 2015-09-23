function Usuario() {
	var self = this;
	this.nombre = null;
	this.password = null;
	this.recetas = null;
	this.recetaSeleccionada = null;
	this.peso = null;
	this.altura = null;
	this.fechaDeNacimiento = null;
	this.condicionesPreexistentes = null;
	this.sexo = null;
	this.recetasFavoritas = null;
}

var pepe = new Usuario();
pepe.nombre = "Pepe";
pepe.password = "123";
pepe.recetas = [recetaCarne, recetaFideos, recetaVegetales];


recetaFideos.creador = pepe;
recetaCarne.creador = pepe;
recetaVegetales.creador = pepe;