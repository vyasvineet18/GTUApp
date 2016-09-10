/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp.controller('policytabController', function($scope, policytabService, $routeParams, $timeout) {
    $scope.title = "Hospital";
    $scope.isDataLoaded = false;
    $scope.statepaginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};
    $scope.handwashpaginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};
    $scope.locationrulepaginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};
    $scope.statemachinepaginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};
    $scope.statebehaviorpaginationObject = {'start': 0, 'limit': 5, 'currentPage': 1, 'totalRecords': 0};

    $scope.stateFormSubmitted = false;
    // state related scope variables
    $scope.newstate = {'statetitle': 'Add State', 'statecompliance': '', 'stateid': 0, 'statename': '', 'statenumber': ''};

    // handwash related scope variables
    $scope.newhandwash = {'handwashtitle': 'Add Hand Washes', 'handwashmedia': '', 'handwashid': 0, 'handwashname': '', 'handwashnumber': '', 'rubduration': ''};

    // location rule related scope variables
    $scope.newlocationrule = {'locationruletitle': 'Add Location Rule', 'locationruleid': 0, 'locationrulename': '', 'locationrulenumber': '', 'entrywindowtime': '', 'exitwindowtime': '', 'entryHandWashTypeId': '', 'exitHandWashTypeId': ''};

    // state machine related scope variables
    $scope.newsm = {'smtitle': 'Add State Machine', 'stateMachineid': 0, 'stateMachineName': '', 'filepath': ''};

    // state behavior related scope variables
    $scope.newsb = {'sbtitle': 'Add State Behavior', 'stateBehaviorId': 0, 'name': '', 'memorySlotNoLookupId': ''};
    $scope.newsmrolemapping = {'smroletitle': 'Add Role State Mapping', 'stateBehaviorId': '', 'roleStateMachineId': 0, 'roleId': '', 'stateMachineId': ''};

    $scope.customerid = $routeParams.customerid;

    $scope.fetchData = function() {
        policytabService.fetchAllStatesByCustId($scope.customerid, $scope.statepaginationObject.start, $scope.statepaginationObject.limit)                     // fetch All states
                .success(function(data) {
                    $scope.stateData = data.data;
                    policytabService.fetchAllHandwashByCustId($scope.customerid, $scope.handwashpaginationObject.start, $scope.handwashpaginationObject.limit)       // fetch All Handwashes
                            .success(function(data) {
                                $scope.handwashData = data.data;
                                policytabService.fetchAllStateMachinesByCustId($scope.customerid, $scope.statemachinepaginationObject.start, $scope.statemachinepaginationObject.limit)
                                        .success(function(data) {
                                            $scope.statemachineData = data.data;
                                            policytabService.fetchAllLocationRulesByCustId($scope.customerid, $scope.locationrulepaginationObject.start, $scope.locationrulepaginationObject.limit)
                                                    .success(function(data) {
                                                        $scope.locationruleData = data.data;
                                                        policytabService.fetchAllStateBehaviorsByCustId($scope.customerid, $scope.statebehaviorpaginationObject.start, $scope.statebehaviorpaginationObject.limit)
                                                                .success(function(data) {
                                                                    $scope.statebehaviorData = data.data;
                                                                });
                                                    });
                                        });
                            });
                });
    };

    $scope.fetchAllStatesByCustId = function(callBack) {
        policytabService.fetchAllStatesByCustId($scope.customerid, $scope.statepaginationObject.start, $scope.statepaginationObject.limit)                     // fetch All states
                .success(function(data) {
                    $scope.stateData = data.data;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
    };

    $scope.fetchAllHandwashByCustId = function(callBack) {
        policytabService.fetchAllHandwashByCustId($scope.customerid, $scope.handwashpaginationObject.start, $scope.handwashpaginationObject.limit)       // fetch All Handwashes
                .success(function(data) {
                    $scope.handwashData = data.data;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
        ;
    };

    $scope.fetchAllStateMachinesByCustId = function(callBack) {
        policytabService.fetchAllStateMachinesByCustId($scope.customerid, $scope.statemachinepaginationObject.start, $scope.statemachinepaginationObject.limit)
                .success(function(data) {
                    $scope.statemachineData = data.data;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
        ;
    };

    $scope.fetchAllLocationRulesByCustId = function(callBack) {
        policytabService.fetchAllLocationRulesByCustId($scope.customerid, $scope.locationrulepaginationObject.start, $scope.locationrulepaginationObject.limit)
                .success(function(data) {
                    $scope.locationruleData = data.data;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
    };

    $scope.fetchAllStateBehaviorsByCustId = function(callBack) {
        policytabService.fetchAllStateBehaviorsByCustId($scope.customerid, $scope.statebehaviorpaginationObject.start, $scope.statebehaviorpaginationObject.limit)
                .success(function(data) {
                    $scope.statebehaviorData = data.data;
                    if (callBack) {
                        callBack();
                    }
                }).error(function() {
            if (callBack) {
                callBack();
            }
        });
    };

    $scope.fetchAllPoliciesCountByCustId = function(callBack) {
        policytabService.fetchAllPoliciesCountByCustId($scope.customerid)
                .success(function(data) {
                    $scope.statepaginationObject.totalRecords = data.data.totalStateRecords;
                    $scope.handwashpaginationObject.totalRecords = data.data.totalHandWashRecords;
                    $scope.locationrulepaginationObject.totalRecords = data.data.totalLocationRuleRecords;
                    $scope.statemachinepaginationObject.totalRecords = data.data.totalStateMachineRecords;
                    $scope.statebehaviorpaginationObject.totalRecords = data.data.totalStateBehaviorRecords;
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
        $scope.prepareLookupArray();
        $scope.fetchData();
        $scope.fetchAllPoliciesCountByCustId();
    };

    $scope.prepareLookupArray = function() {
        $scope.statecomplianceArray = getLookUpItemsFromLookupName('STATE LOOKUP');
        $scope.newstate.statecompliance = $scope.statecomplianceArray[0].id;
        $scope.handwashMediaArray = getLookUpItemsFromLookupName('MEDIA');
        $scope.newhandwash.handwashmedia = $scope.handwashMediaArray[0].id;
        $scope.memoryslotArray = getLookUpItemsFromLookupName('MEMORYSLOT');
        $scope.newsb.memorySlotNoLookupId = $scope.memoryslotArray[0].id;
    };

    $scope.loadAll();

    $scope.fetchStatesThroughPagination = function() {
        $scope.resetDataLoadedFlag();
        $scope.fetchAllStatesByCustId();
    };

    $scope.fetchHandwashThroughPagination = function() {
        $scope.resetDataLoadedFlag();
        $scope.fetchAllHandwashByCustId();
    };
    $scope.fetchLocationRuleThroughPagination = function() {
        $scope.resetDataLoadedFlag();
        $scope.fetchAllLocationRulesByCustId();
    };
    $scope.fetchStateMachineThroughPagination = function() {
        $scope.resetDataLoadedFlag();
        $scope.fetchAllStateMachinesByCustId();
    };
    $scope.fetchStateBehaviorThroughPagination = function() {
        $scope.resetDataLoadedFlag();
        $scope.fetchAllStateBehaviorsByCustId();
    };

    $scope.resetDataLoadedFlag = function() {
        $scope.isDataLoaded = false;
        $scope.isDataLoaded = true;
    };

    // ------------------------------- State MODAL Functions START -----------------------------

    $scope.submitState = function() {
        if ($scope.stateForm.$valid) {
            policytabService.submitState($scope.customerid, $scope.newstate.stateid, $scope.newstate.statename, $scope.newstate.statenumber, $scope.newstate.statecompliance)
                    .success(function(data) {
                        $scope.fetchAllStatesByCustId(function() {
                            $scope.resetStateVariables();
                            $scope.fetchAllPoliciesCountByCustId(function() {
                                $("#stateaddupdatemodal").modal('hide');
                            });
                        });
                    }).error(function() {
                $("#stateaddupdatemodal").modal('hide');
                hyginexAlert('Error in state insertion/updation, try again');
            });
        } else {
            $scope.stateForm.stateFormSubmitted = true;
        }
    };

    $scope.updateState = function(item) {
        $scope.newstate.statetitle = 'Edit State';
        $scope.newstate.stateid = item.id;
        $scope.newstate.statename = item.name;
        $scope.newstate.statenumber = item.stateNumber;
        $scope.newstate.statecompliance = item.lookupStateId;
    };

    $scope.resetStateVariables = function() {
        $scope.stateForm.stateFormSubmitted = false;
        $scope.newstate = {'statetitle': 'Add State', 'statecompliance': '', 'stateid': 0, 'statename': '', 'statenumber': ''};
        $scope.newstate.statecompliance = $scope.statecomplianceArray[0].id;
    };

    $scope.viewStateModal = function(item) {
        $scope.newstate.stateid = item.id;
        $scope.newstate.statename = item.name;
        $scope.newstate.statenumber = item.stateNumber;
        $scope.newstate.statecompliance = item.lookupStateName;
        $("#stateviewmodal").modal('show');
    };

    $scope.deleteState = function(item) {
        hyginexConfirm('Delete State',
                'Are you sure to want to delete state : ' + item.name + ' ? ',
                function() {
                    policytabService.deleteState(item.id)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllStatesByCustId();
                                } else {
                                    hyginexAlert('Error in state deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in state deletion, try again');
                    });
                }, function() {
        });
    };


    // ------------------------------- State MODAL Functions END -----------------------------

    // ------------------------------- Handwash MODAL Functions START -----------------------------

    $scope.submitHandwash = function() {
        if ($scope.handwashForm.$valid) {
            policytabService.submitHandwash($scope.customerid, $scope.newhandwash.handwashid, $scope.newhandwash.handwashname, $scope.newhandwash.handwashnumber, $scope.newhandwash.handwashmedia, $scope.newhandwash.rubduration)
                    .success(function(data) {
                        $scope.fetchAllHandwashByCustId(function() {
                            $scope.resetHandwashVariables();
                            $scope.fetchAllPoliciesCountByCustId(function() {
                                $("#handwashaddupdatemodal").modal('hide');
                            });
                        });
                    }).error(function() {
                $("#handwashaddupdatemodal").modal('hide');
                hyginexAlert('Error in handwash insertion/updation, try again');
            });
        } else {
            $scope.handwashForm.handwashFormSubmitted = true;
        }
    };

    $scope.updateHandwash = function(item) {
        $scope.newhandwash.handwashtitle = 'Edit HandWash';
        $scope.newhandwash.handwashid = item.handWashId;
        $scope.newhandwash.handwashname = item.handWashName;
        $scope.newhandwash.handwashnumber = item.handWashNumber;
        $scope.newhandwash.rubduration = item.rubTime;
        $scope.newhandwash.handwashmedia = item.mediaLookupId;
    };

    $scope.viewHandwashModal = function(item) {
        $scope.newhandwash.handwashname = item.handWashName;
        $scope.newhandwash.handwashnumber = item.handWashNumber;
        $scope.newhandwash.rubduration = item.rubTime;
        $scope.newhandwash.handwashmedia = item.mediaName;
        $("#handwashviewmodal").modal('show');
    };


    $scope.resetHandwashVariables = function() {
        $scope.handwashForm.handwashFormSubmitted = false;
        $scope.newhandwash = {'handwashtitle': 'Add Hand Washes', 'handwashmedia': '', 'handwashid': 0, 'handwashname': '', 'handwashnumber': '', 'rubduration': ''};
        $scope.newhandwash.handwashmedia = $scope.handwashMediaArray[0].id;
    };

    $scope.deleteHandwash = function(item) {
        hyginexConfirm('Delete Handwash',
                'Are you sure to want to delete handwash : ' + item.handWashName + ' ? ',
                function() {
                    policytabService.deleteHandwash(item.handWashId)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllHandwashByCustId();
                                } else {
                                    hyginexAlert('Error in handwash deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in handwash deletion, try again');
                    });
                }, function() {
        });
    };
    // ------------------------------- Handwash MODAL Functions END -----------------------------

    // ------------------------------- Location Rule MODAL Functions START -----------------------------

    $scope.openLocationRuleModal = function() {
        $("#locationruleaddupdatemodal").modal('show');
        $scope.newlocationrule.entryHandWashTypeId = $scope.handwashData[0].handWashId;
        $scope.newlocationrule.exitHandWashTypeId = $scope.handwashData[0].handWashId;
    };

    $scope.submitLocationRule = function() {
        if ($scope.locationruleForm.$valid) {
            policytabService.submitLocationRule($scope.customerid, $scope.newlocationrule.locationruleid, $scope.newlocationrule.locationrulename, $scope.newlocationrule.locationrulenumber, $scope.newlocationrule.entryHandWashTypeId, $scope.newlocationrule.entrywindowtime, $scope.newlocationrule.exitHandWashTypeId, $scope.newlocationrule.exitwindowtime)
                    .success(function(data) {
                        $scope.fetchAllLocationRulesByCustId(function() {
                            $scope.resetLocationRuleVariables();
                            $scope.fetchAllPoliciesCountByCustId(function() {
                                $("#locationruleaddupdatemodal").modal('hide');
                            });
                        });
                    }).error(function() {
                $("#locationruleaddupdatemodal").modal('hide');
                hyginexAlert('Error in locationrule insertion/updation, try again');
            });
        } else {
            $scope.locationruleForm.locationruleFormSubmitted = true;
        }
    };

    $scope.updateLocationRule = function(item) {
        $scope.newlocationrule.locationruletitle = 'Edit Location Rule';
        $scope.newlocationrule.locationruleid = item.locationRuleId;
        $scope.newlocationrule.locationrulename = item.locationRuleName;
        $scope.newlocationrule.locationrulenumber = item.locationRuleNumber;
        $scope.newlocationrule.entrywindowtime = item.entryWindowTime;
        $scope.newlocationrule.exitwindowtime = item.exitWindowTime;
        $scope.newlocationrule.entryHandWashTypeId = item.entryHandWashTypeId;
        $scope.newlocationrule.exitHandWashTypeId = item.exitHandWashTypeId;
        $("#locationruleaddupdatemodal").modal('show');
    };

    $scope.viewLocationRuleModal = function(item) {
        $scope.newlocationrule.locationrulename = item.locationRuleName;
        $scope.newlocationrule.locationrulenumber = item.locationRuleNumber;
        $scope.newlocationrule.entryHandWashTypeId = item.entryHandWashTypeName;
        $scope.newlocationrule.entrywindowtime = item.entryWindowTime;
        $scope.newlocationrule.exitHandWashTypeId = item.exitHandWashTypeName;
        $scope.newlocationrule.exitwindowtime = item.exitWindowTime;
        $("#locationruleviewmodal").modal('show');
    };

    $scope.resetLocationRuleVariables = function() {
        $scope.locationruleForm.locationruleFormSubmitted = false;
        $scope.newlocationrule = {'locationruletitle': 'Add Location Rule', 'locationruleid': 0, 'locationrulename': '', 'locationrulenumber': '', 'entrywindowtime': '', 'exitwindowtime': '', 'entryHandWashTypeId': '', 'exitHandWashTypeId': ''};
        $scope.newlocationrule.entryHandWashTypeId = $scope.handwashData[0].handWashId;
        $scope.newlocationrule.exitHandWashTypeId = $scope.handwashData[0].handWashId;
    };

    $scope.deleteLocationRule = function(item) {
        hyginexConfirm('Delete LocationRule',
                'Are you sure to want to delete location rule : ' + item.locationRuleName + ' ? ',
                function() {
                    policytabService.deleteLocationRule(item.locationRuleId)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllLocationRulesByCustId();
                                } else {
                                    hyginexAlert('Error in Location Rule deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in Location Rule deletion, try again');
                    });
                }, function() {
        });
    };
    // ------------------------------- Location Rule MODAL Functions END -----------------------------

    // ------------------------------- State Behavior MODAL Functions START -----------------------------
    $scope.openStateBehaviorModal = function() {
        $("#statebehavioraddupdatemodal").modal('show');
    };


    $scope.submitStateBehavior = function() {
        if ($scope.sbForm.$valid) {
            policytabService.submitStatebehavior($scope.customerid, $scope.newsb.stateBehaviorId, $scope.newsb.name, $scope.newsb.memorySlotNoLookupId)
                    .success(function(data) {
                        $scope.fetchAllStateBehaviorsByCustId(function() {
                            $scope.resetStateBehaviorVariables();
                            $scope.fetchAllPoliciesCountByCustId(function() {
                                $("#statebehavioraddupdatemodal").modal('hide');
                            });
                        });
                    }).error(function() {
                $("#statebehavioraddupdatemodal").modal('hide');
                hyginexAlert('Error in state behavior insertion/updation, try again');
            });
        } else {
            $scope.sbForm.sbFormSubmitted = true;
        }
    };

    $scope.updateStateBehavior = function(item) {
        $scope.newsb.sbtitle = 'Edit State Behavior';
        $scope.newsb.name = item.name;
        $scope.newsb.stateBehaviorId = item.stateBehaviorId;
        $scope.newsb.memorySlotNoLookupId = item.memorySlotNoLookupId;
        $("#statebehavioraddupdatemodal").modal('show');
    };

    $scope.viewStateBehaviorModal = function(item) {
        $scope.newsb.name = item.name;
        $scope.newsb.memorySlotNoLookupId = item.memorySlotNo;
        $("#statebehaviorviewmodal").modal('show');
    };

    $scope.resetStateBehaviorVariables = function() {
        $scope.sbForm.sbFormSubmitted = false;
        $scope.newsb = {'sbtitle': 'Add State Behavior', 'stateBehaviorId': 0, 'name': '', 'memorySlotNoLookupId': ''};
    };

    $scope.deleteStateBehavior = function(item) {
        hyginexConfirm('Delete State Behavior',
                'Are you sure to want to delete state behavior: ' + item.name + ' ? ',
                function() {
                    policytabService.deleteStateBehavior(item.stateBehaviorId)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllStateBehaviorsByCustId();
                                } else {
                                    hyginexAlert('Error in State Behavior deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in State Behavior deletion, try again');
                    });
                }, function() {
        });
    };

    $scope.openSMRoleModal = function() {
        policytabService.fetchAllRolesByCustId($scope.customerid)
                .success(function(data) {
                    $scope.roleArray = data.data;
                    if ($scope.roleArray !== undefined && $scope.roleArray.length > 0) {
                        $scope.newsmrolemapping.roleId = $scope.roleArray[0].roleId;
                    }

                    policytabService.fetchAllStateMachinesByCustId($scope.customerid, 0, -1)
                            .success(function(data) {
                                $scope.stateMachineArray = data.data;
                                if ($scope.stateMachineArray !== undefined && $scope.stateMachineArray.length > 0) {
                                    $scope.newsmrolemapping.stateMachineId = $scope.stateMachineArray[0].id;
                                }
                                $scope.newsmrolemapping.stateBehaviorId =
                                        $("#rolestatemapaddupdatemodal").modal('show');
                            });
                });
    };

    $scope.selectStateBehavior = function(id) {
        $scope.selectedStateBehaviorId = id;
    };

    $scope.updateSMRoleMapping = function(item) {
        $scope.newsmrolemapping.smroletitle = 'Edit Role State Mapping';
        $scope.newsmrolemapping.stateBehaviorId = item.stateBehaviorId;
        $scope.newsmrolemapping.roleStateMachineId = item.roleStateMachineId;

        policytabService.fetchAllRolesByCustId($scope.customerid)
                .success(function(data) {
                    $scope.roleArray = data.data;
                    $scope.newsmrolemapping.roleId = item.roleId;
                    policytabService.fetchAllStateMachinesByCustId($scope.customerid, 0, -1)
                            .success(function(data) {
                                $scope.stateMachineArray = data.data;
                                $scope.newsmrolemapping.stateMachineId = item.stateMachineId;
                                $("#rolestatemapaddupdatemodal").modal('show');
                            });
                });
    };

    $scope.viewRoleStateMachineModal = function(item) {
        $scope.newsmrolemapping.stateBehaviorId = item.stateMachineName;
        $scope.newsmrolemapping.roleId = item.roleName;
        $("#rolestatemachineviewmodal").modal('show');
    };

    $scope.resetSMRoleVariables = function() {
        $scope.newsmrolemapping = {'smroletitle': 'Add Role State Mapping', 'stateBehaviorId': '', 'roleStateMachineId': 0, 'roleId': '', 'stateMachineId': ''};

    };

    $scope.submitSMRoleMapping = function() {
        policytabService.submitSMRoleMapping($scope.customerid, $scope.selectedStateBehaviorId, $scope.newsmrolemapping.roleStateMachineId, $scope.newsmrolemapping.roleId, $scope.newsmrolemapping.stateMachineId)
                .success(function(data) {

                    $scope.fetchAllStateBehaviorsByCustId(function() {
                        $scope.resetSMRoleVariables();
                        $scope.fetchAllPoliciesCountByCustId(function() {
                            $("#rolestatemapaddupdatemodal").modal('hide');
                        });
                    });
                }).error(function() {
            $("#rolestatemapaddupdatemodal").modal('hide');
            hyginexAlert('Error in State Machine Role Mapping insertion/updation, try again');
        });
        ;
    };

    $scope.deleteSMRoleMapping = function(item) {
        hyginexConfirm('Delete State Machine Role Mapping',
                'Are you sure to want to delete State Machine role mapping ? ',
                function() {
                    policytabService.deleteSMRoleMapping(item.roleStateMachineId)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllStateBehaviorsByCustId();
                                } else {
                                    hyginexAlert('Error in State Machine Role Mapping deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in State Machine Role Mapping deletion, try again');
                    });
                }, function() {
        });
    };


