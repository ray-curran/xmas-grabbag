angular.module('GrabBag.controllers', ['GrabBag.factories'])

.controller('PersonCtrl', function($scope, $http, $routeParams, allpeople, allpairs, tradegifts) {

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

})

.controller('HomeCtrl', ['$scope', '$http', 'kidpairs', 'adultpairs', function($scope, $http, kidpairs, adultpairs) {


  kidpairs.success(function(data) {
    $scope.kidpairs = data;
  })

  adultpairs.success(function(data) {
    $scope.adultpairs = data;
  })

}])