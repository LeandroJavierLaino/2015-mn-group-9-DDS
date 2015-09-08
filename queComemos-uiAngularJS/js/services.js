logeoApp.service('logeoService', function($http) {
    this.findAll = function(callback) {
        $http.get('/usuarios').success(callback);
    }
});