// ------------------------------- State Machine MODAL Functions START -----------------------------

    $scope.uploadedFile = function(element) {
        $scope.$apply(function($scope) {
            $scope.files = element.files;
        });
    };

    $scope.submitStateMachine = function() {
        var file = '';
        if ($scope.files !== undefined) {
            file = $scope.files[0];
        }
        if (file !== '') {
            if (file.type !== 'text/plain') {
                $scope.statemachineform.statemachineFormSubmitted = true;
                $timeout(function() {
                    $scope.statemachineform.filepath.$invalid = true;
                });
                $scope.refreshValidityFlags();
                $scope.statemachineform.filepath.$setValidity('type', false);
            } else if (file.size === 0) {
                $scope.statemachineform.statemachineFormSubmitted = true;
                $timeout(function() {
                    $scope.statemachineform.filepath.$invalid = true;
                });
                $scope.refreshValidityFlags();
                $scope.statemachineform.filepath.$setValidity('size', false);
            } else {
                policytabService.uploadStateMachine($scope.customerid, $scope.newsm.stateMachineid, $scope.newsm.stateMachineName, file)
                        .success(function(data) {

                            $scope.fetchAllStateMachinesByCustId(function() {
                                $scope.resetStatemachineVariables();
                                $scope.fetchAllPoliciesCountByCustId(function() {
                                    $("#statemachineaddupdatemodal").modal('hide');
                                });
                            });
                        }).error(function() {
                    $("#statemachineaddupdatemodal").modal('hide');
                    hyginexAlert('Error in State Machine insertion/updation, try again');
                });
            }
        } else {
            $scope.statemachineform.statemachineFormSubmitted = true;
            $timeout(function() {
                $scope.statemachineform.filepath.$invalid = true;
            });
            $scope.refreshValidityFlags();
            $scope.statemachineform.filepath.$setValidity('required', false);
        }
    };

    $scope.refreshValidityFlags = function() {
        $scope.statemachineform.filepath.$setValidity('required', true);
        $scope.statemachineform.filepath.$setValidity('size', true);
        $scope.statemachineform.filepath.$setValidity('type', true);
    };

    $scope.updateStateMachine = function(item) {
        $scope.newsm.smtitle = 'Edit State Machine';
        $scope.newsm.stateMachineid = item.id;
        $scope.newsm.stateMachineName = item.name;
        $scope.newsm.filepath = item.filePath;
        $("#statemachineaddupdatemodal").modal('show');
    };

    $scope.viewStateMachineModal = function(item) {
        $scope.newsm.smtitle = 'View State Machine';
        $scope.newsm.stateMachineid = item.id;
        $scope.newsm.stateMachineName = item.name;
        $scope.newsm.filepath = item.filePath;
        $("#statemachineviewmodal").modal('show');
    };

    $scope.resetStatemachineVariables = function() {
        $scope.newsm = {'smtitle': 'Add State Machine', 'stateMachineid': 0, 'stateMachineName': '', 'filepath': ''};
    };

    $scope.deleteStateMachine = function(item) {
        hyginexConfirm('Delete State Machine',
                'Are you sure to want to delete State Machine: ' + item.name + ' ? ',
                function() {
                    policytabService.deleteStateMachine(item.id)
                            .success(function(data) {
                                if (data.success && data.success === 1) {
                                    $scope.fetchAllStateMachinesByCustId();
                                } else {
                                    hyginexAlert('Error in State Machine deletion, try again');
                                }
                            }).error(function() {
                        hyginexAlert('Error in State Machine deletion, try again');
                    });
                }, function() {
        });
    };
