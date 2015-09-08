app.controller('tabsCtrl', ['$scope', function($scope) {
  $scope.tabs = [{
    title: 'Profile',
    url: 'one.tpl.html'
  }, {
    title: 'My Stocks',
    url: 'two.tpl.html'
  }, {
    title: 'News Feed',
    url: 'three.tpl.html'
  }];

  $scope.currentTab = 'two.tpl.html';

  $scope.onClickTab = function(tab) {
    $scope.currentTab = tab.url;
  };

  $scope.isActiveTab = function(tabUrl) {
    return tabUrl == $scope.currentTab;
  };

  $scope.changeColour = function() {
    if ( stock.Change < 0 ) {
      angular.element('#stockList').css('background-color, red');
    } else {
      angular.element('#stockList').css('background-color, #fff');
    }
  };
}]);
