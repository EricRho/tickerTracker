app.controller('stocksCtrl', ['$scope', 'Stock', '$filter', '$http', function($scope, Stock, $filter, $http) {
  $scope.stocks = Stock.all();
  $scope.error = false;

  $scope.deleteStock = function(id, idx) {
    $scope.stocks.splice(idx, 1);
    return Stock.delete(id);
  };
  $scope.createStock = function() {
    var attr = {};
    attr.symbol = $filter('uppercase')($scope.newCompany);
    $http({ method: 'GET', url: 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22' + "'" + attr.symbol + "'" + '%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='})
      .success(function(data, status, headers, config) {
        $scope.error = false;
        attr.name = data.query.results.quote.symbol;
      });
    var newStock = Stock.create(attr);
    $scope.stocks.push(newStock);
    $scope.newCompany = '';
  };
  $scope.select2Options = {

  };
  $scope.companyList = [
    {symbol: 'ARRY', name: 'Array Biopharma Inc.'},
    {symbol: 'MSFT', name: 'Microsoft Corporation'}
  ];
}]);
