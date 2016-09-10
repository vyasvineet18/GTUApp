/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var loginApp = angular.module('loginApp', []);

loginApp.controller('loginCtrl', function($scope, $window, loginService) {
    $scope.loginParam = {};
//    $scope.errormsg = "Sign in to start your session";
    $scope.login = function() {
        // ajax call login service username & pwd param
        // json success:1/0,1
        if ($scope.loginform.$valid) {
            loginService.login($scope.username, $scope.password)
                    .success(function(data) {
                        if (data.success && data.success === 1) {
                            put("USEROBJ", JSON.stringify(data.data));
                            loginService.getLookupCache()
                                    .success(function(data) {
                                        console.log(JSON.stringify(data));
                                        put("LOOKUP_CACHE", JSON.stringify(data.data));
                                        loginService.getConfigurationValue('defaultrecordsperpage')
                                                .success(function(data) {
                                                    put("DEFAULTPAGEPERSIZE", data.data);
                                                    $window.location = '/app/jsp/webportal/index.jsp#/dashboard';
                                                }).error(function() {
                                            $window.location = '/app/jsp/webportal/index.jsp#/dashboard';
                                        });
                                    })
                                    .error(function() {
                                        $window.location = '/app/jsp/webportal/index.jsp#/dashboard';
                                    });
                        } else {
                            // invalid login
                            $scope.loginform.username.$invalid=true;
                            $scope.loginform.loginFormSubmitted = true;
//                            $scope.errormsg = "Enter correct username or password";
//                            $scope.isError = true;
                        }
                    });
        } else {
            $scope.loginform.loginFormSubmitted = true;
        }
    };
});

loginApp.service('loginService', function($http) {
    return {
        login: function(username, password) {
            return $http({
                method: 'POST',
                url: '/app/auth/',
                data: $.param({customerID: "-1", username: username, password: password, client: "webportal"}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            });
        },
        getLookupCache: function() {
            return $http({
                method: 'GET',
                url: '/app/rest/lookup/getAllCache'
            });
        },
        getConfigurationValue: function(key) {
            return $http({
                method: 'GET',
                url: '/app/rest/configuration/' + key
            });
        }
    };
});
