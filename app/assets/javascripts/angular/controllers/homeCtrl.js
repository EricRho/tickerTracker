app.controller('homeCtrl', ['$scope', 'Session', 'sessionService', function($scope, Session, sessionService) {
  $scope.user = session.user;
}]);
