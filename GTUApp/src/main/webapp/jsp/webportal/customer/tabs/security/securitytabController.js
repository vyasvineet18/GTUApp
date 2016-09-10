/**
 * 
 */

hyginexApp.controller('securitytabController',function($scope, securitytabService, $routeParams, $filter){
    var role=null;
    var checkbox=null;
    var grantFlag;
    var allCheckedFlag=0;
    var allUncheckedFlag=0;
    var count=0;
    var id;
	$scope.isDataLoaded = false;
	
	$scope.defaultrecordsperpage=10;
    if ($scope.defaultrecordsperpage === undefined) {
        $scope.defaultrecordsperpage = 10;
    }    
    $scope.paginationObject={'start':0,'limit':$scope.defaultrecordsperpage, 'currentPage':1,'totalRecords':0};

    $scope.po={'id':0, 'name':'', 'description':'', 'createdDate':'', 'createdBy':'', 'updatedDate':'', 'updatedBy':''};
    $scope.addRole={};
    $scope.editRole={};
    $scope.roleId=null;
    $scope.roleprotectedData={};
    $scope.protectedObject={};
    $scope.selectedItems=[[]];
    $scope.unselectedItems=[];
    $scope.checkedItems=[[]];
    $scope.uncheckedItems=[[]];
    $scope.confirmationModal={};
    
    $scope.changePageSize = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.paginationObject.start = 0;
        $scope.paginationObject.currentPage = 1;
        $scope.paginationObject.limit = $scope.defaultrecordsperpage;
    	$scope.fetchAllRoleByCustomerId();
    	$scope.fetchAllRoleByCustomerCount();
    };
    
    $scope.fetchAllRoleByCustomerId = function(){
    	count=0;
        var response=securitytabService.fetchAllRoleByCustomerId($routeParams.customerid, $scope.paginationObject.start, $scope.paginationObject.limit);
        response.success(function(data){
            if(data.success && data.success === 1){
               	$scope.roleData=data.data;
                console.log(JSON.stringify($scope.roleData));
            }
        });
        response.error(function(response){
        	hyginexAlert("Error in loading all roles");
        });
    };
    
    $scope.fetchAllRoleByCustomerCount = function(){
        var response=securitytabService.fetchAllRoleByCustomerCount($routeParams.customerid);
        response.success(function(data){
            if(data.success && data.success === 1){
            	$scope.paginationObject.totalRecords=data.totalRecords;
                console.log(JSON.stringify(data.data));
            }
        })
    };

    $scope.load=function() {
    	$scope.fetchAllRoleByCustomerId();
    	$scope.fetchAllRoleByCustomerCount();
    };
    
    $scope.load();
    
    $scope.viewRoleModal=function(item){
    	$scope.viewRole={};
    	$scope.viewRole.roleId=item.roleId;
    	$scope.viewRole.name=item.name;
    	$scope.viewRole.createdDate=item.createdDate;
    	$scope.viewRole.createdBy=item.createdBy;
    	$scope.viewRole.updatedDate=item.updatedDate;
    	$scope.viewRole.updatedBy=item.updatedBy;
    	$("#viewrolemodal").modal('show');
    };
    
    $scope.editRoleModal=function(item){
    	$scope.editRole.roleId=item.roleId;
    	$scope.editRoleName=item.name;
    	$scope.editRole.name=item.name;
    	$("#editrolemodal").modal('show');
    };
    
    $scope.updateRole=function(){
    	$scope.editRole.name=$scope.editRoleName; 
    	var response=securitytabService.updateRoleModal($scope.editRole.roleId, $scope.editRole.name);
        response.success(function(data){
        		$("#editrolemodal").modal('hide');
            	$scope.fetchAllRoleByCustomerId();
            	hyginexAlert(data.message);
        });
        response.error(function(){        	
        		$("#editrolemodal").modal('hide');
            	hyginexAlert("Error in updation of role");
        });
    };
    
    $scope.addRoleModal=function(){
    	if(typeof $scope.roleName==="undefined" || typeof $scope.roleIsActive==="undefined"){
    		hyginexAlert("Please fill all the details");
    	}
    	else if($scope.roleName==null || $scope.roleIsActive==null){
    		hyginexAlert("Please fill all the details");
    	}
    	else{
        	$scope.addRole.name=$scope.roleName;
    		if($scope.roleIsActive==="Yes"){
        		$scope.addRole.isActive='Y';
        	}
        	if($scope.roleIsActive==="No"){
        		$scope.addRole.isActive='N';
        	}
        	var response=securitytabService.addRoleModal($scope.addRole.name, $scope.addRole.isActive, $routeParams.customerid);
            response.success(function(data){
            	$scope.fetchAllRoleByCustomerId();
            	$scope.fetchAllRoleByCustomerCount();
            	$("#addrolemodal").modal('hide');
            	console.log(data.data);
            });    		
            response.error(function(data){
            	$("#addrolemodal").modal('hide');
            	hyginexAlert('Error in creation of role');
            });    	
    	}
    	$scope.roleName=null;
    	$scope.roleIsActive=null;
    };

    $scope.deleteRoleModal=function(item){
    	
    	hyginexConfirm('Delete Role', 'Are you sure you want to delete role : '+ item.name + '?', 
    			function(){
    				var response=securitytabService.deleteRoleModal(item.roleId);
    				response.success(function(data){
    						if(data.success && data.success === 1){
    							hyginexAlert(data.message);
    							$scope.fetchAllRoleByCustomerId();
    							$scope.fetchAllRoleByCustomerCount();
    						}
    				});
    				response.error(function(){
    					hyginexAlert('Error in deletion of role.');
    				});
    	});
    };

    $scope.getProtectedObject=function(item){
    	item.id=count++;
    	$scope.checkedItems[item.id]=[];
    	$scope.uncheckedItems[item.id]=[];
    	$scope.roleId=item.roleId;
    	$scope.selectedItems[item.id]=[];
        angular.forEach(item.roleprotectedData, function (rpoitem) {
            $scope.po={'id':rpoitem.id, 'name':rpoitem.name, 'description':'', 'createdDate':'', 'createdBy':'', 'updatedDate':'', 'updatedBy':''};
            $scope.checkedItems[item.id].push($scope.po);
            item.rpoitems.push(rpoitem.name);
        });	
        item.checkedItems=$scope.checkedItems[item.id];
    };
        
    $scope.submit=function(){
    	if(grantFlag){
    			$("#protectedobjectconfirmationmodal").modal('hide');
    	    	if(allCheckedFlag===1){
        			console.log(JSON.stringify($scope.selectedItems[id]));
        			var response=securitytabService.addRoleProtectedObject($scope.RoleId, $routeParams.customerid, $scope.selectedItems[id]);
    	        	response.success(function(data){
    	        		hyginexAlert("Protected Object Granted!");
		        		$scope.fetchAllRoleByCustomerId();
    	        	});
    	        	response.error(function(){
    	        		hyginexAlert("Error in granting Protected Object");
    	        	}); 
    	        	allCheckedFlag=0;
    	    	}
    	    	else{
    	    		console.log(JSON.stringify($scope.checkedItems[id]));
    	    		var response=securitytabService.addRoleProtectedObject($scope.RoleId, $routeParams.customerid, $scope.checkedItems[id]);
    	        	response.success(function(data){
    	        		hyginexAlert("Protected Object Granted!");
    	        		$scope.checkedItems[id]=[];
		        		$scope.fetchAllRoleByCustomerId();
    	        	});
    	        	response.error(function(){
    	        		hyginexAlert("Error in granting Protected Object");
    	        	}); 
    	    	}
    	}
    	else{
				$("#protectedobjectconfirmationmodal").modal('hide');
				if(allCheckedFlag===1){
					console.log(JSON.stringify($scope.selectedItems[id]));
		        	var response=securitytabService.deleteRoleProtectedObject($scope.RoleId, $routeParams.customerid, $scope.selectedItems[id]);
		        	response.success(function(data){
		        		hyginexAlert("Protected Object Revoked!");
		        		$scope.fetchAllRoleByCustomerId();
		        	});
		        	response.error(function(){
		        		hyginexAlert("Error in revoking Protected Objects");
		        	}); 
		        	allCheckedFlag=0;
		    	}
		    	else{
		    		console.log(JSON.stringify($scope.uncheckedItems[id]));
		    		var response=securitytabService.deleteRoleProtectedObject($scope.RoleId, $routeParams.customerid, $scope.uncheckedItems[id]);
		        	response.success(function(data){
		        		hyginexAlert("Protected Object Revoked!");
		        		$scope.uncheckedItems[id]=[];
		        		$scope.fetchAllRoleByCustomerId();
		        	});
		        	response.error(function(){
		        		hyginexAlert("Error in revoking Protected Objects");
		        	}); 
		        	
		    	}
    	}
    };

    $scope.checkAll = function ($event,item) {
        var checkbox=$event.target;
        $scope.selectedItems[item.id]=[];

        if(checkbox.checked){
        	allCheckedFlag=1;
        	angular.forEach(item.protectedobjects, function (poitem) {
        		poitem.Selected = true;
        		$scope.po={'id':poitem.id, 'name':poitem.name, 'description':'', 'createdDate':'', 'createdBy':'', 'updatedDate':'', 'updatedBy':''};
        		console.log(JSON.stringify($scope.po));
        		if(true){
        			$scope.selectedItems[item.id].push($scope.po);            	   
        		}
        	});
        }
        
        else{
        	allCheckedFlag=0;
        	angular.forEach(item.protectedobjects, function(poitem){
        		var checkFlag=false;
        		angular.forEach(item.checkedItems, function(obj){
        			console.log(poitem.id+" "+obj.id+" ");
        			if(poitem.id===obj.id){
        				checkFlag=true;
        			}
        		});
        		if(checkFlag){
        			poitem.Selected=true;
        		}
        		else{
        			poitem.Selected=false;
        		}
        	});
        }
    };
       
    $scope.check=function($event, item, poitem){
    	
    	var checkbox=$event.target;
        $scope.po={'id':poitem.id, 'name':poitem.name, 'description':'', 'createdDate':'', 'createdBy':'', 'updatedDate':'', 'updatedBy':''};
        
    	if(checkbox.checked){
    		$scope.checkedItems[item.id].push($scope.po);
    		for (var i = 0; i < $scope.uncheckedItems[item.id].length; i++)
    		    if ($scope.uncheckedItems[item.id][i].id && $scope.uncheckedItems[item.id][i].id === poitem.id) { 
    		    	$scope.uncheckedItems[item.id].splice(i, 1);
    		        break;
    		    }
    	}
    	else{
    		$scope.uncheckedItems[item.id].push($scope.po);
    		for (var i = 0; i < $scope.checkedItems[item.id].length; i++)
    		    if ($scope.checkedItems[item.id][i].id && $scope.checkedItems[item.id][i].id === poitem.id) { 
    		    	$scope.checkedItems[item.id].splice(i, 1);
    		        break;
    		    }
    		for (var i = 0; i < $scope.selectedItems[item.id].length; i++)
    		    if ($scope.selectedItems[item.id][i].id && $scope.selectedItems[item.id][i].id === poitem.id) { 
    		    	$scope.selectedItems[item.id].splice(i, 1);
    		        break;
    		    }
    	}
    };
    
    $scope.grant=function(item){
    	grantFlag=1;
    	id=item.id;
    	$scope.RoleId=item.roleId;
    	if($scope.selectedItems[item.id].length==0 && $scope.checkedItems[item.id].length==0){
    		hyginexAlert("No Protected Object Item has been selected");
    	}
    	else{
    		$scope.confirmationModal.title='Grant Protected Object';
    		$scope.confirmationModal.alertMessage='Do you want to grant Protected Objects?';
    		$("#protectedobjectconfirmationmodal").modal('show');    		
    	}
    };

    $scope.revoke=function(item){
    	grantFlag=0;
    	id=item.id;
    	$scope.RoleId=item.roleId;
    	if($scope.selectedItems[item.id].length==0 && $scope.uncheckedItems[item.id].length==0){
    		$scope.uncheckedItems[item.id]=$scope.checkedItems[item.id];
    	}
        	$scope.confirmationModal.title='Grant Protected Object';
    		$scope.confirmationModal.alertMessage='Do you want to revoke Protected Objects?';
    		$("#protectedobjectconfirmationmodal").modal('show');    		
    };
    
    refreshAll=function(){
    	$scope.fetchAllRoleByCustomerId();
    }
});

