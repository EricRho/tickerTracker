app.controller('stocksCtrl', ['$scope', 'Stock', '$filter', function($scope, Stock, $filter) {
  $scope.stocks = Stock.all();

  $scope.deleteStock = function(id, idx) {
    $scope.stocks.splice(idx, 1);
    return Stock.delete(id);
  };
  $scope.createStock = function() {
    var attr = {};
    attr.symbol = $filter('uppercase')($scope.newCompany);
    var newStock = Stock.create(attr);
    $scope.stocks.push(newStock);
    $scope.newCompany = '';
  };
}]);
