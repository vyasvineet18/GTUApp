/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('usertabController', function($scope, usertabService, $routeParams, $timeout) {
    $scope.isDataLoaded = false;
    $scope.paginationObject = {'start': 0, 'limit': 50, 'currentPage': 1, 'totalRecords': 0};
    $scope.newuser = {'usertitle': 'Add User', 'userid': 0, 'first': '', 'last': '', 'phone': '', 'email': '', 'login': '', 'isActive': 'Y', 'password': '', 'confirmpassword': '', 'profilePhoto': '', 'roleid': 0, 'loginRequired': 'Y'};
    $scope.newuser.role={'roleId':0,'name':'','isActive':null,'createdDate':null,'createdBy':null,'updatedDate':null,'updatedBy':null};

    $scope.userFormSubmitted = false;

    $scope.fetchAllUsersByCustId = function(callBack) {
        usertabService.fetchAllUsersByCustId($routeParams.customerid, $scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.userData = data.data;
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

    $scope.fetchAllUserCountsByCustId = function(callBack) {
        usertabService.fetchAllUserCountsByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
    };

    $scope.loadAll = function() {
        $scope.fetchAllUsersByCustId();
        $scope.fetchAllUserCountsByCustId();
    };

    $scope.loadAll();

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllUsersByCustId();
    };

    $scope.expandUser = function(userid) {
        $scope.selectedUserId = userid;
    };

    $scope.viewUser = function(item) {
        $scope.newuser.usertitle = 'View User';
        $scope.newuser.first = item.first;
        $scope.newuser.last = item.last;
        $scope.newuser.phone = item.phone;
        $scope.newuser.email = item.email;
        $scope.newuser.login = item.login;
        $scope.newuser.password = item.password;
        if (item.isActive === 'Y') {
            $scope.newuser.isActive = 'Yes';
        } else {
            $scope.newuser.isActive = 'No';
        }
        $scope.newuser.roleid = item.role.roleName;
        $scope.newuser.profilePhoto = item.profilePhoto;
        $("#userviewmodal").modal('show');
    };
    
    $scope.openImgInModal = function(path) {
        $('#imagepreview').attr('src', path); // here asign the image to the modal when the user click the enlarge link
        $('#imagemodal').modal('show');
    };

    $scope.resetUserVariables = function() {
        $scope.userForm.userFormSubmitted = false;
        $scope.newuser = {'usertitle': 'Add User', 'userid': 0, 'first': '', 'last': '', 'phone': '', 'email': '', 'login': '', 'isActive': 'Y', 'password': '', 'confirmpassword': '', 'profilePhoto': '', 'roleid': 0, 'loginRequired': 'Y'};
    };

    $scope.uploadedFile = function(element) {
        $scope.$apply(function($scope) {
//            var reader = new FileReader();
//            reader.onload = function (e) {
//                $('.profile-pic').attr('src', e.target.result);
//            };
//            reader.readAsDataURL(element.files[0]);
//            $('.profile-pic').css({ 'display': "block" });
            $scope.files = element.files;
            console.log($scope.files);
        });
    };

    $scope.openUserModal = function() {
        usertabService.fetchAllRolesByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.roleArray = data.data;
                    if ($scope.roleArray !== undefined && $scope.roleArray.length > 0) {
                        $scope.newuser.roleid = $scope.roleArray[0].roleId;
                    }
                    $("#useraddupdatemodal").modal('show');
                });
    };

    $scope.submitUser = function() {    	
        if ($scope.newuser.password !== $scope.newuser.confirmpassword) {
            $scope.userForm.userFormSubmitted = true;
            $timeout(function() {
                $scope.userForm.confirmpassword.$invalid = true;
            });
            $scope.userForm.confirmpassword.$setValidity('notsame', false);
        } else {
            $scope.userForm.confirmpassword.$invalid = false;
            $scope.userForm.confirmpassword.$setValidity('notsame', true);
            if ($scope.userForm.$valid) {
                var file = '';
                if ($scope.files !== undefined) {
                    file = $scope.files[0];
                }
                
                $scope.newuser.roleid=$scope.newuser.role.roleId;
                usertabService.uploadUser($scope.newuser.userid, $scope.newuser.first, $scope.newuser.last, $scope.newuser.email, $scope.newuser.phone, $scope.newuser.login, $scope.newuser.password, $scope.newuser.roleid, $routeParams.customerid, file)
                        .success(function(data) {
                            $scope.fetchAllUsersByCustId(function() {
                                $scope.resetUserVariables();
                                $scope.fetchAllUserCountsByCustId(function() {
                                    $("#useraddupdatemodal").modal('hide');
                                });
                            });
                        }).error(function(data) {
                    hyginexAlert('Error in User insertion/updation, try again');
                    $("#useraddupdatemodal").modal('hide');
                });
            } else {
                $scope.userForm.userFormSubmitted = true;
            }
        }
    };

    $scope.updateUser = function(item) {
        $scope.newuser.usertitle = 'Edit User';
        $scope.newuser.first = item.first;
        $scope.newuser.last = item.last;
        $scope.newuser.phone = item.phone;
        $scope.newuser.email = item.email;
        $scope.newuser.login = item.login;
        $scope.newuser.password = item.password;
        $scope.newuser.confirmpassword = item.password;
        $scope.newuser.isActive = item.isActive;
        $scope.newuser.userid = item.id;
        $scope.newuser.loginRequired = item.loginRequired;
        //$scope.newuser.roleid = item.role.roleid;
        
        usertabService.fetchAllRolesByCustId($routeParams.customerid)
                .success(function(data) {
                	
                    $scope.roleArray = data.data;
                    console.log($scope.roleArray);
                    $("#useraddupdatemodal").modal('show');
                }).error(function() {
            $("#useraddupdatemodal").modal('show');
        });
        $scope.newuser.role={'roleId':item.role.roleid,'name':item.role.roleName,'isActive':null,'createdDate':null,'createdBy':null,'updatedDate':null,'updatedBy':null};
        console.log($scope.newuser.role);
    };

    $scope.deleteUser = function(item) {
        hyginexConfirm('Delete User',
                'Are you sure to want to delete user : ' + item.first + ' ' + item.last + ' ? ',
                function() {
                    usertabService.deleteUser(item.id)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllUsersByCustId();
                                } else {
                                    hyginexAlert('Error in User deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in User deletion, try again');
                    });
                }, function() {
        });
    };

});

