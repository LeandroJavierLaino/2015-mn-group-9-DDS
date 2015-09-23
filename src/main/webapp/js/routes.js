recipeApp.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("/");

 $stateProvider

   .state('listarRecetas', {
     url: "/",
     templateUrl: "recetasBis.html",
     controller: "recipeCtrl as user"
   })
});
recetaApp.config(function ($stateProvider, $urlRouterProvider) {

	 $urlRouterProvider.otherwise("/");

	 $stateProvider
	   .state('buscarRecetas', {
		   url: "/", 
		   templateUrl: "recetasBis.html",
		   controller: "RecetasController as user"
	   })
});