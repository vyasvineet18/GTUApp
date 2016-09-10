<body class="skin-blue" ng-controller="policytabController">
    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="dispenser"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="layout" class="tab-pane active">
                                    <div class="boxuserupdate" id="container2">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Dispenser &nbsp;</h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table class="table table-condensed" style="border-collapse:collapse;">
                                                    <thead>
                                                        <tr>
                                                            <th>Master ID </th>
                                                            <th>MAC Address</th>
                                                            <th>Identifier </th>
                                                            <th>Type </th>
                                                            <th>Media </th>
                                                            <th>Unit </th>
                                                            <th>Room</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in dispenserData">
                                                            <td ng-bind="$index + 1"></td>
                                                            <td ng-bind="item.macAddress"></td>
                                                            <td ng-bind="item.identifier"></td>
                                                            <td ng-bind="item.typeName"></td>
                                                            <td ng-bind="item.media"></td>
                                                            <td ng-bind="item.unitName"></td>
                                                            <td ng-bind="item.roomName"></td>
                                                            <td class="text-right button-right">
                                                                <span data-toggle="modal" ng-click="viewDispenserModal(item)">
                                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="Update" data-toggle="tooltip" data-placement="top">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </span> 
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
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

                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="dispenserviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Dispenser</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Dispenser</h3>
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
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">MAC </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.macAddress"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Identifier</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.identifier"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Type</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.type">  </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Media</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.media"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Unit </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.unit"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Room</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.room"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Location Comment</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.locationComment"> </div>
                                                                        </div>
<!--                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">HandWash Media Type </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="room"> Water </div>
                                                                        </div>-->
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Battery Type</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.batteryType"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Battery Count</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.batteryCount"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Battery Level</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.batteryLevel"></div>
                                                                        </div>
                                                                        <div class="form-group date-select">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Start Date </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.startDate"> </div>
                                                                        </div>
                                                                        <div class="form-group date-select">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">End Date </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="viewdispenser.endDate"></div>
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

