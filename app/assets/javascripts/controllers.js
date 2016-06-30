angular.module('GrabBag.controllers', ['GrabBag.factories'])

.controller('HomeCtrl', function($scope, $http, kidpairs, adultpairs) {

  kidpairs.success(function(data) {
    $scope.kidpairs = data;
  })

  adultpairs.success(function(data) {
    $scope.adultpairs = data;
  })

})