/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('layouttabController', function($scope, layouttabService, $routeParams, $timeout) {
    $scope.isDataLoaded = false;
    $scope.paginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};

    // layout related scope variables
    $scope.newlayout = {'layouttitle': 'Add Unit', 'unitid': 0, 'unitname': '', 'userid': '', 'statebehaviorid': ''};
    $scope.newroom = {'unitid': 0, 'roomtitle': 'Add Rooms', 'roomid': 0, 'roomName': '', 'noOfRooms': '', 'startNumber': ''};
    $scope.newunitfloorplan = {'uftitle': 'Add Floor Plan Mapping', 'unitFloorPlanId': 0, 'image_path': '', 'comment': ''};
    $scope.roomFormSubmitted = false;
    $scope.unitFormSubmitted = false;

    $scope.fetchAllUnitsByCustId = function(callBack) {
        layouttabService.fetchAllUnitsByCustId($routeParams.customerid, $scope.paginationObject.start, $scope.paginationObject.limit)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.unitData = data.data;
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
    $scope.fetchAllUnitCountsByCustId = function(callBack) {
        layouttabService.fetchAllUnitCountsByCustId($routeParams.customerid)
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
        $scope.fetchAllUnitsByCustId();
        $scope.fetchAllUnitCountsByCustId();
    };

    $scope.loadAll();

    $scope.fetchThroughPagination = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
        $scope.fetchAllUnitsByCustId();
    };

    $scope.openUnitModal = function() {
        layouttabService.fetchAllUsersByCustId($routeParams.customerid, 0, -1)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.userDataArray = data.data;
                        if ($scope.userDataArray !== undefined && $scope.userDataArray.length > 0) {
                            //$scope.newlayout.userid = $scope.userDataArray[0].id;
                        	 $scope.newlayout.userid=0;
                        }
                        layouttabService.fetchAllStateBehaviorsByCustId($routeParams.customerid, 0, -1)
                                .success(function(data) {
                                    if (data.success && data.success === 1) {
                                        $scope.sbDataArray = data.data;
                                        /*if ($scope.sbDataArray !== undefined && $scope.sbDataArray.length > 0) {
                                            $scope.newlayout.statebehaviorid = $scope.sbDataArray[0].stateBehaviorId;
                                        }*/                                       
                                        $scope.newlayout.statebehaviorid=0;
                                        $("#unitaddupdatemodal").modal('show');
                                    }
                                });
                    }
                });

    };

    $scope.submitUnit = function() {
    	//alert("User name"+$scope.newlayout.userid);
    	//alert("SB name"+$scope.newlayout.statebehaviorid);
        if ($scope.unitForm.$valid) {        	
            layouttabService.submitUnit($routeParams.customerid, $scope.newlayout.unitid, $scope.newlayout.unitname, $scope.newlayout.userid, $scope.newlayout.statebehaviorid)
                    .success(function(data) {
                        $scope.fetchAllUnitsByCustId(function() {
                            $scope.resetUnitVariables();
                            $scope.fetchAllUnitCountsByCustId(function() {
                                $("#unitaddupdatemodal").modal('hide');
                            });
                        });
                    }).error(function() {
                $("#unitaddupdatemodal").modal('hide');
                hyginexAlert('Error in Unit insertion/updation, try again');
            });
        } else {
            $scope.unitForm.unitFormSubmitted = true;
        }
    };

    $scope.updateUnit = function(item) {
        $scope.newlayout.layouttitle = 'Edit Unit';
        $scope.newlayout.unitid = item.unitid;
        $scope.newlayout.unitname = item.unitname;
        $scope.newlayout.statebehaviorid = item.statebehaviorid;
        $scope.newlayout.userid = item.userid;
        layouttabService.fetchAllUsersByCustId($routeParams.customerid, 0, -1)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.userDataArray = data.data;
                        layouttabService.fetchAllStateBehaviorsByCustId($routeParams.customerid, 0, -1)
                                .success(function(data) {
                                    if (data.success && data.success === 1) {
                                        $scope.sbDataArray = data.data;
                                        $("#unitaddupdatemodal").modal('show');
                                    }
                                });
                    }
                });
    };

    $scope.resetUnitVariables = function() {
        $scope.unitForm.unitFormSubmitted = false;
        $scope.newlayout = {'layouttitle': 'Add Unit', 'unitid': 0, 'unitname': '', 'userid': '', 'statebehaviorid': ''};
    };

    $scope.deleteUnit = function(item) {
        hyginexConfirm('Delete Unit',
                'Are you sure to want to delete unit : ' + item.unitname + ' ? ',
                function() {
                    layouttabService.deleteUnit(item.unitid)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllUnitsByCustId();
                                } else {
                                    hyginexAlert('Error in Unit deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in Unit deletion, try again');
                    });
                }, function() {
        });
    };

    $scope.viewUnitModal = function(item) {
        $scope.newlayout.unitid = item.unitid;
        $scope.newlayout.unitname = item.unitname;
        $scope.newlayout.userid = item.unithead;
        $scope.newlayout.statebehaviorid = item.statebehavior;
        $("#unitviewmodal").modal('show');
    };

    $scope.openRoomModal = function(unitid) {
        $scope.newroom.unitid = unitid;
        layouttabService.fetchRoomsByUnitId(unitid)
                .success(function(data) {
                    if (data.success && data.success === 1) {
                        $scope.newroom.roomid = data.data.roomId;
                        $scope.newroom.roomName = data.data.roomName;
                        $scope.newroom.noOfRooms = data.data.noOfRooms;
                        $scope.newroom.startNumber = data.data.startNumber;
                        $("#roomaddupdatemodal").modal('show');
                    }
                });
    };

    $scope.submitRooms = function() {
        if ($scope.roomForm.$valid) {
            if ($scope.newroom.roomid !== 0) {
                var updateFlag = confirm("Are you sure you want to update Rooms ?");
                if (updateFlag) {
                    $scope.confirmRoomSubmit();
                }
            } else {
                $scope.confirmRoomSubmit();
            }
        } else {
            $scope.roomForm.roomFormSubmitted = true;
        }
    };

    $scope.confirmRoomSubmit = function() {
        layouttabService.submitRooms($routeParams.customerid, $scope.newroom.unitid, $scope.newroom.roomid, $scope.newroom.roomName, $scope.newroom.noOfRooms, $scope.newroom.startNumber)
                .success(function(data) {
                    $scope.resetRoomVariables();
                    $("#roomaddupdatemodal").modal('hide');
                });
    };

    $scope.resetRoomVariables = function() {
        $scope.roomForm.roomFormSubmitted = false;
        $scope.newroom = {'unitid': 0, 'roomtitle': 'Add Rooms', 'roomid': 0, 'roomName': '', 'noOfRooms': '', 'startNumber': '', 'isUpdate': 'false'};
    };

    // ------------------------------- State Machine MODAL Functions START -----------------------------

    $scope.expandUnitFloorPlan = function(itemid) {
        $scope.selectedUnitId = itemid;
    };

    $scope.uploadedFile = function(element) {
        $scope.$apply(function($scope) {
            $scope.files = element.files;
        });
    };

    $scope.submitUnitFloorplan = function() {
        var file = '';
        if ($scope.files !== undefined) {
            file = $scope.files[0];
        }
        if (file !== '' && !file.name.match(/\.(jpg|jpeg|png|gif|bmp)$/)) {
            $scope.unitfloorplanForm.unitfloorplanFormSubmitted = true;
            $timeout(function() {
                $scope.unitfloorplanForm.image_path.$invalid = true;
            });
            $scope.refreshValidityFlags();
            $scope.unitfloorplanForm.image_path.$setValidity('type', false);
        } else if (file !== '' && file.size === 0) {
            $scope.unitfloorplanForm.unitfloorplanFormSubmitted = true;
            $timeout(function() {
                $scope.unitfloorplanForm.image_path.$invalid = true;
            });
            $scope.refreshValidityFlags();
            $scope.unitfloorplanForm.image_path.$setValidity('size', false);
        } else {
            layouttabService.uploadUnitFloorplan($scope.selectedUnitId, $scope.newunitfloorplan.unitFloorPlanId, $scope.newunitfloorplan.comment, file)
                    .success(function(data) {
                        $scope.fetchAllUnitsByCustId(function() {
                            $scope.resetUnitFloorPlanVariables();
                            $("#unitfloorplanaddupdatemodal").modal('hide');
                        });
                    }).error(function(data) {
                hyginexAlert('Error in unit floor plan insertion/updation, try again');
                $("#unitfloorplanaddupdatemodal").modal('hide');
            });
        }
    };

    $scope.refreshValidityFlags = function() {
        $scope.unitfloorplanForm.image_path.$setValidity('size', true);
        $scope.unitfloorplanForm.image_path.$setValidity('type', true);
    };

    $scope.updateUnitFloorPlan = function(item) {
        $scope.newunitfloorplan.uftitle = 'Edit Unit Floor Plan Mapping';
        $scope.newunitfloorplan.unitFloorPlanId = item.id;
        $scope.newunitfloorplan.image_path = item.imagePath;
        $scope.newunitfloorplan.comment = item.comment;
        $("#unitfloorplanaddupdatemodal").modal('show');
    };

    $scope.viewUnitFloorPlanModal = function(item) {
        $scope.newunitfloorplan.image_path = item.imagePath;
        $scope.newunitfloorplan.comment = item.comment;
        $("#viewUnitFloorPlanModal").modal('show');
    };

    $scope.deleteUnitFloorPlan = function(item) {
        hyginexConfirm('Delete Unit Floorplan',
                'Are you sure to want to delete unit floor plan : ' + item.comment + ' ? ',
                function() {
                    layouttabService.deleteUnitFloorPlan(item.id)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllUnitsByCustId();
                                } else {
                                    hyginexAlert('Error in Unit Floor Plan deletion, try again');
                                }
                                $scope.resetUnitFloorPlanVariables();
                            }).error(function() {
                        hyginexAlert('Error in Unit Floor Plan deletion, try again');
                        $scope.resetUnitFloorPlanVariables();
                    });
                }, function() {
        });
    };

    $scope.resetUnitFloorPlanVariables = function() {
        $scope.newunitfloorplan = {'uftitle': 'Add Floor Plan Mapping', 'unitFloorPlanId': 0, 'image_path': '', 'comment': ''};
    };
