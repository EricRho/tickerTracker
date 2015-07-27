// Creates filter for percentages.
// BUG***
// Will not update when 'Update' button is pressed. Shows as blank percentage
app.filter('percentage', ['$filter', function($filter) {
  return function(input, decimals) {
    return $filter('number')(input * 1, decimals) + '%';
  };
}]);
