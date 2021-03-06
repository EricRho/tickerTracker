app.factory('sessionService', function($http, $q) {
  var service = {
    getCurrentUser: function() {
      if (service.isAuthenticated()) {
        return $q.when(service.currentUser);
      } else {
        return $http.get('/api/current_user').then(function(resp) {
          return service.currentUser = resp.data;
        });
      }
    },
    currentUser: null,
    isAuthenticated: function() {
      return !!service.currentUser;
    }
  };
  return service;
});
