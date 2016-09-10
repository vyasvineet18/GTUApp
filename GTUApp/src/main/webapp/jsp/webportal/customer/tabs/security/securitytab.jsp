<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="skin-blue" ng-controller="securitytabController">
    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="security"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="layout" class="tab-pane active">
                                    <div class="boxuserupdate" id="container2">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Security &nbsp;<a data-placement="top" data-toggle="modal" data-target="#addrolemodal" data-original-title="Add Role" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> </a></h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline">
                                            	<div class="row" style="margin:15px 10px">
                            						<div class="col-xs-6">
                                						<div id="example1_length" class="dataTables_length">
                                    						<label>
                                        						<select size="1" name="example1_length" aria-controls="example1" ng-model="defaultrecordsperpage">
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
                                            	
                                                <table class="table table-condensed" style="border-collapse:collapse;">
                                        			<thead>
                                            			<tr>
                                            				<th><input name="" type="checkbox" value=""></th>
                                                			<th>ID </th>
                                                			<th>Role Name</th>
                                                			<th>Protected Object Names</th>
                                                			<th></th>
                                            			</tr>
                                        			</thead>
	                                        		<tbody ng-repeat="item in roleData | filter:search">
                                            			<tr>
                                            				<td><input name="" type="checkbox" value=""></td>
                                                			<td ng-bind="$index +1"></td>
                                                			<td ng-bind="item.name"></td>
															<td class="text-success">
    															<button data-toggle="collapse" data-target="#demo{{item.roleId}}" data-original-title="Edit" class="accordion-toggle add-role btn bg-purple btn-xs" ng-click="getProtectedObject(item)">
        															<i class="fa fa-sitemap"></i>
    															</button>
															</td>
                                                			
                                                			<td class="text-right button-right">
                                                			<span data-toggle="modal" ng-click="viewRoleModal(item)" data-target="#Deletenotice">
                                                				<a href="javascript:void(0)" class="btn btn-primary btn-xs" data-placement="top" data-original-title="View">
                                                					<i class="fa fa-eye"></i>
                                                				</a>
                                                			</span>
                                                			<span data-toggle="modal" ng-click="editRoleModal(item)">
                                                				<a href="javascript:void(0)" class="btn btn-success btn-xs" data-target="#myModal32" data-original-title="Edit" >
                                                					<i class="fa fa-edit"></i>
                                                				</a>
                                                			</span>
                                                			<span data-toggle="modal" ng-click="deleteRoleModal(item)" data-target="#Deletenotice">
                                                				<a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top">
                                                					<i class="fa fa-trash"></i>
                                                				</a>
                                                			</span>
                                                			</td>
                                            			</tr>
                                                        <tr>
                                                            <td colspan="6" class="hiddenRow">
                                                                <div class="accordian-body collapse" id="demo{{item.roleId}}">
                                                                    <div class="table inner-table">
                                                                        <div class="box box-primary">
                                                                            <div class="box-header">
                                                                                <h3 class="box-title">Protected Object Name&nbsp;</h3>
                                                                            </div>
                                                                            <div class="dataTables_wrapper form-inline">
                                                                                <table id="myTable" class="table table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                        	<th><input name="" type="checkbox" value="" ng-model="item.selectedAll" ng-click="checkAll($event,item)"></th>
                                                                                            <th>Id</th>
                                                                                            <th>Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr ng-repeat="poitem in item.protectedobjects">
																							<td><input name="" type="checkbox" value="" ng-click="check($event, item, poitem)" ng-checked="item.rpoitems.indexOf(poitem.name) > -1" ng-model="poitem.Selected"></td>
                                                                                            <td ng-bind="$index + 1"></td>
                                                                                            <td ng-bind="poitem.name"></td>                                                                                          
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                                <div class="modal-footer">
                                                    								<button class="btn btn-primary" type="button" ng-click="grant(item)"><i class="fa fa-fw fa-thumbs-up"></i> Grant</button> 
                                                    								<button class="btn btn-primary" type="button" ng-click="revoke(item)"><i class="fa fa-fw fa-thumbs-up"></i> Revoke</button>                                                                               
                                                                            	</div>
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

                            				<!-- View role -->
                            				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="viewrolemodal" class="modal fade" style="display: none;">
                                				<div class="modal-dialog">
                                    				<div class="modal-content">
                                        				<div class="modal-header">
                                            			<button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            				<h4 id="myModalLabel" class="modal-title">View Role </h4>
                                        				</div>
                                        				<div class="modal-body">
                                            				<div class="box box-primary">
                                                				<div class="box-header">
                                                    				<h3 class="box-title">Role</h3>
                                                				</div>
                                                				<!-- /.box-header --> 
				                                                <!-- form start -->
                                                				<div style="float:none;" class="col-md-12">
                                                    				<form class="form-horizontal">
                                                        				<div class="form-group">
                                                            				<label class="col-sm-3 control-label" for="inputEmail3">ID</label>
                                                            				<div class="col-sm-9 user-id" ng-bind="viewRole.roleId"></div>
                                                        				</div>
                                                        				<div class="form-group">
                                                            				<label for="inputEmail3" class="col-sm-3 control-label">Role Name</label>
                                                            				<div class="col-sm-9 user-id" ng-bind="viewRole.name"></div>
                                                        				</div>
                                                    				</form>
                                                				</div>
                                                				<div class="modal-footer">
                                                					<button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> Cancel</button>
                                                				</div>
                                            				</div>
                                        				</div>
                                    				</div>
                                				</div>
                            				</div>
                            				<!-- View role --> 

                            				<!-- Pop Up Start --> 
                            				<!-- Add User Pop Up Start -->
                            				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addrolemodal" class="modal fade" style="display: none;">
                                				<div class="modal-dialog">
                                    				<div class="modal-content">
                                        				<div class="modal-header">
                                            				<button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            				<h4 id="myModalLabel" class="modal-title">Add Role</h4>
                                        				</div>
                                        				<div class="modal-body">
                                            				<div class="box box-primary">
                                                				<div class="box-header">
                                                    				<h3 class="box-title">Role</h3>
                                                				</div>
                                                				<!-- /.box-header --> 
                                                				<!-- form start -->
                                                				<div style="float:none;" class="col-md-12">
                                                    				<form class="form-horizontal">
                                                        				<div class="form-group">
                                                        					<label class="col-sm-3 control-label" for="inputEmail3">Role Name</label>
                                                            				<div class="col-sm-9">
                                                                				<input type="text" class="form-control" id="inputrolename" placeholder="Role Name"  ng-model="roleName">
                                                            				</div>
                                                        				</div>
                                                        				<div class="form-group">
                                                            				<label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                            				<div class="col-sm-9">
                                                                				<select class="form-control" ng-model="roleIsActive">
                                                                    				<option>Yes</option>
                                                                    				<option>No</option>
                                                                				</select>
                                                            				</div>                                                            
                                                        				</div>
                                                    				</form>
                                                				</div>
                                                				<div class="modal-footer">
                                                    				<button class="btn btn-primary" type="button" ng-click="addRoleModal()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                    				<button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> Cancel</button>
                                                				</div>
                                            				</div>
                                        				</div>
                                    				</div>
                                				</div>
                            				</div>	
                            				<!-- Add role Pop Up End -->
                             
                            				<!-- Edit role Pop Up Start -->
                            				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="editrolemodal" class="modal fade" style="display: none;">
                                				<div class="modal-dialog">
                                    				<div class="modal-content">
                                        				<div class="modal-header">
                                            				<button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            				<h4 id="myModalLabel" class="modal-title">Edit Role</h4>
                                        				</div>
                                        				<div class="modal-body">
                                            			<div class="box box-primary">
                                                		<div class="box-header">
                                                    		<h3 class="box-title">Role</h3>
                                                		</div>
                                                		<!-- /.box-header --> 
                                                		<!-- form start -->
                                                		<div style="float:none;" class="col-md-12">
                                                    		<form class="form-horizontal">
                                                        		<div class="form-group">
                                                            		<label class="col-sm-3 control-label" for="inputEmail3">ID</label>
                                                            		<div class="col-sm-9 user-id" ng-bind="editRole.roleId"></div>
                                                        		</div>
                                                        		<div class="form-group">
                                                            		<label class="col-sm-3 control-label" for="inputEmail3">Role Name</label>
                                                            		<div class="col-sm-9">
                                                                		<input type="text" class="form-control" id="inputrolename" ng-model="editRoleName">                        
                           	                                   		</div>
                                                        		</div>
                                                    		</form>
                                                		</div>
                                                		<div class="modal-footer">
                                                    		<button class="btn btn-primary" type="button" ng-click=updateRole()><i class="fa fa-fw fa-thumbs-up" ></i>Update</button>
                                                    		<button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> Cancel</button>
                                                		</div>
                                            			</div>
                                        				</div>
                                    				</div>
                                				</div>	
		                            		</div>	
        		                   			<!-- Edit role Pop Up End -->


                            				<!-- Protected Object Confirmation Pop Up Start -->
                            				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="protectedobjectconfirmationmodal" class="modal fade" style="display: none;">
                                				<div class="modal-dialog">
                                    				<div class="modal-content">
                                        				<div class="modal-header">
                                            				<button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            				<h4 id="myModalLabel" class="modal-title">{{confirmationModal.title}}</h4>
                                        				</div>
                                        				<div class="modal-body">
                                            			<div class="box box-primary">
                                                		<div class="box-header">
                                                    		<h3 class="box-title">{{confirmationModal.alertMessage}}</h3>
                                                		</div>
                                                		<div class="modal-footer">
                                                    		<button class="btn btn-primary" type="button" ng-click=submit()><i class="fa fa-fw fa-thumbs-up" ></i>Ok</button>
                                                    		<button data-dismiss="modal" class="btn btn-danger" type="button" onclick="refreshAll()"><i class="fa fa-close"></i> Cancel</button>
                                                		</div>
                                            			</div>
                                        				</div>
                                    				</div>
                                				</div>	
		                            		</div>	
        		                   			<!-- Protected Object Confirmation Pop Up End -->

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

