angular.module('GrabBag.controllers', ['GrabBag.factories'])

.controller('PersonCtrl', ['$scope', '$http', '$routeParams', 'allpeople', 'allpairs', 'tradegifts', function($scope, $http, $routeParams, allpeople, allpairs, tradegifts) {

  $scope.addingGift = false;

  allpeople.success(function(data) {
    $scope.person = data.filter(function(person) {
      return person.id == $routeParams.id;
    })[0]
  })

  tradegifts.success(function(data) {
    $scope.personGifts = data.filter(function(gift) { return gift.recipient_id == $routeParams.id})
  })

  $scope.anyBought = function anyBought(gifts) {
    if(gifts) {
      var any = gifts.filter(function(presents) {
        return presents.bought;
      })
      return any.length > 0;
    }
  }

  $scope.markBought = function markBought(gift) {
    $http.put('/gifts/' + gift.id + '/markbought');
  }

  $scope.removeGift = function removeGift(gift) {
    $http.delete('/gifts/' + gift.id);
    $scope.personGifts = $scope.personGifts.filter(function(present) { return gift.id != present.id })
  }

  $scope.calculateAge = function calculateAge(birthday) { // birthday is a string - need to convert to date in next line
    var ageDifMs = Date.now() - new Date(birthday).getTime();
    var ageDate = new Date(ageDifMs); // miliseconds from epoch
    return Math.abs(ageDate.getUTCFullYear() - 1970);
  }


  $scope.addNewGift = function addNewGift() {
    if($scope.newestgift.length > 0) {
      var post = {name: $scope.newestgift, recipient_id: $routeParams.id }
      $http.post('/gifts', post).success(function(data){
        $scope.personGifts.push(data);
      });
    };
    $scope.newestgift = '';
    $scope.addingGift = false;
  }

  $scope.showNewRow = function showNewRow(event) {
    event.preventDefault();
    $scope.addingGift = true;
  }

}])

.controller('PairCtrl', ['$scope', '$http', 'kidpairs', 'adultpairs', '$location', 'whichtrade', function($scope, $http, kidpairs, adultpairs, $location, whichtrade) {

  $http.get('/api/whichtrade').success(function(data){
      $scope.tradeyear = data.year;
    });

  $http.get('/api/adultpairs').success(function(data){
      $scope.adultpairs = data;
    });

  $http.get('/api/kidpairs').success(function(data){
      $scope.kidpairs = data;
    });

  // kidpairs.success(function(data) {
  //   $scope.kidpairs = data;
  // })

  // adultpairs.success(function(data) {
  //   $scope.adultpairs = data;
  // })

  // whichtrade.success(function(data) {
  //   $scope.tradeyear = data.year;
  // })

}])


.controller('AuthCtrl', ['$scope', '$http', '$rootScope', '$location', function($scope, $http, $rootScope, $location) {

      // Simple GET request example:
  $scope.login = function login() {
    $http({
      method: 'POST',
      url: '/api/login',
      dataType: 'json',
      headers: {
        "Content-Type": "application/json"
      },
      data: $scope.user
    }).then(function successCallback(response) {
        $rootScope.userLoggedIn = response.data;
        $location.path('/admin')
      }, function errorCallback(response) {
        $scope.user.password = '';
        alert('cannot log in with those credentials');
        // called asynchronously if an error occurs
        // or server returns response with an error status.
      });
  };


  }])

.controller('HomeCtrl', ['$scope', '$http', '$rootScope', '$location', function($scope, $http, $rootScope, $location) {


  $scope.logout = function logout() {
    $http.post('/api/logout').then(function(data) {
      alert('logged out!!!');
      $rootScope.userLoggedIn = null;
      $location.path('/');
    })
  }

  $http.get('/api/loggedin').success(function(data){
    $rootScope.userLoggedIn = data;
  });

}])

.controller('AdminCtrl', ['$scope', '$http', '$rootScope','$location', 'alltrades', function($scope, $http, $rootScope, $location, alltrades) {

  $scope.newlist = function newlist() {
    $http.post('/api/newlist').then(function successCallback(response) {
        alert('trade created!');
        $scope.alltrades.push(response.data);
        $location.path('/');
      }, function errorCallback(response) {
        alert('must be logged in!')
        $location.path('');
      });
  };

  alltrades.success(function(data) {
    $scope.alltrades = data;
  });

}])

.controller('HistCtrl', ['$scope', '$http', '$rootScope','$location', 'alltrades', '$routeParams', function($scope, $http, $rootScope, $location, alltrades, $routeParams) {

  alltrades.success(function(data) {
    $scope.thistrade = data.filter(function(trade) { return trade.year == $routeParams.year})[0];
  });

}])

