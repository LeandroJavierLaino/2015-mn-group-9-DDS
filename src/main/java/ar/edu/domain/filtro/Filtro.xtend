package ar.edu.domain.filtro

import java.util.Set
import ar.edu.domain.receta.Receta
import ar.edu.domain.cosasUsuario.Usuario

interface Filtro {
	def Set<Receta> filtrar(Set<Receta> recetas,Usuario usuario)
}