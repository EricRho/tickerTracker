app.controller('stocksCtrl', ['$scope', 'Stock', '$filter', '$http', '$q', function($scope, Stock, $filter, $http, $q) {
  $scope.stocks = Stock.all();
  $scope.error = false;

  $scope.deleteStock = function(id, idx) {
    $scope.stocks.splice(idx, 1);
    return Stock.delete(id);
  };

  $scope.createStock = function() {
    $scope.getStockData($filter('uppercase')($scope.newCompany))
    .then(function(result) {
      $scope.error = false;
      $scope.stocks.push(Stock.create(result));
    }, function(error) {
      $scope.error = true;
    });
  };

  $scope.select2Options = {
    'ajax': {
      type: 'GET',
      url: 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%3D%22AAPL%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=quote',
      dataType: 'jsonp',
      jsonp: 'callback',
      jsonCallback: 'quote'
    }
  };
  $scope.stocklist = [
    {symbol: 'ARRY', name: 'Array Biopharma Inc.'},
    {symbol: 'MSFT', name: 'Microsoft Corporation'},
    {symbol: 'SNY', name: 'Sanofi'}
  ];

  $scope.$watch('newCompany', function() {
    if ($scope.newCompany !== '' && $scope.newCompany !== undefined) {
      $scope.createStock();
    }
  });

  $scope.getStockData = function(symbol) {
    var deferred = $q.defer();
    var stock = {};
    $scope.loading = true;
    $http({ method: 'GET', url: 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22' + "'" + symbol + "'" + '%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='})
      .success(function(data, status, headers, config) {
        stock.symbol = symbol;
        stock.name = data.query.results.quote.Name;
        stock.ask = data.query.results.quote.Ask;
        stock.bid = data.query.results.quote.Bid;
        stock.change = data.query.results.quote.Change;
        stock.change_in_percent = data.query.results.quote.ChangeinPercent;
        $scope.loading = false;
        deferred.resolve(stock);
      }).error(function(data, status, headers, config) {
        $scope.loading = false;
        deferred.reject(status);
      });
      return deferred.promise;
  };

  $scope.updateStock = function(id, idx) {
    var stock = $scope.stocks[idx];
    $scope.getStockData(stock.symbol)
    .then(function(result) {
      $scope.error = false;
      result.id = stock.id;
      Stock.update(result);
      $scope.stocks[idx] = result;
    }, function(error) {
      $scope.error = true;
    });
  };

}]);
