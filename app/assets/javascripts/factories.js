angular.module('GrabBag.factories', [])

.factory('allpairs', ['$http', function($http) {
  return $http.get('/api/pairs').success(function(data){
      return data;
    });
}])
