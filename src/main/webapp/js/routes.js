recipeApp.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("/");

 $stateProvider

   .state('listarRecetas', {
     url: "/",
     templateUrl: "recetasBis.html",
     controller: "listarRecetasController as recipeCtrl"
   })
});