// ------------------------------- State Machine MODAL Functions END -----------------------------

    $scope.openImgInModal = function(path) {
        $('#imagepreview').attr('src', path); // here asign the image to the modal when the user click the enlarge link
        $('#imagemodal').modal('show');
    };



});

hyginexApp.service('layouttabService', function($http) {
    return {
        fetchAllUnitsByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/unit/customerid/' + customerid + '/fetchunits/' + start + '/' + limit
            });
        },
        fetchAllUnitCountsByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/unit/customerid/' + customerid + '/fetchallcount'
            });
        },
        fetchAllUsersByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/user/customerid/' + customerid + '/fetchuser/' + start + '/' + limit
            });
        },
        fetchAllStateBehaviorsByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/statebehavior/customerid/' + customerid + '/fetchstatebehavior/' + start + '/' + limit
            });
        },
        submitUnit: function(customerid, unitid, unitname, userid, statebehaviorid) {
            return $http({
                method: 'POST',
                url: '/app/rest/unit/customerid/' + customerid + '/addupdateunit',
                data: {unitid: unitid, unitname: unitname, userid: userid, statebehaviorid: statebehaviorid},
                headers: {'Content-Type': 'application/json'}
            });
        },
        fetchRoomsByUnitId: function(unitid) {
            return $http({
                method: 'GET',
                url: '/app/rest/room/unitid/' + unitid + '/fetchallrooms/'
            });
        },
        submitRooms: function(customerid, unitid, roomId, roomName, noOfRooms, startNumber) {
            return $http({
                method: 'POST',
                url: '/app/rest/room/customerid/' + customerid + '/unitid/' + unitid + '/addupdateroom',
                data: {roomId: roomId, roomName: roomName, noOfRooms: noOfRooms, startNumber: startNumber},
                headers: {'Content-Type': 'application/json'}
            });
        },
        uploadUnitFloorplan: function(unitId, unitFloorPlanId, comment, file) {
            var fd = new FormData();
            fd.append("file", file);
            fd.append("unitFloorPlanId", unitFloorPlanId);
            fd.append("unitId", unitId);
            fd.append("comment", comment);
            return $http({
                method: 'POST',
                withCredentials: false,
                url: '/app/rest/unitFloorplan/createunitfloorplan',
                data: fd,
                headers: {'Content-Type': undefined},
                transformRequest: angular.identity
            });
        },
        deleteUnitFloorPlan: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/unitFloorplan/unitfloorplanid/' + id + '/deleteunitfloorplan',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteUnit: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/unit/unitid/' + id + '/deleteunit',
                headers: {'Content-Type': 'application/json'}
            });
        }
    };
});
