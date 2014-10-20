// Generated by CoffeeScript 1.8.0
(function() {
  var app;

  app = angular.module("myApp", []);

  app.controller("MyCtrl", function($scope, $http) {
    $scope.loadData = function() {
      return $scope.items = $scope.data.people;
    };
    $scope.addData = function() {
      return $scope.messages = $scope.items;
    };
    $scope.loadGitData = function() {
      return $scope.gitItems = $scope.initGitData;
    };
    $scope.loadForecast = function() {
      return $scope.forecasts = [$scope.data.forecast];
    };
    $scope.loadCalendar = function() {
      return $scope.events = $scope.data.calendar;
    };
    $scope.init = function($scope, $http) {
      $http.get("https://api.github.com/users/benjamintillett?access_token=38bff0b3c9fb460aa58a4a5ea270e3b7af8c0cde").success(function(data) {
        return $scope.initGitData = [data];
      });
      return $http.get('http://localhost:9292/angular/jsons').success(function(data) {
        return $scope.data = data;
      });
    };
    $scope.init($scope, $http);
  });

}).call(this);
