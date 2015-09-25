function transformarAReceta(jsonReceta) {
	return angular.extend(new Receta(), jsonReceta);
}
function transformarAUsuario(jsonUsuario) {
	return angular.extend(new Usuario(), jsonUsuario);
}
function transformarACondimento(jsonCondimento) {
	return angular.extend(new Condimento("", 0, ""), jsonCondimento);
}
function transformarAIngrediente(jsonIngrediente) {
	return angular.extend(new Ingrediente("", 0, ""), jsonIngrediente);
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
function contains(objecto, lista) {
	var i = 0
	if (lista == null)
		return false

	while (i < lista.length) {
		if (objecto.nombrePlato.toUpperCase == lista[i].nombrePlato.toUpperCase)
			return true;
		i++;
	}
	return false;
}