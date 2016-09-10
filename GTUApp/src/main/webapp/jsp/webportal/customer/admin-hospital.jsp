<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper" ng-controller="adminhospitalController">
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box" ng-show="isDataLoaded">
                    <div class="box-header">
                        <h3 class="box-title">Hospital &nbsp;
                            <a href="#hospitaldetail/0/general" class="btn btn-success btn-sm" data-original-title="Add Hospital" data-toggle="tooltip" data-placement="top">
                                <i class="fa fa-plus"></i>
                            </a> 
                        </h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row" style="margin:15px 10px">
                            <div class="col-xs-6">
                                <div id="example1_length" class="dataTables_length">
                                    <label>
                                        <select size="1" name="example1_length" aria-controls="example1" ng-model="defaultrecordsperpage" ng-change="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select> records per page
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="dataTables_filter" id="example1_filter">
                                    <label>Search: <input type="text" aria-controls="example1" ng-model="search.$"></label>
                                </div>
                            </div>
                        </div>
                        
                        <table class="table table-hover" id="example1">
                            <thead>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Plan</th>
                            <th class="hide-phone hide-tablet">Address</th>
                            <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in hospData| filter:search">
                                    <td ng-bind="item.id"></td>
                                    <td ng-bind="item.name"></td>
                                    <td ng-bind="item.plan"></td>

                                    <td class="hide-phone hide-tablet" ng-bind="item.fulladdress"></td>                                                                                                            
                                    <td class="text-right">
                                        <span ng-click="viewHospitalModal(item)" data-toggle="modal" ><a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="View" data-toggle="tooltip" data-placement="top"><i class="fa fa-eye"></i></a></span>
                                              <a ng-hide="item.isActive === 'N'" ng-href="{{getLink(item)}}"  class="btn btn-success btn-xs" data-original-title="Update" data-toggle="tooltip" data-placement="top"><i class="fa fa-edit"></i></a>
                                        <!-- Changed for showing dashboard according to choosed Plan 
                                          <a ng-hide="item.isActive === 'N'" href="#hospitaldetail/{{item.id}}/dashboardLevel1?plan={{item.plan}}" class="btn btn-success btn-xs" data-original-title="Update" data-toggle="tooltip" data-placement="top"><i class="fa fa-edit"></i></a>-->
                                        <span ng-hide="item.isActive === 'N'" ng-click="deleteHospital(item)" data-toggle="modal" data-target="#Deletenotice">
                                            <a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="row" style="margin-top: 15px"><div class="col-xs-6">
                                <!--  <div class="dataTables_info" id="example1_info">
                                    Showing 1 to 3 of 3 entries
                                </div>-->
                                <div class="dataTables_info" id="example1_info">
                                Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
                            </div>
                            <div class="col-xs-6">
                                <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                    <div pagination on-navigate="fetchThroughPagination()" pagination-object="paginationObject"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Model view States Start -->
                        <div class="boxuserupdate" id="viewcustomermodal" style="display:none">
                            <div class="box box-primary">
                                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="hospitalviewmodal" class="modal fade" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                <h4 id="myModalLabel" class="modal-title">View Hospital</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="box box-primary">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Hospital</h3>
                                                    </div>
                                                    <!-- /.box-header --> 
                                                    <!-- form start -->
                                                    <div style="float:none;" class="col-md-12">
                                                        <form class="form-horizontal">
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label" for="inputEmail3">Name</label>
                                                                <div class="col-sm-9 user-id" ng-bind="customername"> </div>
                                                            </div>
                                                            <div class="form-group even">
                                                                <label class="col-sm-3 control-label" for="inputPassword3">Plan</label>
                                                                <div class="col-sm-9 user-id" ng-bind="customerplan">  </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inputPassword3" class="col-sm-3 control-label">Address</label>
                                                                <div class="col-sm-9 user-id" ng-bind="customeraddress"> </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                        <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetHospitalVariables()"><i class="fa fa-close"></i> cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Model view States End --> 
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
    </section>

</div><!-- /.content-wrapper -->
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip --> 
<script>
            $.widget.bridge('uibutton', $.ui.button);
</script> 