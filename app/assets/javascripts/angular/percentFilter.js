app.filter('percentage', ['$filter', function($filter) {
  return function(input, decimals) {
    return $filter('number')(input * 1, decimals) + '%';
  };
}]);
