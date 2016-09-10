/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var passwordApp = angular.module('passwordApp', []);

passwordApp.controller('passwordCtrl', function($scope, $window, passwordService) {
    $scope.validateUserName = function() {
        // ajax call login service username & pwd param
        // json success:1/0,1
        if($scope.username){
            passwordService.validateUserName($scope.username)
                    .success(function(data) {
                        if (data.success && data.success === 1) {
                            $scope.passwordconfirmationbox = true;
                        } else {
                            // invalid username
                            $scope.isError = true;
                            $scope.errorContent = "Can't find that username, enter correct one";
                        }
                    });
                }else{
                    $scope.isError = true;
                    $scope.errorContent = "username field must be nonempty";
                }
    };

    $scope.changePassword = function() {
        if ($scope.password && $scope.confirmpassword && $scope.password === $scope.confirmpassword) {
            passwordService.changePassword(activationkey,$scope.password,$scope.confirmpassword)
                    .success(function(data) {
                        if(data.success && data.success === 1){
                            $scope.passwordupdatesuccess=true;
                        }else{
                            $scope.errormsg="Error in change password, try forgot password again";
                        }
                    });
        }else{
            if(!$scope.password){
                $scope.errormsg="password field must not be empty";
            }else if(!$scope.confirmpassword){
                $scope.errormsg="confirm password field must not be empty";
            }else{
                $scope.errormsg="password and confirm password must be same";
            }
        }
    };
});

passwordApp.service('passwordService', function($http) {
    return {
        validateUserName: function(username) {
            return $http({
                method: 'POST',
                url: '/app/rest/password/forgotpassword',
                data: $.param({userName: username}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            });
        },
        changePassword: function(activationKey, newPassword, confirmPassword) {
            return $http({
                method: 'POST',
                url: '/app/rest/password/updatepassword',
                data: $.param({activationKey: activationKey, newPassword: newPassword, confirmPassword: confirmPassword}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            });
        }
    };
});
