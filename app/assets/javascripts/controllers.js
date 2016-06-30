angular.module('GrabBag.controllers', ['GrabBag.factories'])
.controller('HomeCtrl', function($scope, $http, allpairs) {
  allpairs.success(function(data) {
    $scope.allpairs = data;
  })
})