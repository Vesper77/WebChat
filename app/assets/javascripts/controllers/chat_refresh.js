var chat = angular.module("chat", []);
chat.controller("TestCtrl", function ($scope) {
    $scope.doStuff = function (item) {
        console.log(item.currentTarget.getAttribute('user_id'));
    };
});