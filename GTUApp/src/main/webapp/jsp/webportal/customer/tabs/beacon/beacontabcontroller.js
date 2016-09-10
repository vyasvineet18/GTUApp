/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('beacontabController', function($scope, beacontabService, $routeParams) {

    $scope.isDataLoaded = false;
    $scope.paginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};

    $scope.fetchAllBeaconsByCustId = function() {
        beacontabService.fetchAllBeaconsByCustId($routeParams.customerid, $scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.beaconData = data.data;
                        console.log(JSON.stringify($scope.beaconData));
                    }
                });
    };

    $scope.fetchAllBeaconsCountsByCustId = function() {
        beacontabService.fetchAllBeaconsCountsByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };

    $scope.loadAll = function() {
        $scope.fetchAllBeaconsByCustId();
        $scope.fetchAllBeaconsCountsByCustId();
    };

    $scope.loadAll();

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllBeaconsByCustId();
    };

    $scope.viewBeaconModal = function(item) {
        $scope.viewBeacon = {};
        $scope.viewBeacon.macAddress = item.macAddress;
        $scope.viewBeacon.manufacture = item.manufacturer;
        $scope.viewBeacon.identifier = item.identifier;
        $scope.viewBeacon.type = item.typeName;
        $scope.viewBeacon.unit = item.unitName;
        $scope.viewBeacon.room = item.roomName;
        $scope.viewBeacon.locationComment = item.locationComment;
        $scope.viewBeacon.locationRule = '-';
        $scope.viewBeacon.batteryType = item.batteryType;
        $scope.viewBeacon.batteryCount = item.batteryCount;
        $scope.viewBeacon.batteryLevel = item.batteryLevel;
        $scope.viewBeacon.startDate = item.startDate;
        $scope.viewBeacon.endDate = item.endDate;
        $("#beaconviewmodal").modal('show');
    };

});

hyginexApp.service('beacontabService', function($http) {
    return {
        fetchAllBeaconsByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/beacon/customerid/' + customerid + '/fetchbeacon/' + start + '/' + limit
            });
        },
        fetchAllBeaconsCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/beacon/customerid/' + customerid + '/fetchallcount'
            });
        }
    };
});
