'use strict'

describe( 'Modulo indexApp.acceder ', function () {
	
	berforeEach( function () {
		module('indexApp.acceder')
	});
	
	describe( 'indexController', function () {
		
		var $scope, indexSrvc;
		
		beforeEach( function () {
			module( function ($provide) {
				$provide.value( 'MockedIndexService', {'getUsuario': function (){
					return [];
				}});
			});
		});
		
		beforeEach( inject(function ($rootScope){
			$scope = $rootScope.$new();
		}));
		
		it('Debe responder con un usuario', inject( function ($controller, MockedIndexService){
			$controller('indexController',{'$scope': $scope, 'IndexSrvc': MockedIndexService});
			expect($controller).toBeDefined();
			expect(indexSrvc);
			expect($scope.usuario.nombre).toEqual(MockedIndexService.getUsuario().usuario.nombre);
		}));
	});
});


//        beforeEach(inject(function ($rootScope) {
//            $scope = $rootScope.$new();
//        }));
// 
//        it('debe exponer la lista de coches', inject(function ($controller, MockedCarsService) {
//            $controller('CarsController', {'$scope': $scope, 'CarsService': MockedCarsService});
//            expect($controller).toBeDefined();
//            expect(CarsService);
//            expect($scope.cars.length).toBe(MockedCarsService.getAll().length);
//        }));
//    });
// 
//});