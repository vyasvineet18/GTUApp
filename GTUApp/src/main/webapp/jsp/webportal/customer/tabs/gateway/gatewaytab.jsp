<body class="skin-blue" ng-controller="gatewaytabController">
    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="gateway"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="layout" class="tab-pane active">
                                    <div class="boxuserupdate" id="container2">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Gateway &nbsp;</h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline" style="display:block;overflow-x:scroll;">
                                                <table class="table table-condensed" style="border-collapse:collapse;">
                                                    <thead>
                                                        <tr>
                                                        	<th>Serial No </th>
                                                            <th>Device ID </th>
                                                            <th>Device Name </th>                                                            
                                                            <th>Status</th>
                                                            <th>Bluetooth Interaction Timestamp</th>
                                                            <th>Export Timestamp</th>
                                                            <th>Restart Timestamp</th>
                                                            <th>Battery Level</th>
                                                            <th>Login Timestamp</th>
                                                            <th>Logged In Username</th> 
                                                            <th>Unit Name</th>                                                                                                                       
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
	
	
                                                        <tr ng-repeat="item in gatewayDeviceData">
                                                            <td ng-bind="$index + 1"></td>
                                                            <td ng-bind="item.deviceId"></td>
                                                            <td ng-bind="item.deviceName"></td>
                                                            
                                                            <!--  <td ng-bind="item.deviceStatus"></td>-->
                                                            <td ng-if="item.deviceStatus == '28' ">
                                                            	<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-green.png" alt="Green">
                                                            </td>
                                                            <td ng-if="item.deviceStatus == '29' ">                                                          
                                                            	<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-yellow.png" alt="Yellow">
                                                            </td>
                                                            <td ng-if="item.deviceStatus == '30' ">
                                                            	<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-red.png" alt="Red">
                                                            </td>
                                                            <td ng-bind="millisToUTCDate(item.bluetoothInteractionTime) | date:'yyyy-MM-dd HH:mm:ss '"></td>
                                                            <td ng-bind="millisToUTCDate(item.exportEventsTime) | date:'yyyy-MM-dd HH:mm:ss '"></td>
                                                            <td ng-bind="millisToUTCDate(item.restartTime) | date:'yyyy-MM-dd HH:mm:ss '"></td>
                                                            <td ng-bind="item.batteryStatus == '0' ? '' : item.batteryStatus+'%'"></td>
                                                            <td ng-bind="millisToUTCDate(item.loggedInTime) | date:'yyyy-MM-dd HH:mm:ss '"></td>
                                                            <td ng-bind="item.userName"></td>
                                                            <td ng-bind="item.unitName"></td>
                                                            <td class="text-right button-right">
                                                                <span data-toggle="modal" ng-click="viewGatewayModal(item)">
                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="Update" data-toggle="tooltip" title="View" data-placement="top">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                                <span data-toggle="modal" ng-click="restartGateway(item.deviceId)">
                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="Restart" data-toggle="tooltip" title="Restart" data-placement="top">
                                                                        <i class="fa fa-undo"></i>
                                                                    </a>
                                                                </span>
                                                                <span data-toggle="modal" ng-click="logoutGateway(item.deviceId)">
                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="Logout" data-toggle="tooltip" title="Logout" data-placement="top">
                                                                        <i class="fa fa-power-off"></i>
                                                                    </a>
                                                                </span>
                                                               
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <!--  <div class="dataTables_info" id="example1_info">Showing 1 to 1 of 1 entries</div>-->
                                                    <div class="dataTables_info" id="example1_info">Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchThroughPagination()" pagination-object="paginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="gatewayeviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Gateway</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Gateway</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
<!--                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Dispenser Master ID </label>
                                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                                        </div>-->
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Device Id </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewGateway.deviceId"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Device Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewGateway.deviceName"> </div>
                                                                        </div>
                                                                       
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Status</label>
                                                                            <!--  <div class="col-sm-9 user-id" ng-bind="viewGateway.deviceStatus">  </div>-->
                                                                            <div class="col-sm-9 user-id" ng-if="viewGateway.deviceStatus == '28' ">
                                                            					<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-green.png" alt="Green">
                                                            				</div>
                                                            				<div class="col-sm-9 user-id" ng-if="viewGateway.deviceStatus == '29' ">
                                                            					<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-yellow.png" alt="Yellow">
                                                            				</div>
                                                            				<div class="col-sm-9 user-id" ng-if="viewGateway.deviceStatus == '30' ">
                                                            					<img src="${pageContext.request.contextPath}/jsp/webportal/template/images/icon-red.png" alt="Red">
                                                            				</div>
                                                            
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Bluetooth Interaction Timestamp</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="millisToUTCDate(viewGateway.bluetoothInteractionTime) | date:'yyyy-MM-dd HH:mm:ss '"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Export Timestamp</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="millisToUTCDate(viewGateway.exportEventsTime) | date:'yyyy-MM-dd HH:mm:ss '"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Restart Timestamp</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="millisToUTCDate(viewGateway.restartTime) | date:'yyyy-MM-dd HH:mm:ss '"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Battery Status</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewGateway.batteryStatus == '0' ? '' : viewGateway.batteryStatus+'%'"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login Timestamp</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="millisToUTCDate(viewGateway.loggedInTime) | date:'yyyy-MM-dd HH:mm:ss '"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Logged In Username </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewGateway.userName"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Unit Name </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewGateway.unitName"> </div>
                                                                        </div>
                                                                        
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                    <button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- view Dispenser  Pop Up End --> 

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>

