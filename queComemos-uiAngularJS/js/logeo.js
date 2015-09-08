"use strict"

var jsonify = function(obj) {
    var seen = [];
    var json = JSON.stringify(obj, function(key, value){
        if (typeof value === 'object') {
            if ( !seen.indexOf(value) ) {
                return '__cycle__' + (typeof value) + '[' + key + ']'; 
            }
            seen.push(value);
        }
        return value;
    }, 4);
    return json;
};

function Logeo() {
	var self = this
	this.usuario = null;
	this.password = null;
	this.mostrar = false;
	this.usuarios = null;
	
	this.getUsuarios = function() {
		logeoService.findAll(function(data) {
			self.usuarios = data
		});
	}

	this.acceder = function() {

		var busq = repo.buscarUsuario(this.usuario);
		if(busq && this.password == busq.password) {

			//METODO por LOCALSTORAGE
			sessionStorage.setItem('usuario1', jsonify(busq));

			/*METODO por IFRAME*/	
			//window.parent.usuario = busq; 

			this.mostrar = true;

			var myWindow =  window.open("recetas.html", "_self");
		}

		else alert("Error: el usuario o la contraseña son erroneos");
		
	}
}