hyginexApp.directive('loginUnique', ['usertabService', function(usertabService) {
        return {
            restrict: 'A',
            require: 'ngModel',
            scope: { 
                userid: '=userid'
            },
            link: function(scope, element, attrs, ngModel) {
                element.bind('blur', function(e) {
                    if (!ngModel || !element.val())
                        return;
                    var currentValue = element.val();
                    usertabService.checkUniqueLogin(currentValue,scope.userid)
                            .then(function(unique) {
                                if (currentValue == element.val()) {
                                    ngModel.$setValidity('unique', unique.data.data);
                                }
                            }, function() {
                                ngModel.$setValidity('unique', true);
                            });
                });
            }
        };
    }]);

hyginexApp.directive('emailUnique', ['usertabService', function(usertabService) {
        return {
            restrict: 'A',
            require: 'ngModel',
            scope: { 
                userid: '=userid'
            },
            link: function(scope, element, attrs, ngModel) {
                element.bind('blur', function(e) {
                    if (!ngModel || !element.val())
                        return;
                    var currentValue = element.val();
                    usertabService.checkUniqueEmail(currentValue,scope.userid)
                            .then(function(unique) {
                                if (currentValue == element.val()) {
                                    ngModel.$setValidity('unique', unique.data.data);
                                }
                            }, function() {
                                ngModel.$setValidity('unique', true);
                            });
                });
            }
        };
    }]);



hyginexApp.service('usertabService', function($http) {
    return {
        fetchAllUsersByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/customerid/' + customerid + '/fetchuser/' + start + '/' + limit
            });
        },
        fetchAllUserCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/customerid/' + customerid + '/fetchallusercount'
            });
        },
        uploadUser: function(userid, first, last, email, phone, login, password, roleid, customerid, file) {
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
        },
        fetchAllRolesByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/role/customerid/' + customerid + '/fetchallrole'
            });
        },
        checkUniqueLogin: function(login,userid) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/login/' + login + '/userid/' + userid +'/checkuniquelogin'
            });
        },
        checkUniqueEmail: function(email,userid) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/email/' + email + '/userid/' + userid +'/checkuniqueemail'
            });
        },
        deleteUser: function(userid) {
            return $http({
                method: 'POST',
                url: '/app/rest/user/userid/' + userid + '/deleteuser',
                headers: {'Content-Type': 'application/json'}
            });
        }
    };
});