function Receta() {
	this.nombre = null;
	this.ingredientes = null;
	this.calorias = null;
	this.dificultad = null;
	this.temporada = null;
	this.condimentos = null;
	this.instrucciones = null;
	this.creador = null;
}

var recetaCarne = new Receta();
recetaCarne.nombre = "Carnes Variadas";
recetaCarne.ingredientes = ["Carne de Ternera", "Carne de Pollo", "Carne de Cerdo"];
recetaCarne.calorias = 200;
recetaCarne.temporada = "Todo el año";
recetaCarne.dificultad = "Baja";

var recetaFideos = new Receta();
recetaFideos.nombre = "Fideos";
recetaFideos.ingredientes = ["Fideos", "Salsa"];
recetaFideos.calorias = 100;
recetaFideos.temporada = "Invierno";
recetaFideos.dificultad = "Baja";


var recetaVegetales = new Receta();
recetaVegetales.nombre = "Ensalada";
recetaVegetales.ingredientes = ["Lechuga", "Tomate"];
recetaVegetales.calorias = 100;
recetaVegetales.temporada = "Verano";
recetaVegetales.dificultad = "Alta";