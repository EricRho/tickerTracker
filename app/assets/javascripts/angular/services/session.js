app.factory('Session', function($resource) {
  return $resource('http://localhost:3000/devise/session/:sessionId');
});
