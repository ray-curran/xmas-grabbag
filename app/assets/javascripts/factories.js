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

.factory('allpeople', ['$http', function($http) {
  return $http.get('/api/allpeople').success(function(data){
      return data;
    });
}])

.factory('tradegifts', ['$http', function($http) {
  return $http.get('/api/tradegifts').success(function(data){
      return data;
    });
}])

.factory('allpairs', ['$http', function($http) {
  return $http.get('/api/allpairs').success(function(data){
      return data;
    });
}])
