// app.factory('User', ['$resource', '$http', function($resource, $http) {
//   var user = {};
//   var currentUser = $http({
//     method: 'GET',
//     url: 'localhost:3000/api/current_user'
//   }).success(function(data, status, headers, config) {
//     user.id = id;
//     user.name = name;
//   });
//   return currentUser;
// }]);

// app.factory('User', ['$resource', function($resource) {
//   var currentUser = $resource('/api/current_user');
//   return currentUser;
// }]);