// ------------------------------- State Machine MODAL Functions END -----------------------------

});

hyginexApp.directive('handwashnumUnique', ['policytabService', function(policytabService) {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function(scope, element, attrs, ngModel) {
                element.bind('blur', function(e) {
                    if (!ngModel || !element.val())
                        return;
                    var currentValue = element.val();
                    var keyProperty = scope.$eval(attrs.handwashnumUnique);
                    policytabService.checkHandwashNumUniqueValue(keyProperty.customerid, currentValue)
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

hyginexApp.directive('statenumUnique', ['policytabService', function(policytabService) {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function(scope, element, attrs, ngModel) {
                element.bind('blur', function(e) {
                    if (!ngModel || !element.val())
                        return;
                    var currentValue = element.val();
                    var keyProperty = scope.$eval(attrs.statenumUnique);
                    policytabService.checkStateUniqueValue(keyProperty.customerid, currentValue)
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

hyginexApp.directive('locationrulenumUnique', ['policytabService', function(policytabService) {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function(scope, element, attrs, ngModel) {
                element.bind('blur', function(e) {
                    if (!ngModel || !element.val())
                        return;
                    var currentValue = element.val();
                    var keyProperty = scope.$eval(attrs.locationrulenumUnique);
                    policytabService.checkLocationRuleUniqueValue(keyProperty.customerid, currentValue)
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

hyginexApp.service('policytabService', function($http) {
    return {
        fetchAllStatesByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/state/customerid/' + customerid + '/fetchstate/' + start + '/' + limit
            });
        },
        fetchAllHandwashByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/handwash/customerid/' + customerid + '/fetchhandwash/' + start + '/' + limit
            });
        },
        fetchAllStateMachinesByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/stateMachine/customerid/' + customerid + '/fetchstatemachine/' + start + '/' + limit
            });
        },
        fetchAllLocationRulesByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/locationrule/customerid/' + customerid + '/fetchlocationrule/' + start + '/' + limit
            });
        },
        fetchAllStateBehaviorsByCustId: function(customerid, start, limit) {
            return $http({
                method: 'GET',
                url: '/app/rest/statebehavior/customerid/' + customerid + '/fetchstatebehavior/' + start + '/' + limit
            });
        },
        fetchAllPoliciesCountByCustId: function(customerid) {
            return $http({
                method: 'GET',
                url: '/app/rest/policies/customerid/' + customerid + '/fetchallpoliciescount'
            });
        },
        submitState: function(customerid, stateid, statename, statenumber, lookupStateId) {
            return $http({
                method: 'POST',
                url: '/app/rest/state/customerid/' + customerid + '/addUpdateState',
                data: {id: stateid, name: statename, stateNumber: statenumber, lookupStateId: lookupStateId},
                headers: {'Content-Type': 'application/json'}
            });
        },
        submitHandwash: function(customerid, hid, hname, hnumber, mediaLookupId, rubTime) {
            return $http({
                method: 'POST',
                url: '/app/rest/handwash/customerid/' + customerid + '/addUpdateHandWash',
                data: {handWashId: hid, handWashName: hname, handWashNumber: hnumber, mediaLookupId: mediaLookupId, rubTime: rubTime},
                headers: {'Content-Type': 'application/json'}
            });
        },
        submitLocationRule: function(customerid, lid, lname, lnumber, entryhwId, entryWindowTime, exithwId, exitWindowTime) {
            return $http({
                method: 'POST',
                url: '/app/rest/locationrule/customerid/' + customerid + '/addupdatelocationrule',
                data: {locationRuleId: lid, locationRuleName: lname, locationRuleNumber: lnumber, entryHandWashTypeId: entryhwId, entryWindowTime: entryWindowTime, exitHandWashTypeId: exithwId, exitWindowTime: exitWindowTime},
                headers: {'Content-Type': 'application/json'}
            });
        },
        submitStatebehavior: function(customerid, sid, sname, sMemorySlotLookupId) {
            return $http({
                method: 'POST',
                url: '/app/rest/statebehavior/customerid/' + customerid + '/addupdatestatebehavior',
                data: {stateBehaviorId: sid, name: sname, memorySlotNoLookupId: sMemorySlotLookupId},
                headers: {'Content-Type': 'application/json'}
            });
        },
        uploadStateMachine: function(customerid, stateMachineId, name, file) {
            var fd = new FormData();
            fd.append("file", file);
            fd.append("name", name);
            fd.append("customerid", customerid);
            fd.append("stateMachineId", stateMachineId);
            return $http({
                method: 'POST',
                withCredentials: false,
                url: '/app/rest/stateMachine/createstatemachine',
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
        submitSMRoleMapping: function(customerid, stateBehaviorId, roleStateMachineId, roleId, stateMachineId) {
            return $http({
                method: 'POST',
                url: '/app/rest/statebehavior/customerid/' + customerid + '/statebehaviorid/' + stateBehaviorId + '/addupdaterolesmmapping',
                data: {roleStateMachineId: roleStateMachineId, roleId: roleId, stateMachineId: stateMachineId},
                headers: {'Content-Type': 'application/json'}
            });
        },
        checkHandwashNumUniqueValue: function(customerid, handwashnumber) {
            return $http({
                method: 'GET',
                url: '/app/rest/handwash/customerid/' + customerid + '/checkhandwashnumber/' + handwashnumber
            });
        },
        checkStateUniqueValue: function(customerid, statenumber) {
            return $http({
                method: 'GET',
                url: '/app/rest/state/customerid/' + customerid + '/checkstatenumber/' + statenumber
            });
        },
        checkLocationRuleUniqueValue: function(customerid, locationrulenumber) {
            return $http({
                method: 'GET',
                url: '/app/rest/locationrule/customerid/' + customerid + '/checklocationrulenumber/' + locationrulenumber
            });
        },
        deleteState: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/state/stateid/' + id + '/deletestate',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteHandwash: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/handwash/handwashid/' + id + '/deletehandwash',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteLocationRule: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/locationrule/locationruleid/' + id + '/deletelocationrule',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteStateMachine: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/stateMachine/statemachineid/' + id + '/deletestatemachine',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteStateBehavior: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/statebehavior/statebehaviorid/' + id + '/deletestatebehavior',
                headers: {'Content-Type': 'application/json'}
            });
        },
        deleteSMRoleMapping: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/rolestatemachinemap/rolestatemachinemapid/' + id + '/deleterolesmmapping',
                headers: {'Content-Type': 'application/json'}
            });
        }
    };
});
