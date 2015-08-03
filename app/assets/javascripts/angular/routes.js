app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: '/templates/dashboard.html',
    controller: 'stocksCtrl',
    resolve: {
      session: function(sessionService) {
        return sessionService.getCurrentUser();
      }
    }
  })
  .otherwise({
    redirectTo: '/'
  });
}]);
