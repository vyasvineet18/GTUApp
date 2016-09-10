/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('gatewaytabController',function($scope,gatewaytabService,$routeParams){
    $scope.isDataLoaded = false;
    $scope.paginationObject={'start':0,'limit':5,'currentPage':1,'totalRecords':0};
    
    $scope.fetchAllGatewayDeviceByCustId = function(){
    	gatewaytabService.fetchAllGatewayDeviceByCustId($routeParams.customerid,$scope.paginationObject.start,$scope.paginationObject.limit)
        .success(function(data){
            if(data.success && data.success === 1){
                $scope.gatewayDeviceData=data.data;
                console.log(JSON.stringify($scope.gatewayDeviceData));
            }
        });
    };
    $scope.fetchAllGatewayDeviceCountsByCustId = function() {    	
    	gatewaytabService.fetchAllGatewayDeviceCountsByCustId($routeParams.customerid)
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };
    
    //To get datetime as per timezone (To get date and time as it is from db)
    var toUTCDate = function(date){
        var _utc = new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(),  date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds());
        return _utc;
      };
      
      var millisToUTCDate = function(millis){    	  
    	  if(millis==null)
    		  return null;
    	  return toUTCDate(new Date(millis));
      };
      
        $scope.toUTCDate = toUTCDate;
        $scope.millisToUTCDate = millisToUTCDate;
      
    
    $scope.loadAll = function() {
        $scope.fetchAllGatewayDeviceByCustId();
        $scope.fetchAllGatewayDeviceCountsByCustId();
    };
    
    $scope.loadAll();
    
    $scope.fetchThroughPagination = function(){
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllGatewayDeviceByCustId();
    };
    
    $scope.viewGatewayModal = function(item) {
        $scope.viewGateway={};
        $scope.viewGateway.deviceId = item.deviceId;
        $scope.viewGateway.deviceName = item.deviceName;        
        $scope.viewGateway.deviceStatus = item.deviceStatus;        
        $scope.viewGateway.exportEventsTime = item.exportEventsTime;
        $scope.viewGateway.bluetoothInteractionTime = item.bluetoothInteractionTime;
        $scope.viewGateway.restartTime = item.restartTime;
        $scope.viewGateway.batteryStatus = item.batteryStatus;
        $scope.viewGateway.loggedInTime = item.loggedInTime;
        $scope.viewGateway.userName = item.userName;
        $scope.viewGateway.unitName = item.unitName;
        $("#gatewayeviewmodal").modal('show');
    };
    
    $scope.restartGateway=function(item) {
    	var eventGateway="restart";    	
    	alert("Request Sent For "+ eventGateway);
    	
    	var response =gatewaytabService.sendGatewaySignal(item,eventGateway);
        response.success(function(){
            if(data.success && data.success === 1){
            	console.log("Request Successful For "+item);                
            }
        });
        response.error(function() {
        	console.log("Restart Request wasn't Successful");
        });
    };
    
    $scope.logoutGateway=function(item) {
    	var eventGateway="logout";    	
      	alert("Request Sent For "+eventGateway);      	
    	var response =gatewaytabService.sendGatewaySignal(item,eventGateway);
        response.success(function(){
            if(data.success && data.success === 1){
            	console.log("Request Successful For "+item);                
            }
        });
        response.error(function() {
        	console.log("Logout Request wasn't Successful");
        });
    };
    
});
    
hyginexApp.service('gatewaytabService', function($http) {
    return {
        fetchAllGatewayDeviceByCustId: function(customerid,start,limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/gatewayDevice/customerid/' + customerid + '/fetchGatewayDevice/'+start+'/'+limit
            });
        },
        fetchAllGatewayDeviceCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/gatewayDevice/customerid/' + customerid + '/fetchallcount/'
            });
        },
        sendGatewaySignal : function(deviceId,eventGateway) {
        	return $http({
                method: 'GET',
                url: '/app/rest/gatewayDevice/sendGatewaySignal/deviceId/' + deviceId + '/event/'+eventGateway
            });
        }
    }; 
});
