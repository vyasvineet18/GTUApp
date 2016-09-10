/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
gtuApp.controller('collegeController', function($scope, collegeService) {
    

    $scope.getAllCollegeData = function(callBack) {
    	collegeService.getAllCollege()
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.collegeData = data.data;
                        if (callBack) {
                            callBack();
                        }
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
    };

    $scope.loadAll = function() {
        $scope.getAllCollegeData();
    };

    $scope.loadAll();

});

gtuApp.service('collegeService', function($http) {
    return {
        /*fetchAllUsersByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/customerid/' + customerid + '/fetchuser/' + start + '/' + limit
            });
        },*/
        getAllCollege: function() {
            return $http({
                method: 'GET',
                url: '/gtuapp/rest/college/all/'
            });
        },
        /*uploadUser: function(userid, first, last, email, phone, login, password, roleid, customerid, file) {
            var fd = new FormData();
            fd.append("file", file);
            fd.append("userid", userid);
            fd.append("first", first);
            fd.append("last", last);
            fd.append("email", email);
            if(phone==null)
            	phone="";
            fd.append("phone", phone);
            fd.append("login", login);
            fd.append("password", password);
            fd.append("roleid", roleid);
            fd.append("customerid", customerid);
            fd.append("loginrequired", 'Y');           
            return $http({
                method: 'POST',
                withCredentials: false,
                url: '/app/rest/user/addupdateuser',
                data: fd,
                headers: {'Content-Type': undefined},
                transformRequest: angular.identity
            });
        },*/
        
    };
});