var chat = angular.module("chat", []);
chat.controller("TestCtrl", function ($scope, $http) {


});

chat.controller("SendCtrl", function ($scope, $http) {

    $scope.doStuff = function (item) {
        var a = angular.element(document.querySelector('#message-area'));
        a.html("");
        console.log(item.currentTarget.getAttribute('user_id'));
        $scope.userId = item.currentTarget.getAttribute('user_id');
        $http({
            method: "POST",
            url: "/message/index",
            data: {userId: $scope.userId}
        }).then(function mySuccess(response) {
            console.log('success');
            // var arr =[];
            // for (var i = 0; i < response.data[0].length; i++) {
            //     arr.push([response.data[0][i],response.data[1][i]])
            // }
            // console.log(response.data['author']);
            // console.log(arr[0][0].name);
            $scope.stuffs = response.data['msgs'];
            $scope.userName = response.data['author'].name
        }, function myError() {
            console.log('error')
        });
    };

    $scope.sendMessage = function () {
        console.log($scope.userId);
        $scope.tempMessage = angular.element(document.querySelector('#message-area'));
        $http({
            method: "POST",
            url: "/message/create",
            data: {message: $scope.message, userId: $scope.userId}
        }).then(function mySuccess() {
            console.log('success');
            // $scope.p = angular.element("<p class='back-message'><b>" + $scope.userName + "</b>:" + $scope.message + "</p>");
            // // $scope.p.text( $scope.userName + ":" +$scope.message);
            // $scope.tempMessage.append($scope.p);
            // $scope.stuffs.push;

        }, function myError() {
            console.log('error')
        });
    };

});

