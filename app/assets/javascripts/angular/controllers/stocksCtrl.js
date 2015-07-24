app.controller('stocksCtrl', ['$scope', 'Stock', '$filter', '$http', '$q', function($scope, Stock, $filter, $http, $q) {
  $scope.stocks = Stock.all();
  $scope.error = false;

  // Ajax call to populate Search bar.
  // initSelection is to prevent error. No clue what it actually does
  $scope.select2Options = {
    initSelection: function(el, fn) {},
    'ajax': {
      url: '/api/derivatives.json',
      dataType: 'json',
      data: function(term, page) {
        return { q: term};
      },
      results: function(data, page) {
        console.log(data);
        return { results: data };
      }
    }
  };

  $scope.deleteStock = function(id, idx) {
    $scope.stocks.splice(idx, 1);
    return Stock.delete(id);
  };

  // Hack around. createStock() keeps creating an extra stock with all params
  // either undefined or nil. Throws errors and prevents creation of empty Stock
  $scope.createStock = function() {
    $scope.getStockData($filter('uppercase')($scope.newCompany.symbol))
      .then(function(result) {
        if (result.symbol === undefined) {
          $scope.error = true;
        } else {
          $scope.error = false;
          $scope.stocks.push(Stock.create(result));
          $scope.newCompany = '';
        }
      });
  };

  // Creates watcher for when user types in newCompany search.
  // Once change is noticed, creates stock. Issue here. Creates extra emtpy Stock.
  $scope.$watch('newCompany', function() {
    if ($scope.newCompany != '' && $scope.newCompany != null) {
      $scope.createStock();
    }
  });

  // Retrieves stock information from yahoofinance.
  // using $http to send get request to API
  $scope.getStockData = function(symbol) {
    var deferred = $q.defer();
    var stock = {};
    $scope.loading = true;
    $http({
        method: 'GET',
        url: 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22' +
          "'" + symbol + "'" +
          '%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
      })
      // On success, iterates through to needed information and sets to current
      // stock param
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

  $scope.updateStock = function(id, data) {
    var stock = $scope.stocks[data];
    $scope.getStockData(stock.symbol)
      .then(function(result) {
        $scope.error = false;
        result.id = stock.id;
        Stock.update(result);
        $scope.stocks[data] = result;
      }, function(error) {
        $scope.error = true;
      });
  };

}]);
