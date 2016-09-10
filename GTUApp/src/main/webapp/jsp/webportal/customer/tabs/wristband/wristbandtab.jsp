<body class="skin-blue" ng-controller="wristbandtabController">
    <div class="wrapper" ng-init="fetchAllWristbandCountsByCustId()">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="wristband"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="layout" class="tab-pane active">
                                    <div class="boxuserupdate" id="container2">
                                        <div class="box box-primary">

                                            <div class="box-header">
                                                <h3 class="box-title">Wristband &nbsp;</h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline">
                                                <table style="border-collapse:collapse;" class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Master ID </th>
                                                            <th>MAC Address</th>
                                                            <th>Identifier </th>
                                                            <th>Manufacture</th>
                                                            <th>Asigned User</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="item in wirstbandData">
                                                            <td ng-bind="$index + 1"></td>
                                                            <td ng-bind="item.macAddress"></td>
                                                            <td ng-bind="item.identifier"></td>
                                                            <td ng-bind="item.manufacturer"></td>
                                                            <td ng-bind="item.assignedUserName"></td>
                                                            <td ng-bind="item.startDate"></td>
                                                            <td ng-bind="item.endDate"></td>
                                                            <td class="text-right button-right">
                                                                <span ng-click="viewWristBandModal(item)" data-toggle="modal">
                                                                    <a data-placement="top" data-toggle="tooltip" data-original-title="Update" class="btn btn-primary btn-xs" href="javascript:void(0);">
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
                                                    <div id="example1_info" class="dataTables_info">Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchThroughPagination()" pagination-object="paginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div style="display: none;" class="modal fade" id="wristbandviewmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title">View Wristband</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Wristband</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
<!--                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Wristband Master ID </label>
                                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                                        </div>-->
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">MAC </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="macAddress"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Identifier</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="identifier"></div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Manufacture</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="manufacture"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Assigned User</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="assignedUserName"> </div>
                                                                        </div>
                                                                        <div class="form-group date-select">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">Start Date </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="startDate"> </div>
                                                                        </div>
                                                                        <div class="form-group date-select">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">End Date </label>
                                                                            <div class="col-sm-9 user-id" ng-bind="endDate">  </div>
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

