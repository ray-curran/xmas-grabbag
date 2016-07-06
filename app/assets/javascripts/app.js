(function (){
  var app = angular.module('GrabBag', ["ngRoute", 'GrabBag.controllers', 'GrabBag.factories', 'templates'])
  .config(['$routeProvider', '$locationProvider',
    function config($routeProvider, $locationProvider) {
      $routeProvider.
      when('/', {
        template: '<pairs></pairs>'
      })
      .when('/person/:id', {
        template: '<person></person>'
      })
      .when('/login', {
        template: '<login></login>'
      })
      .otherwise({redirectTo: function(current, path, search) {
        if(search.goto) {
          return '/' + search.goto;
        }
        return '/'
      }
    });

      $locationProvider.html5Mode({
        enabled: true
      });

    }
    ])

  .component('pairs', {
    templateUrl: 'pairs.html',
    controller: 'HomeCtrl'
  })
  .component('person', {
    templateUrl: 'person.html',
    controller: 'PersonCtrl'
  })
  .component('login', {
    templateUrl: 'login.html',
    controller: 'HomeCtrl'
  });

})();