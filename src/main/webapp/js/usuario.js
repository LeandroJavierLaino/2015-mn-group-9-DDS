function Usuario() {
	var self = this;
	this.nombre = null;
	this.password = null;
	this.recetas = null;
	this.recetaSeleccionada = null;
}

var pepe = new Usuario();
pepe.nombre = "Pepe";
pepe.password = "123";
pepe.recetas = [recetaCarne, recetaFideos, recetaVegetales];


recetaFideos.creador = pepe;
recetaCarne.creador = pepe;
recetaVegetales.creador = pepe;