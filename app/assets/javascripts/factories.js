angular.module('GrabBag.factories', [])

.factory('kidpairs', ['$http', function($http) {
  return $http.get('/api/kidpairs').success(function(data){
      return data;
    });
}])

.factory('adultpairs', ['$http', function($http) {
  return $http.get('/api/adultpairs').success(function(data){
      return data;
    });
}])
