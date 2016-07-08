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
      .when('/admin', {
        template: '<admin></admin>'
      })
      .when('/trade/:year', {
        template: '<histtrade></histtrade>'
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
    controller: 'PairCtrl'
  })
  .component('person', {
    templateUrl: 'person.html',
    controller: 'PersonCtrl'
  })
  .component('login', {
    templateUrl: 'login.html',
    controller: 'AuthCtrl'
  })
  .component('admin', {
    templateUrl: 'admin.html',
    controller: 'AdminCtrl'
  })
  .component('histtrade', {
    templateUrl: 'hist_trades.html',
    controller: 'HistCtrl'
  });


})();