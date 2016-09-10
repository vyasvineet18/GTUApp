
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('userController', function($scope, userService) {
    $scope.title = "Beacon";
    $scope.isDataLoaded = false;
    $scope.paginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};
    $scope.pagesize = "10";

    $scope.fetchAllBeaconMsts = function() {
        beaconService.fetchAllBeaconMsts($scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.beaconData = data.data;
                        console.log(JSON.stringify($scope.beaconData));
                    }
                });
    };

    $scope.fetchAllBeaconMstsCounts = function() {
        beaconService.fetchAllBeaconMstCounts()
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };

    $scope.loadAll = function() {
        $scope.fetchAllBeaconMsts();
        $scope.fetchAllBeaconMstsCounts();
    };

    $scope.loadAll();

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllBeaconMsts();
    };

    $scope.changePageSize = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.paginationObject.start = 0;
        $scope.paginationObject.currentPage = 1;
        $scope.paginationObject.limit = $scope.pagesize;
        $scope.fetchAllBeaconMsts();
    };
});

hyginexApp.service('userService', function($http) {
    return {
        fetchAllBeaconMsts: function(start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/beaconMst/fetchbeaconmst/' + start + '/' + limit
            });
        },
        fetchAllBeaconMstCounts: function() {
            return $http({
                method: 'GET',
                url: '/app/rest/beaconMst/fetchbeaconmst/fetchallcount'
            });
        }
    };
});

