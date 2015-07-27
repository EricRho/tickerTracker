// Provides negative number for currency in the case of loss
app.config(['$provide', function($provide) {
  $provide.decorator('$locale', ['$delegate', function($delegate) {
    if($delegate.id =='en-us') {
      $delegate.NUMBER_FORMATS.PATTERNS[1].negPre = '-\u00A4';
      $delegate.NUMBER_FORMATS.PATTERNS[1].negSuf = '';
    }
    return $delegate;
  }]);
}]);
