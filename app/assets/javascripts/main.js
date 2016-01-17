var app = angular.module('tickerTracker', ['ngResource', 'ui.bootstrap', 'ui.select2', 'ngAnimate', 'ngMaterial']);

app.controller('someCtrl', ['$scope', '$location', function($scope, $location) {

  $scope.go = function(path) {
    $location.path = (path);
  };
}]);
