/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('dispensertabController',function($scope,dispensertabService,$routeParams){
    $scope.isDataLoaded = false;
    $scope.paginationObject={'start':0,'limit':5,'currentPage':1,'totalRecords':0};
    
    $scope.fetchAllDispensersByCustId = function(){
        dispensertabService.fetchAllDispensersByCustId($routeParams.customerid,$scope.paginationObject.start,$scope.paginationObject.limit)
        .success(function(data){
            if(data.success && data.success === 1){
                $scope.dispenserData=data.data;
                console.log(JSON.stringify($scope.dispenserData));
            }
        });
    };
    $scope.fetchAllDispenserCountsByCustId = function() {
        dispensertabService.fetchAllDispenserCountsByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };
    
    $scope.loadAll = function() {
        $scope.fetchAllDispensersByCustId();
        $scope.fetchAllDispenserCountsByCustId();
    };
    
    $scope.loadAll();
    
    $scope.fetchThroughPagination = function(){
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllDispensersByCustId();
    };
    
    $scope.viewDispenserModal = function(item) {
        $scope.viewdispenser={};
        $scope.viewdispenser.macAddress = item.macAddress;
        $scope.viewdispenser.identifier = item.identifier;
        $scope.viewdispenser.type = item.typeName;
        $scope.viewdispenser.media = item.media;
        $scope.viewdispenser.unit = item.unitName;
        $scope.viewdispenser.room = item.roomName;
        $scope.viewdispenser.locationComment = item.locationComment;
        $scope.viewdispenser.batteryType = item.batteryType;
        $scope.viewdispenser.batteryCount = item.batteryCount;
        $scope.viewdispenser.batteryLevel = item.batteryLevel;
        $scope.viewdispenser.startDate = item.startDate;
        $scope.viewdispenser.endDate = item.endDate;
        $("#dispenserviewmodal").modal('show');
    };
    
});
    
hyginexApp.service('dispensertabService', function($http) {
    return {
        fetchAllDispensersByCustId: function(customerid,start,limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/dispenser/customerid/' + customerid + '/fetchdispenser/'+start+'/'+limit
            });
        },
        fetchAllDispenserCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/dispenser/customerid/' + customerid + '/fetchallcount/'
            });
        }
    };
});