hyginexApp.service('securitytabService', function($http) {
    return {
    	fetchAllRoleByCustomerId: function(customerId, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/role/customerId/'+ customerId +'/fetchallrole/'+start+'/'+limit
            });
        },
        
        fetchAllRoleByCustomerCount: function(customerId) {
            return $http({
                method: 'GET',
                url: '/app/rest/role/customerId/'+ customerId +'/fetchallrolecount/'
            });
        },

        updateRoleModal: function(roleId, name) {
            return $http({
                method: 'PUT',
                url: '/app/rest/role/update/'+roleId,
                data: {roleId : roleId, name : name},
                headers: {'Content-Type': 'application/json'}
            });
        },
        
        addRoleModal: function(name, isActive, customerId) {
            return $http({
                method: 'POST',
                url: '/app/rest/role/customerId/'+customerId,
                data: { name : name, isActive : isActive },
                headers: {'Content-Type': 'application/json'}
            });
        },

        deleteRoleModal: function(roleId) {
            return $http({
                method: 'DELETE',
                url: '/app/rest/role/'+roleId
            });
        },

        addRoleProtectedObject: function(roleId, customerId, items){
        	return $http({
                method: 'POST',
                url: '/app/rest/roleprotectedobject/add',
                data: { roleId : roleId , customerId : customerId, poDTO : items},
                headers: {'Content-Type' : 'application/json'}
            });
        },
        
        deleteRoleProtectedObject: function(roleId, customerId, items){
        	return $http({
                method: 'DELETE',
                url: '/app/rest/roleprotectedobject/delete',
                data: { roleId : roleId , customerId : customerId, poDTO : items},
                headers: {'Content-Type' : 'application/json'}
            });
        }

    };
});
