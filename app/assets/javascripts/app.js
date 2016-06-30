(function (){
  var app = angular.module('GrabBag', ["ngRoute", 'GrabBag.controllers', 'GrabBag.factories', 'templates'])
  .config(['$routeProvider',
    function config($routeProvider) {
      $routeProvider.
        when('/', {
          template: '<pairs></pairs>'
        })
    }
  ])

.component('pairs', {
  templateUrl: 'pairs.html',
  controller: 'HomeCtrl'
})
})();