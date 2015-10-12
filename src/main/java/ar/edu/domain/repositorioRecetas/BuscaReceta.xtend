package ar.edu.domain.repositorioRecetas

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BuscaReceta {
	String usuario
	String nombre
	int caloriasMinimas
	int caloriasMaximas
	String temporada
	String dificultad
	String ingrediente
	boolean filtros
}