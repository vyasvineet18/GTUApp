/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('adminhospitalController', function($scope, adminhospitalService) {
    $scope.title = "Hospital";
    $scope.isDataLoaded = false;
    $scope.defaultrecordsperpage = get("DEFAULTPAGEPERSIZE");
    if ($scope.defaultrecordsperpage === null) {
    	$scope.defaultrecordsperpage = 10;
    }
    $scope.paginationObject = {'start': 0, 'limit': parseInt($scope.defaultrecordsperpage), 'currentPage': 1, 'totalRecords': 0};

    $scope.fetchAllCustomers = function() {
    	
    	if ($scope.defaultrecordsperpage === null) {
        	$scope.defaultrecordsperpage = 10;
        	//$scope.paginationObject.limit=10;
        }
        adminhospitalService.fetchAllCustomers($scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.hospData = data.data;
                        for (index = 0; index < $scope.hospData.length; index++) {
                            $scope.hospData[index].fulladdress = buildAddress($scope.hospData[index].address);
                        }
                    }
                });
    };

    $scope.fetchAllCustomerCounts = function() {    	
        adminhospitalService.fetchAllCustomerCounts()
                .success(function(data) {
                    $scope.paginationObject.totalRecords = data.totalRecords;
                    $scope.isDataLoaded = true;
                });
    };

    $scope.viewHospitalModal = function(item) {
        $scope.customerid = item.id;
        $scope.customername = item.name;
        console.log("Plan :"+item.plan);
        $scope.customerplan = item.plan;
        $scope.customeraddress = item.fulladdress;
        console.log($("#viewcustomermodal"));
        $("#viewcustomermodal").css("display", "inline");
        $("#hospitalviewmodal").modal('show');
    };

    $scope.resetHospitalVariables = function() {
        $("#viewcustomermodal").css("display", "none");
    };
    $scope.loadAll = function() {
        $scope.defaultrecordsperpage = get("DEFAULTPAGEPERSIZE");
        if ($scope.defaultrecordsperpage === undefined) {
            $scope.defaultrecordsperpage = 10;
            
        }
        $scope.fetchAllCustomers();
        $scope.fetchAllCustomerCounts();
    };

    $scope.loadAll();
    
    $scope.getLink=function(item) {    	 
    	if(item.plan=='Level I')
    		return "#hospitaldetail/"+item.id+"/dashboardLevel1?plan="+item.plan;
    	else if(item.plan=='Level II')
    		return "#hospitaldetail/"+item.id+"/dashboard?plan="+item.plan;
    	else
    		return "#hospitaldetail/"+item.id+"/dashboardLevel3?plan="+item.plan;
    };

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllCustomers();
    };
    
    $scope.changePageSize = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.paginationObject.start = 0;
        $scope.paginationObject.currentPage = 1;
        $scope.paginationObject.limit = parseInt($scope.defaultrecordsperpage);
        $scope.fetchAllCustomers();
    };

    $scope.deleteHospital = function(item) {
        hyginexConfirm('Delete Hospital',
                'Are you sure to want to delete hospital : ' + item.name + ' ? ',
                function() {
                    adminhospitalService.deleteHospital(item.id)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    adminhospitalService.fetchAllCustomers($scope.paginationObject.start, $scope.paginationObject.limit)
                                            .success(function(data) {
                                                $scope.hospData = data.data;
                                                for (index = 0; index < $scope.hospData.length; index++) {
                                                    $scope.hospData[index].fulladdress = buildAddress($scope.hospData[index].address);
                                                }
                                            });
                                    adminhospitalService.fetchAllCustomerCounts()
                                    .success(function(data) {
                                        $scope.paginationObject.totalRecords = data.totalRecords;
                                        $scope.isDataLoaded = true;
                                    });
                                    
                                } else {
                                    hyginexAlert('Error in hospital deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in hospital deletion, try again');
                    });
                }, function() {
        });
    };
});

hyginexApp.service('adminhospitalService', function($http) {
    return {
        fetchAllCustomers: function(start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/customer/fetchAll/' + start + '/' + limit
            });
        },
        fetchAllCustomerCounts: function() {
            return $http({
                method: 'GET',
                url: '/app/rest/customer/fetchAllCustomers/fetchAllCount'
            });
        },
        deleteHospital: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/customer/customerid/' + id + '/deletecustomer',
                headers: {'Content-Type': 'application/json'}
            });
        }
    };
});

function buildAddress(address) {
    if (address) {
        return address.buildingNumber + " " + address.streetName +  " " + address.city + " " +
                address.state + " " + address.country + " " +address.zipcode;
    }
}
