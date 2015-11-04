import receta.Receta
import cosasUsuario.Usuario
import receta.Ingrediente
import receta.Condimento
import cosasUsuario.UsuarioBuilder
import receta.RecetaBuilder
import org.joda.time.LocalDate
import consulta.MonitorRecetas
import consulta.MonitorHora
import consulta.MonitorRecetasM
import consulta.MonitorRecetasF
import org.joda.time.DateTime
import consulta.GestorDeConsultas
import filtro.FiltroPorGusto
import filtro.FiltroPorExcesoDeCalorias
import procesamientoPosterior.ProcesamientoOrdenarlosPorNombre
import repositorioRecetas.RepositorioRecetas
import receta.Palabras

class Iniciador {
	
	Usuario nicolas
	Usuario leandro
	
	//Salchi papa y Salchichas con Pure
	Receta recetaSalchichasConPure	
	Receta recetaSalchiPapa
	Ingrediente salchicha
	Condimento ketchup

	//Pollo al Spiedo, Pollo Grille y Pollo con arroz
	Receta recetaPolloConArroz
	Receta recetaPolloAlSpiedo
	Receta recetaPolloGrille
	Ingrediente pollo
	Ingrediente manteca
	Ingrediente arroz
	Condimento sal
	Condimento pimienta
	Condimento ajo
	
	//Milanga con Pure, Milanga con Fritas y Milanga sola
	Receta recetaMilanaga
	Receta recetaMilangaConPure
	Receta recetaMilangaConFritas
	Ingrediente papa
	Ingrediente milanesa
	Condimento aceite
	
	//Grog
	Receta recetaGrog
	Ingrediente queroseno
	Ingrediente glicolPropilico
	Ingrediente endulzantesArtificiales
	Ingrediente acidoSulfurico
	Ingrediente ron
	Ingrediente acetona
	Condimento SCUMM
	Ingrediente grasaParaEjes
	Condimento tinteRojoNumero2
	Condimento pepperoni
	Condimento acidoParaBaterias
	
	//Grog Posta
	Receta recetaGrogPosta
	Ingrediente jugoDeLima
	Condimento canela
	Condimento azucar	
	
