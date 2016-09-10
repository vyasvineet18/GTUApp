<body class="skin-blue" ng-controller="policytabController">
    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="policies"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="policies" class="tab-pane active">
                                    <div class="boxuserupdate">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">States &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" data-target="#stateaddupdatemodal" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i> </a> </h3>
                                            </div>
                                            <div> </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table id="example1" class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Number</th>
                                                            <th>Compliance</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in stateData">
                                                            <td style="width:33%;" ng-bind="item.name"></td>
                                                            <td ng-bind="item.stateNumber"></td>
                                                            <td ng-bind="item.lookupStateName"></td>
                                                            <td class="text-right">
                                                                <span data-toggle="modal" ng-click="viewStateModal(item)"> 
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="View" class="btn btn-primary btn-xs" href="javascript:void(0);" >
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span>
                                                                <a ng-hide="item.isActive === 'N'" ng-click="updateState(item)" data-target="#stateaddupdatemodal" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs" >
                                                                    <i class="fa fa-edit"></i>
                                                                </a> 
                                                                <span ng-hide="item.isActive === 'N'" ng-click="deleteState(item)" data-target="#Deletenotice" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="Delete" class="btn btn-danger btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-trash"></i>
                                                                    </a>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div id="example1_info" class="dataTables_info">Showing {{statepaginationObject.totalRecords == 0 ? 0 : statepaginationObject.start+1}} to                                  
                                {{statepaginationObject.totalRecords < statepaginationObject.start+statepaginationObject.limit ? statepaginationObject.totalRecords : statepaginationObject.start+statepaginationObject.limit}} 
                                of {{statepaginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchStatesThroughPagination()" pagination-object="statepaginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- pop up --> 
                                            <!-- Button trigger modal --> 
                                            <!-- Modal Add States -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="stateaddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="statetitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">States</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="stateForm" novalidate>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Name" id="newstate.statename" class="form-control" ng-model="newstate.statename" name="statename" required>
                                                                                <span style="color:red" ng-show="stateForm.statename.$invalid && stateForm.stateFormSubmitted">
                                                                                    <span ng-show="stateForm.statename.$error.required">State Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" placeholder="Number" id="newstate.statenumber" class="form-control" ng-model="newstate.statenumber" name="statenumber" required statenum-unique="{customerid: customerid}">
                                                                                <span style="color:red" ng-show="stateForm.statenumber.$invalid && stateForm.stateFormSubmitted">
                                                                                    <span ng-show="stateForm.statenumber.$error.required">StateNumber is required.</span>
                                                                                    <span ng-show="stateForm.statenumber.$error.number">Not Valid Number!</span>
                                                                                    <span ng-show="stateForm.statenumber.$error.unique">State number already in Use, try with different.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputPassword3" class="col-sm-3 control-label">Compliance</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newstate.statecompliance" name="statecompliance" required>
                                                                                    <option ng-repeat="statecomplianceitem in statecomplianceArray" value="{{statecomplianceitem.id}}">{{statecomplianceitem.name}}</option>
                                                                                </select>
                                                                                <span style="color:red" ng-show="stateForm.statecompliance.$invalid && stateForm.stateFormSubmitted">
                                                                                    <span ng-show="stateForm.statecompliance.$error.required">State Compliance is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitState()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStateVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal Add States end --> 

                                            <!-- Model view States Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="stateviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View States</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">States</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newstate.statename"> </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newstate.statenumber">  </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputPassword3" class="col-sm-3 control-label">Compliance</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newstate.statecompliance"> </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStateVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Model view States End --> 

                                        </div>   
                                    </div>
                                    <!-- Handwash Content Start -->
                                    <div class="boxuserupdate">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Hand Washes &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" data-target="#handwashaddupdatemodal" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i> </a> </h3>
                                            </div>
                                            <div> </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table id="example1" class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Number</th>
                                                            <th>Media</th>
                                                            <th>Rub Duration</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in handwashData">
                                                            <td style="width:33%;" ng-bind="item.handWashName"></td>
                                                            <td ng-bind="item.handWashNumber"></td>
                                                            <td ng-bind="item.mediaName"></td>
                                                            <td ng-bind="item.rubTime"></td>
                                                            <td class="text-right">
                                                                <span data-toggle="modal" ng-click="viewHandwashModal(item)">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="View" class="btn btn-primary btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                                <a ng-hide="item.isActive === 'N'" ng-click="updateHandwash(item)" data-target="#handwashaddupdatemodal" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs">
                                                                    <i class="fa fa-edit"></i>
                                                                </a> 
                                                                <span ng-hide="item.isActive === 'N'" ng-click="deleteHandwash(item)" data-target="#Deletenotice" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="Delete" class="btn btn-danger btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-trash"></i></a>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div id="example1_info" class="dataTables_info">Showing {{handwashpaginationObject.totalRecords == 0 ? 0 : handwashpaginationObject.start+1}} to                                  
                                {{handwashpaginationObject.totalRecords < handwashpaginationObject.start+handwashpaginationObject.limit ? handwashpaginationObject.totalRecords : handwashpaginationObject.start+handwashpaginationObject.limit}} 
                                of {{handwashpaginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchHandwashThroughPagination()" pagination-object="handwashpaginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- pop up --> 
                                            <!-- Button trigger modal --> 
                                            <!-- Modal Add Handwash Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="handwashaddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newhandwash.handwashtitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Hand Washes</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="handwashForm">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Name" id="newhandwash.handwashname" class="form-control" ng-model="newhandwash.handwashname" name="handwashname" required>
                                                                                <span style="color:red" ng-show="handwashForm.handwashname.$invalid && handwashForm.handwashFormSubmitted">
                                                                                    <span ng-show="handwashForm.handwashname.$error.required">Handwash Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" placeholder="Number" id="newhandwash.handwashnumber" class="form-control" ng-model="newhandwash.handwashnumber" name="handwashnumber" required handwashnum-unique="{customerid: customerid}">
                                                                                <span style="color:red" ng-show="handwashForm.handwashnumber.$invalid && handwashForm.handwashFormSubmitted">
                                                                                    <span ng-show="handwashForm.handwashnumber.$error.required">HandwashNumber is required.</span>
                                                                                    <span ng-show="handwashForm.handwashnumber.$error.number">Not Valid Number!</span>
                                                                                    <span ng-show="handwashForm.handwashnumber.$error.unique">Handwash number already in Use, try with different.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputPassword3" class="col-sm-3 control-label">Media</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newhandwash.handwashmedia" name="handwashmedia" required>
                                                                                    <option ng-repeat="handwashitem in handwashMediaArray" value="{{handwashitem.id}}">{{handwashitem.name}}</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Rub Duration</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Rub Duration" id="newhandwash.rubduration" class="form-control" ng-model="newhandwash.rubduration" name="rubduration" required>
                                                                                <span style="color:red" ng-show="handwashForm.rubduration.$invalid && handwashForm.handwashFormSubmitted">
                                                                                    <span ng-show="handwashForm.rubduration.$error.required">Rub duration is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitHandwash()"><i class="fa fa-fw fa-thumbs-up" ></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetHandwashVariables()"><i class="fa fa-close" ></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal Add Handwash End --> 

                                            <!-- Modal view Handwash Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="handwashviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Handwash</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Handwash</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newhandwash.handwashname">  </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newhandwash.handwashnumber"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputPassword3" class="col-sm-3 control-label">Media</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newhandwash.handwashmedia"> </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Rub Duration</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newhandwash.rubduration"> </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetHandwashVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal view Handwash End --> 
                                        </div>
                                    </div>

                                    <!-- Location Rule Start -->
                                    <div class="boxuserupdate">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Location Rules &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" ng-click="openLocationRuleModal()" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i> </a> </h3>
                                            </div>
                                            <div> </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table id="example1" class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Number</th>
                                                            <th>Entry Handwash type</th>
                                                            <th>Entry Window Time</th>
                                                            <th>Exit Handwash type</th>
                                                            <th>Exit Window Time</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in locationruleData">
                                                            <td ng-bind="item.locationRuleName"></td>
                                                            <td ng-bind="item.locationRuleNumber"></td>
                                                            <td ng-bind="item.entryHandWashTypeName"></td>
                                                            <td ng-bind="item.entryWindowTime"></td>
                                                            <td ng-bind="item.exitHandWashTypeName"></td>
                                                            <td ng-bind="item.exitWindowTime"></td>
                                                            <td class="text-right">
                                                                <span data-toggle="modal" ng-click="viewLocationRuleModal(item)">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="View" class="btn btn-primary btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                                <a ng-hide="item.isActive === 'N'" ng-click="updateLocationRule(item)" data-target="#myModal7" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs">
                                                                    <i class="fa fa-edit"></i>
                                                                </a> 
                                                                <span ng-hide="item.isActive === 'N'" ng-click="deleteLocationRule(item)" data-target="#Deletenotice" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="Delete" class="btn btn-danger btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-trash"></i>
                                                                    </a>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div id="example1_info" class="dataTables_info">Showing {{locationrulepaginationObject.totalRecords == 0 ? 0 : locationrulepaginationObject.start+1}} to                                  
                                {{locationrulepaginationObject.totalRecords < locationrulepaginationObject.start+locationrulepaginationObject.limit ? locationrulepaginationObject.totalRecords : locationrulepaginationObject.start+locationrulepaginationObject.limit}} 
                                of {{locationrulepaginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchLocationRuleThroughPagination()" pagination-object="locationrulepaginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- pop up --> 
                                            <!-- Button trigger modal --> 
                                            <!-- Location Rule Add Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="locationruleaddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newlocationrule.locationruletitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Location Rule</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="locationruleForm" novalidate>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Name" id="inputPassword3" class="form-control" ng-model="newlocationrule.locationrulename" name="locationrulename" required>
                                                                                <span style="color:red" ng-show="locationruleForm.locationrulename.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.locationrulename.$error.required">LocationRule Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" placeholder="Number" id="inputPassword3" class="form-control" ng-model="newlocationrule.locationrulenumber" name="locationrulenumber" required locationrulenum-unique="{customerid: customerid}">
                                                                                <span style="color:red" ng-show="locationruleForm.locationrulenumber.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.locationrulenumber.$error.required">LocationRule Number is required.</span>
                                                                                    <span ng-show="locationruleForm.locationrulenumber.$error.number">Not Valid Number!</span>
                                                                                    <span ng-show="locationruleForm.locationrulenumber.$error.unique">LocationRule number already in Use, try with different.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Entry Handwash type</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newlocationrule.entryHandWashTypeId" name="entryHandWashTypeId" required>
                                                                                    <option ng-repeat="handwashitem in handwashData" value="{{handwashitem.handWashId}}">{{handwashitem.handWashName}}</option>
                                                                                </select>
                                                                                <span style="color:red" ng-show="locationruleForm.entryHandWashTypeId.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.entryHandWashTypeId.$error.required">Entry Handwash type is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Entry Window Time</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" placeholder="Entry Window Time" id="inputPassword3" class="form-control" ng-model="newlocationrule.entrywindowtime" name="entrywindowtime" required>
                                                                                <span style="color:red" ng-show="locationruleForm.entrywindowtime.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.entrywindowtime.$error.required">Entry Window Time is required.</span>
                                                                                    <span ng-show="locationruleForm.entrywindowtime.$error.number">Not Valid Number!</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Exit Handwash type</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newlocationrule.exitHandWashTypeId" name="exitHandWashTypeId" required>
                                                                                    <option ng-repeat="handwashitem in handwashData" value="{{handwashitem.handWashId}}">{{handwashitem.handWashName}}</option>
                                                                                </select>
                                                                                <span style="color:red" ng-show="locationruleForm.exitHandWashTypeId.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.exitHandWashTypeId.$error.required">Exit Handwash Type is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Exit Window Time</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" placeholder="Exit Window Time" id="inputPassword3" class="form-control" ng-model="newlocationrule.exitwindowtime" name="exitwindowtime" required>
                                                                                <span style="color:red" ng-show="locationruleForm.exitwindowtime.$invalid && locationruleForm.locationruleFormSubmitted">
                                                                                    <span ng-show="locationruleForm.exitwindowtime.$error.required">Exit Window Time is required.</span>
                                                                                    <span ng-show="locationruleForm.exitwindowtime.$error.number">Not Valid Number!</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitLocationRule()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetLocationRuleVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Location Rule Add pop up End --> 

                                            <!-- view Location Rule Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="locationruleviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Location Rule</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Location Rule</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.locationrulename">  </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Number</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.locationrulenumber">  </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Entry Handwash type</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.entryHandWashTypeId">  </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Entry Window Time</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.entrywindowtime"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Exit Handwash type</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.exitHandWashTypeId"> </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Exit Window Time</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newlocationrule.exitwindowtime"> </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetLocationRuleVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- view Location Pop Up End --> 
                                        </div>
                                    </div>
                                    <div class="boxuserupdate">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">State Machines &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" data-target="#statemachineaddupdatemodal" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i> </a> </h3>
                                            </div>
                                            <div> </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table id="example1" class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>File path</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in statemachineData">
                                                            <td style="width:33%;" ng-bind="item.name"></td>
                                                            <td><a href="{{item.filePath}}" target="_blank">{{item.filePath}}</a></td>
                                                            <td class="text-right">
                                                                <span ng-click="viewStateMachineModal(item)" data-target="#Deletenotice" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="View" class="btn btn-primary btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                                <a ng-hide="item.isActive === 'N'" ng-click="updateStateMachine(item)" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>
                                                                <span ng-hide="item.isActive === 'N'" ng-click="deleteStateMachine(item)" data-target="#Deletenotice" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="Delete" class="btn btn-danger btn-xs" href="javascript:void(0);">
                                                                        <i class="fa fa-trash"></i>
                                                                    </a>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div id="example1_info" class="dataTables_info">Showing {{statemachinepaginationObject.totalRecords == 0 ? 0 : statemachinepaginationObject.start+1}} to                                  
                                {{statemachinepaginationObject.totalRecords < statemachinepaginationObject.start+statemachinepaginationObject.limit ? statemachinepaginationObject.totalRecords : statemachinepaginationObject.start+statemachinepaginationObject.limit}} 
                                of {{statemachinepaginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchStateMachineThroughPagination()" pagination-object="statemachinepaginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- pop up --> 
                                            <!-- Button trigger modal --> 
                                            <!-- State Machine Add Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statemachineaddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newsm.smtitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">State Machine</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="statemachineform" novalidate>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Name" id="inputPassword3" class="form-control" ng-model="newsm.stateMachineName" name="stateMachineName">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">
                                                                                <div class="fa fa-upload"></div>
                                                                                File Path
                                                                            </label>
                                                                            <div class="col-sm-9">
                                                                                <input type="file" id="exampleInputFile" onchange="angular.element(this).scope().uploadedFile(this)" ng-model="newsm.filepath" name="filepath" accept="text/plain">
                                                                                <span style="color:red" ng-show="statemachineform.filepath.$invalid && statemachineform.statemachineFormSubmitted">
                                                                                    <span ng-show="statemachineform.filepath.$error.required">File Attachment required.</span>
                                                                                    <span ng-show="statemachineform.filepath.$error.type">Text File only supported</span>
                                                                                    <span ng-show="statemachineform.filepath.$error.size">Empty File can't be uploaded</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitStateMachine()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStatemachineVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- State Machine Add Pop Up End --> 

                                            <!-- State Machine view Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statemachineviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View State Machine</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">State Machine</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newsm.stateMachineName">  </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">
                                                                                <div class="fa fa-upload"></div>
                                                                                File Path
                                                                            </label>
                                                                            <div class="col-sm-9">
                                                                                <input type="file" id="exampleInputFile" ng-model="newsm.filepath">
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStatemachineVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- State Machine view Pop Up End --> 

                                        </div>
                                    </div>
                                    <div id="container" class="boxuserupdate">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">State Behaviors &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" ng-click="openStateBehaviorModal()" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i> </a> </h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table class="table table-condensed" style="border-collapse:collapse;">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Memory Slot No</th>
                                                            <th>Role State machine Mapping</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody ng-repeat="item in statebehaviorData">
                                                        <tr>
                                                            <td ng-bind="item.name"></td>
                                                            <td ng-bind="item.memorySlotNo"></td>
                                                            <td class="text-success">
                                                                <button data-toggle="collapse" data-target="#demo{{item.stateBehaviorId}}" data-original-title="Edit" class="accordion-toggle add-role btn bg-purple btn-xs" onclick="myFunction()" ng-click="selectStateBehavior(item.stateBehaviorId)">
                                                                    <i class="fa fa-sitemap"></i>
                                                                </button>
                                                            </td>
                                                            <td class="text-right">
                                                                <span data-toggle="modal" ng-click="viewStateBehaviorModal(item)">
                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="View" data-toggle="tooltip" data-placement="top">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                                <a ng-hide="item.isActive === 'N'" ng-click="updateStateBehavior(item)" class="btn btn-success btn-xs" data-original-title="Edit" data-toggle="modal">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>
                                                                <span ng-hide="item.isActive === 'N'" ng-click="deleteStateBehavior(item)" data-toggle="modal" data-target="#Deletenotice">
                                                                    <a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top">
                                                                        <i class="fa fa-trash"></i>
                                                                    </a>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="hiddenRow">
                                                                <div class="accordian-body collapse" id="demo{{item.stateBehaviorId}}">
                                                                    <div class="table inner-table">
                                                                        <div class="box box-primary">
                                                                            <div class="box-header">
                                                                                <h3 class="box-title">Role Statemachine Mapping &nbsp;<a class="btn btn-success btn-sm" data-original-title="Add User" ng-click="openSMRoleModal()" data-toggle="modal" data-placement="top"><i class="fa fa-plus"></i></a></h3>
                                                                            </div>
                                                                            <div class="dataTables_wrapper form-inline">
                                                                                <table id="myTable" class="table table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Role</th>
                                                                                            <th>State Machine</th>
                                                                                            <th>&nbsp;</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr ng-repeat="rolestatemachineitem in item.rolestatemachinemappings">
                                                                                            <td style="width:33%;" ng-bind="rolestatemachineitem.roleName"></td>
                                                                                            <td  ng-bind="rolestatemachineitem.stateMachineName"></td>
                                                                                            <td></td>
                                                                                            <td class="text-right button-right">
                                                                                                <span ng-click="viewRoleStateMachineModal(rolestatemachineitem)" data-toggle="modal">
                                                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="View" data-toggle="tooltip" data-placement="top">
                                                                                                        <i class="fa fa-eye"></i></a>
                                                                                                </span>
                                                                                                <a ng-hide="rolestatemachineitem.isActive === 'N'" ng-click="updateSMRoleMapping(rolestatemachineitem)" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs">
                                                                                                    <i class="fa fa-edit"></i>
                                                                                                </a>
                                                                                                <span ng-hide="rolestatemachineitem.isActive === 'N'" ng-click="deleteSMRoleMapping(rolestatemachineitem)" data-toggle="modal" data-target="#Deletenotice">
                                                                                                    <a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top">
                                                                                                        <i class="fa fa-trash"></i>
                                                                                                    </a>
                                                                                                </span>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div id="example1_info" class="dataTables_info">Showing {{statebehaviorpaginationObject.totalRecords == 0 ? 0 : statebehaviorpaginationObject.start+1}} to                                  
                                {{statebehaviorpaginationObject.totalRecords < statebehaviorpaginationObject.start+statebehaviorpaginationObject.limit ? statebehaviorpaginationObject.totalRecords : statebehaviorpaginationObject.start+statebehaviorpaginationObject.limit}} 
                                of {{statebehaviorpaginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap">
                                                        <ul class="pagination">
                                                            <li class="prev disabled"><a href="#">Previous</a></li>
                                                            <li class="active"><a href="#">1</a></li>
                                                            <li class="next disabled"><a href="#">Next</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- pop up --> 

                                            <!-- State Behavior Add Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statebehavioraddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newsb.sbtitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">State Behavior</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="sbForm" novalidate>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Name" id="inputPassword3" class="form-control" ng-model="newsb.name" name="name" required>
                                                                                <span style="color:red" ng-show="sbForm.name.$invalid && sbForm.sbFormSubmitted">
                                                                                    <span ng-show="sbForm.name.$error.required">State Behavior Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Memory Slot No</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newsb.memorySlotNoLookupId">
                                                                                    <option ng-repeat="lookupitem in memoryslotArray" value="{{lookupitem.id}}">{{lookupitem.name}}</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitStateBehavior()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStateBehaviorVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- State Behavior Add Pop Up End --> 

                                            <!-- State Behavior view Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statebehaviorviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View State Behaviors</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">State Behaviors</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newsb.name"> </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">Memory Slot No</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newsb.memorySlotNoLookupId">  </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetStateBehaviorVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- State Behavior view Pop Up End --> 

                                            <!-- Add Role State Mapping Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="rolestatemapaddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newsmrolemapping.smroletitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Role State Mapping</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Role</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newsmrolemapping.roleId">
                                                                                    <option ng-repeat="item in roleArray" value="{{item.roleId}}">{{item.name}}</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">State Machine</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newsmrolemapping.stateMachineId">
                                                                                    <option ng-repeat="item in stateMachineArray" value="{{item.id}}">{{item.name}}</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button" ng-click="submitSMRoleMapping()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetSMRoleVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Role State Mapping Add Pop Up End --> 

                                            <!-- View Role State Mapping Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="rolestatemachineviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Role Statemachine Mapping </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Role Statemachine Mapping </h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Role</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newsmrolemapping.roleId">  </div>
                                                                        </div>
                                                                        <div class="form-group even">
                                                                            <label class="col-sm-3 control-label" for="inputPassword3">State Machine</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newsmrolemapping.stateBehaviorId"> </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetSMRoleVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- View State Mapping Edit Pop Up End -->


                                        </div>
                                    </div>

                                </div>
                                </section>
                            </div>
                        </div>
                        </body>

