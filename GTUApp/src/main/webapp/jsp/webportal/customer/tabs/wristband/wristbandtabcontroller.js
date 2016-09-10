/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('wristbandtabController', function($scope, wristbandtabService, $routeParams) {

    $scope.isDataLoaded = false;
    $scope.paginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};

    $scope.fetchAllWristbandsByCustId = function() {
        wristbandtabService.fetchAllWristbandsByCustId($routeParams.customerid, $scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.wirstbandData = data.data;
                    }
                });
    };

    $scope.fetchAllWristbandCountsByCustId = function() {
        wristbandtabService.fetchAllWristbandCountsByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };

    $scope.loadAll = function() {
        $scope.fetchAllWristbandsByCustId();
        $scope.fetchAllWristbandCountsByCustId();
    };

    $scope.loadAll();

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllWristbandsByCustId();
    };

    $scope.viewWristBandModal = function(item) {
        $scope.macAddress = item.macAddress;
        $scope.manufacture = item.manufacturer;
        $scope.identifier = item.identifier;
        $scope.assignedUserName = item.assignedUserName;
        $scope.startDate = item.startDate;
        $scope.endDate = item.endDate;
        $("#wristbandviewmodal").modal('show');
    };


});

hyginexApp.service('wristbandtabService', function($http) {
    return {
        fetchAllWristbandsByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/userWristband/customerid/' + customerid + '/fetchuserwristband/' + start + '/' + limit
            });
        },
        fetchAllWristbandCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/userWristband/customerid/' + customerid + '/fetchallcount'
            });
        }
    };
});