	FiltroPorGusto filtroGusto
	FiltroPorExcesoDeCalorias filtroExceso
	MonitorHora monitorHora
	MonitorRecetas monitorRecetas
	MonitorRecetasM monitorRecetasHombre
	MonitorRecetasF monitorRecetasMujer
	DateTime time
	int hora
	

	
	new() {
		
		salchicha = new Ingrediente => [
			nombre = "Salchicha"
			cantidad = 12
			tipo =  "unidades"
		]
		ketchup = new Condimento => [ 
			nombre = "ketchup"
			cantidad = 200
			tipo =  "mililitros"	
		]
		pollo = new Ingrediente => [
			nombre = "pollo"
			cantidad = 2.4
			tipo = "kilogramos"
		]
		sal = new Condimento => [
			nombre = "sal"
			cantidad = 10
			tipo = "miligramos"
		]
		pimienta = new Condimento => [
			nombre = "pimienta"
			cantidad = 20
			tipo = "miligramos"
		]
		ajo = new Condimento => [
			nombre = "ajo"
			cantidad = 1
			tipo = "unidades"
		]
		milanesa = new Ingrediente =>[
			nombre = "milanesa"
			cantidad = 3
			tipo = "unidades"
		]
		aceite = new Condimento =>[
			nombre = "aceite"
			cantidad = 15
			tipo = "mililitros"
		]
		queroseno = new Ingrediente =>[
			nombre = "queroseno"
			cantidad = 15
			tipo = "milimetros"
		]
		glicolPropilico = new Ingrediente => [
			nombre = "glicol propilico"
			cantidad = 3
			tipo = "gramos"
		]
		endulzantesArtificiales = new Ingrediente =>[
			nombre = "endulzantes artificiales"
			cantidad = 18
			tipo = "gramos"
		]
		acidoSulfurico = new Ingrediente =>[
			nombre = "acido sulfurico"
			cantidad = 15
			tipo = "mililitros"
		]
		ron = new Ingrediente =>[
			nombre = "ron"
			cantidad = 150
			tipo = "mililitros"
		]
		acetona = new Ingrediente =>[
			nombre = "acetona"
			cantidad = 11
			tipo = "mililitros"
		]
		//Script Creation Utility for Maniac Mansion
		SCUMM = new Condimento =>[
			nombre = "SCUMM"
			cantidad = 1
			tipo = "script"
		]
		grasaParaEjes = new Ingrediente =>[
			nombre = "grasa para ejes"
			cantidad = 3
			tipo = "cucharadas"
		]
		tinteRojoNumero2 = new Condimento =>[
			nombre = "tinte rojo numero 2"
			cantidad = 2
			tipo = "gotas"
		]
		pepperoni = new Condimento =>[
			nombre = "pepperoni"
			cantidad = 3
			tipo = "rodajas"
		]
		acidoParaBaterias = new Condimento =>[
			nombre = "acido para baterias"
			cantidad = 12
			tipo = "mililitros"
		]
		jugoDeLima = new Ingrediente =>[
			nombre = "jugo de lima"
			cantidad = 20
			tipo = "mililitros"
		]
		canela = new Condimento =>[
			nombre = "canela"
			cantidad = 1
			tipo = "corteza"
		]
		azucar = new Condimento =>[
			nombre = "azucar"
			cantidad = 1
			tipo = "cucharada"
		]
		arroz = new Ingrediente =>[
			nombre = "arroz"
			cantidad = 150
			tipo = "gramos"
		]
		
		recetaSalchiPapa = new RecetaBuilder()
		.nombre("SalchiPapa")
		.conCalorias(150)
		.dificultad("BAJA")
		.pasoInstruccion("Hervir Salchichas")
		.pasoInstruccion("Freir Papas")
		.ingrediente(salchicha)
		.condimento(ketchup)
		.temporada("VERANO")
		.esPrivada
		.creadaPor("Nicolas")
		.build
		
//		recetaPolloAlSpiedo = new RecetaBuilder()
//		.nombre("PolloAlSpiedo")
//		.conCalorias(850)
//		.dificultad("MEDIA")
//		.pasoInstruccion("poner Ajo y Manteca en la sarten")
//		.pasoInstruccion("sal-pimentamos el pollo y ponemos el horno en Spiedo")
//		.pasoInstruccion("untamos de Ajo y Manteca de la sarten al Pollo")
//		.pasoInstruccion("ponemos el Pollo en el horno a 180°")
//		.ingrediente(pollo)
//		.ingrediente(manteca)
//		.condimento(sal)
//		.condimento(pimienta)
//		.condimento(ajo)
//		.temporada("VERANO")
//		.esPublica
//		.creadaPor("Leandro")
//		.build
//		
//		recetaMilangaConPure = new RecetaBuilder()
//		.nombre("MilangaConPure")
//		.conCalorias(925)
//		.dificultad("BAJA")
//		.pasoInstruccion("hervir la papa y pisarla hasta hacerla pure")
//		.pasoInstruccion("mezclar el pure de papa con manteca y agregar sal")
//		.pasoInstruccion("poner una buena capa de aceite hasta que caliente este")
//		.pasoInstruccion("colocar las milanesas, cocinarlas hasta que se doren")
//		.ingrediente(papa)
//		.ingrediente(milanesa)
//		.ingrediente(manteca)
//		.condimento(sal)
//		.condimento(aceite)
//		.temporada("OTONIO")
//		.esPrivada
//		.creadaPor("Leandro")
//		.build
		
		//queroseno, glicol propílico, endulzantes artificiales, ácido sulfúrico, 
		//ron, acetona, tinte rojo nº2, SCUMM, grasa para ejes, ácido para baterías y/o pepperoni
		recetaGrog = new RecetaBuilder()
		.nombre("Grog")
		.conCalorias(15000)
		.dificultad("ALTA")
		.pasoInstruccion("en una olla con el ron y la acetona ir agregando uno a uno los ingredientes")
		.pasoInstruccion("condimentar a gusto con pepperoni y acido de baterias a gusto")
		.ingrediente(queroseno)
		.ingrediente(glicolPropilico)
		.ingrediente(endulzantesArtificiales)
		.ingrediente(acidoSulfurico)
		.ingrediente(ron)
		.ingrediente(acetona)
		.condimento(SCUMM)
		.ingrediente(grasaParaEjes)
		.condimento(tinteRojoNumero2)
		.condimento(pepperoni)
		.condimento(acidoParaBaterias)
		.temporada("TODOELANIO")
		.esPublica
		.creadaPor("Diego")
		.build
		
//			Ingredientes y elaboración
//
//  	  Un poco de ron negro
//    	  Una cucharadita de azúcar
//    	  Jugo de lima
//    	  Una rama de canela
//    	  Agua hirviendo
		recetaGrogPosta = new RecetaBuilder()
		.nombre("Grog Posta")
		.conCalorias(300)
		.dificultad("BAJA")
		.pasoInstruccion("en un vaso con ron agregamos el jugo de lima")
		.pasoInstruccion("agregamos azucar y canela a gusto y batimos")
		.ingrediente(ron)
		.ingrediente(jugoDeLima)
		.condimento(canela)
		.condimento(azucar)
		.temporada("PRIMAVERA")
		.esPublica
		.creadaPor("Nicolas")
		.build
		
//		recetaMilanaga = new RecetaBuilder()
//		.nombre("milanga")
//		.conCalorias(230)
//		.dificultad("MEDIANA")
//		.pasoInstruccion("en una sarten caliente con aceite colocamos la milanga hasta que se dore")
//		.pasoInstruccion("agregamos sal a gusto")
//		.ingrediente(milanesa)
//		.condimento(aceite)
//		.condimento(sal)
//		.temporada("PRIMAVERA")
//		.esPublica
//		.creadaPor("Leandro")
//		.build
//		
//		recetaPolloConArroz = new RecetaBuilder()
//		.nombre("Pollo con Arroz")
//		.conCalorias(720)
//		.dificultad("MEDIANA")
//		.ingrediente(pollo)
//		.ingrediente(arroz)
//		.condimento(sal)
//		.pasoInstruccion("")//es a proposito como para que se muestre sin ningun paso
//		.temporada("INVIERNO")
//		.esPublica
//		.creadaPor("Tato")
//		.build
//		
//		recetaMilangaConFritas = new RecetaBuilder()
//		.nombre("Milanga con Fritas")
//		.conCalorias(1229)
//		.dificultad("FACIL")
//		.ingrediente(milanesa)
//		.ingrediente(papa)
//		.condimento(sal)
//		.condimento(aceite)
//		.condimento(ketchup)
//		.pasoInstruccion("dorar la milanga en una sarten con aceite")
//		.pasoInstruccion("dorar las papas en una sarten con aceite")
//		.pasoInstruccion("agregar sal tanto el la milanga como en las papas")
//		.pasoInstruccion("agregar un poco de ketchup al costado")
//		.temporada("OTONIO")
//		.esPublica
//		.creadaPor("Nicolas")
//		.build
//		
//		recetaSalchichasConPure = new RecetaBuilder()
//		.nombre("Salchichas con Pure")
//		.conCalorias(825)
//		.dificultad("MEDIANA")
//		.ingrediente(salchicha)
//		.ingrediente(papa)
//		.condimento(sal)
//		.pasoInstruccion("hervir en una olla las salchicas")
//		.pasoInstruccion("en otra olla hervir las papas y luego pisarlas para hacerlas pure")
//		.pasoInstruccion("agregar sal al pure")
//		.temporada("INVIERNO")
//		.esPrivada
//		.creadaPor("Nicolas")
//		.build
//		
//		recetaPolloGrille = new RecetaBuilder()
//		.nombre("Pollo Grille")
//		.conCalorias(523)
//		.dificultad("FACIL")
//		.ingrediente(pollo)
//		.condimento(sal)
//		.pasoInstruccion("poner el pollo en la grillera hasta que se marque")
//		.pasoInstruccion("agregar sal al pure")//le pifio al paso
//		.temporada("TODOELANIO")
//		.esPublica
//		.creadaPor("Leandro")
//		.build
		
		nicolas = new UsuarioBuilder()
		.conNombre("Nicolas")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1980,11,10))
		.conAltura(1.74)
		.conPeso(60)
		.conPass("123")
		.conReceta(recetaSalchiPapa)
		.conProcesamiento(new ProcesamientoOrdenarlosPorNombre)
		.build
		
		leandro = new UsuarioBuilder()
		.conNombre("Leandro")
		.deSexo("M")
		.fechaDeNacimiento(new LocalDate(1988,6,27))
		.conPeso(70)
		.conAltura(1.74)
		.conPass("123")
		.conProcesamiento(new ProcesamientoOrdenarlosPorNombre)
		.build
		
		RepositorioRecetas.instance.cargarTodasLasRecetas
		
		//CONSULTAS
		filtroGusto = new FiltroPorGusto
		filtroExceso = new FiltroPorExcesoDeCalorias
		
		monitorHora = new MonitorHora
		monitorRecetas = new MonitorRecetas
		monitorRecetasHombre = new MonitorRecetasM
		monitorRecetasMujer = new MonitorRecetasF
		
		time = new DateTime()
		hora = time.getHourOfDay()
		
		GestorDeConsultas.getInstance.monitores.add(monitorHora)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetas)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasHombre)
		GestorDeConsultas.getInstance.monitores.add(monitorRecetasMujer)
		
		nicolas.agregarAFavoritos(recetaSalchiPapa)
		nicolas.habilitarFavoritos = true
		
		leandro.filtrosAAplicar.add(filtroGusto) 
		
	}
}