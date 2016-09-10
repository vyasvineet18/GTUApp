<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<body class="skin-blue" ng-controller="policytabController">
	<div class="wrapper">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div role="tabpanel" class="nav-tabs-custom">
							<jsp:include page="../tabsmenu.jsp">
								<jsp:param name="page" value="layout"></jsp:param>
							</jsp:include>
							<div class="tab-content">
								<div id="layout" class="tab-pane active">
									<div class="boxuserupdate">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">
													Units &nbsp;
													<security:authorize
														access="hasRole(T(com.hyginex.utilities.Hyginexconstants).ADDUNIT)">
														<a class="btn btn-success btn-sm"
															data-original-title="Add User" ng-click="openUnitModal()"
															data-toggle="modal" data-placement="top"><i
															class="fa fa-plus"></i> </a>
													</security:authorize>
												
												</h3>
											</div>
											<div class="dataTables_wrapper form-inline">
												<table style="border-collapse: collapse;"
													class="table table-condensed">
													<thead>
														<tr>
															<th>ID</th>
															<th>Name</th>
															<th>Unit Head</th>
															<th>State Behavior</th>
															<th></th>
														</tr>
													</thead>
													<tbody ng-repeat="item in unitData"
														style="border-top: 0px solid #ddd">
														<tr>
															<td ng-bind="$index + 1"></td>
															<td ng-bind="item.unitname"></td>
															<td ng-bind="item.unithead"></td>
															<td ng-bind="item.statebehavior"></td>
															<td class="text-right">
																<button data-target="#demo{{item.unitid}}"
																	data-toggle="collapse"
																	ng-click="expandUnitFloorPlan(item.unitid)"
																	class="accordion-toggle add-role text-success btn bg-maroon btn-xs">
																	<i class="fa fa-fw fa-upload"></i>
																	<!-- Floor Plan [{{item.unitfloorplans.length}}] -->
																	Floor Plan
																</button> <a ng-click="openRoomModal(item.unitid)"
																data-toggle="modal" class="btn bg-navy btn-xs">
																	Define Rooms </a>
															</td>
															<td class="text-right button-right"><span
																data-toggle="modal" ng-click="viewUnitModal(item)">
																	<a data-placement="top" data-toggle="tooltip"
																	data-original-title="Update"
																	class="btn btn-primary btn-xs"
																	href="javascript:void(0);"> <i class="fa fa-eye"></i>
																</a>
															</span> <a ng-hide="item.isActive === 'N'"
																ng-click="updateUnit(item)"
																class="btn btn-success btn-xs"
																data-original-title="Edit" data-toggle="modal"> <i
																	class="fa fa-edit"></i>
															</a> <span ng-hide="item.isActive === 'N'"
																ng-click="deleteUnit(item)" data-target="#Deletenotice"
																data-toggle="modal"> <a data-placement="top"
																	data-toggle="tooltip" data-original-title="Delete"
																	class="btn btn-danger btn-xs"
																	href="javascript:void(0);"> <i class="fa fa-trash"></i>
																</a>
															</span></td>
														</tr>
														<tr>
															<td class="hiddenRow" colspan="6">
																<div id="demo{{item.unitid}}"
																	class="accordian-body collapse">
																	<div class="table inner-table">
																		<div class="box box-primary">
																			<div class="box-header">
																				<h3 class="box-title">
																					Add Floor Plan Mapping&nbsp;<a
																						class="btn btn-success btn-sm"
																						data-original-title="Add User"
																						data-target="#unitfloorplanaddupdatemodal"
																						data-toggle="modal" data-placement="top"><i
																						class="fa fa-plus"></i></a>
																				</h3>
																			</div>
																			<div class="dataTables_wrapper form-inline">
																				<table id="myTable" class="table table-hover">
																					<thead>
																						<tr>
																							<th>Image</th>
																							<th>Comment</th>
																							<th>&nbsp;</th>
																							<th></th>
																						</tr>
																					</thead>
																					<tbody>
																						<tr
																							ng-repeat="unitfloorplanitem in item.unitfloorplans">
																							<td style="width: 33%;"><img
																								style="display: inline-block; width: 100px; float: left; height: 100px; overflow: hidden; vertical-align: top"
																								src="{{unitfloorplanitem.imagePath}}"
																								ng-click="openImgInModal(unitfloorplanitem.imagePath)"></td>
																							<td ng-bind="unitfloorplanitem.comment"></td>
																							<td></td>
																							<td class="text-right button-right"><span
																								data-toggle="modal"
																								ng-click="viewUnitFloorPlanModal(unitfloorplanitem)">
																									<a href="javascript:void(0);"
																									class="btn btn-primary btn-xs"
																									data-original-title="Update"
																									data-toggle="tooltip" data-placement="top">
																										<i class="fa fa-eye"></i>
																								</a>
																							</span> <a ng-hide="unitfloorplanitem.isActive === 'N'"
																								ng-click="updateUnitFloorPlan(unitfloorplanitem)"
																								data-toggle="modal" data-original-title="Edit"
																								class="btn btn-success btn-xs"> <i
																									class="fa fa-edit"></i>
																							</a> <span
																								ng-hide="unitfloorplanitem.isActive === 'N'"
																								ng-click="deleteUnitFloorPlan(unitfloorplanitem)"
																								data-toggle="modal" data-target="#Deletenotice">
																									<a href="javascript:void(0);"
																									class="btn btn-danger btn-xs"
																									data-original-title="Delete"
																									data-toggle="tooltip" data-placement="top">
																										<i class="fa fa-trash"></i>
																								</a>
																							</span></td>
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
													<!--  <div id="example1_info" class="dataTables_info">Showing
														1 to 1 of 1 entries</div>-->
														<div class="dataTables_info" id="example1_info">Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
												</div>
												<div class="col-xs-6">
													<div class="dataTables_paginate paging_bootstrap"
														ng-if="isDataLoaded">
														<div pagination on-navigate="fetchThroughPagination()"
															pagination-object="paginationObject"></div>
													</div>
												</div>
											</div>

											<!-- Pop Up -->
											<!-- Add Unit Pop Up Start -->
											<div aria-hidden="true" aria-labelledby="myModalLabel"
												role="dialog" tabindex="-1" id="unitaddupdatemodal"
												class="modal fade" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-label="Close" data-dismiss="modal"
																class="close" type="button">
																<span aria-hidden="true"></span>
															</button>
															<h4 id="myModalLabel" class="modal-title"
																ng-bind="newlayout.layouttitle"></h4>
														</div>
														<div class="modal-body">
															<div class="box box-primary">
																<div class="box-header">
																	<h3 class="box-title">Unit</h3>
																</div>
																<!-- /.box-header -->
																<!-- form start -->
																<div style="float: none;" class="col-md-12">
																	<form class="form-horizontal" name="unitForm"
																		novalidate>
																		<!--                                                                        <div class="form-group">
                                                                                                                                                    <label class="col-sm-3 control-label" for="inputEmail3">ID</label>
                                                                                                                                                    <div class="col-sm-9 user-id"> 1 </div>
                                                                                                                                                </div>-->
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Name</label>
																			<div class="col-sm-9">
																				<input type="text" placeholder="Name"
																					id="inputPassword3" class="form-control"
																					ng-model="newlayout.unitname" name="unitname"
																					required> <span style="color: red"
																					ng-show="unitForm.unitname.$invalid && unitForm.unitFormSubmitted">
																					<span ng-show="unitForm.unitname.$error.required">Unit
																						Name is required.</span>
																				</span>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Unit Head</label>
																			<div class="col-sm-9">
																				<select class="form-control"
																					ng-model="newlayout.userid">
																					<option value="0" selected>Select User</option>
																					<option ng-repeat="item in userDataArray"
																						value="{{item.id}}">{{item.first}}
																						{{item.last}}</option>
																				</select>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">State Behavior</label>
																			<div class="col-sm-9">
																				<select class="form-control"
																					ng-model="newlayout.statebehaviorid" >
																					<option value="0" selected>Select StateBehaviour</option>
																					<option ng-repeat="item in sbDataArray"
																						value="{{item.stateBehaviorId}}">{{item.name}}</option>
																				</select>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button class="btn btn-primary" type="button"
																				ng-click="submitUnit()">
																				<i class="fa fa-fw fa-thumbs-up"></i> Submit
																			</button>
																			<button data-dismiss="modal" class="btn btn-danger"
																				type="button" ng-click="resetUnitVariables()">
																				<i class="fa fa-close"></i> cancel
																			</button>
																		</div>
																	</form>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- Add Unit Pop Up End -->

											<!-- View Unit PoP Start -->
											<div aria-hidden="true" aria-labelledby="myModalLabel"
												role="dialog" tabindex="-1" id="unitviewmodal"
												class="modal fade" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-label="Close" data-dismiss="modal"
																class="close" type="button">
																<span aria-hidden="true"></span>
															</button>
															<h4 id="myModalLabel" class="modal-title">View Unit</h4>
														</div>
														<div class="modal-body">
															<div class="box box-primary">
																<div class="box-header">
																	<h3 class="box-title">Unit</h3>
																</div>
																<!-- /.box-header -->
																<!-- form start -->
																<div style="float: none;" class="col-md-12">
																	<form class="form-horizontal">
																		<!--                                                                        <div class="form-group">
                                                                                                                                                    <label class="col-sm-3 control-label" for="inputEmail3">ID</label>
                                                                                                                                                    <div class="col-sm-9 user-id"> 1 </div>
                                                                                                                                                </div>-->
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Name</label>
																			<div class="col-sm-9 user-id"
																				ng-bind="newlayout.unitname"></div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Unit Head</label>
																			<div class="col-sm-9 user-id"
																				ng-bind="newlayout.userid"></div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">State Behavior</label>
																			<div class="col-sm-9 user-id"
																				ng-bind="newlayout.statebehaviorid">`</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button class="btn btn-primary" type="button">
																		<i class="fa fa-fw fa-thumbs-up"></i> Submit
																	</button>
																	<button data-dismiss="modal" class="btn btn-danger"
																		type="button" ng-click="resetUnitVariables()">
																		<i class="fa fa-close"></i> cancel
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- View Unit Pop Up End -->
											<!-- Add Floor Plan Mapping Pop Up Start -->
											<div aria-hidden="true" aria-labelledby="myModalLabel"
												role="dialog" tabindex="-1" id="unitfloorplanaddupdatemodal"
												class="modal fade" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-label="Close" data-dismiss="modal"
																class="close" type="button">
																<span aria-hidden="true"></span>
															</button>
															<h4 id="myModalLabel" class="modal-title"
																ng-bind="newunitfloorplan.uftitle"></h4>
														</div>
														<div class="modal-body">
															<div class="box box-primary">
																<div class="box-header">
																	<h3 class="box-title"
																		ng-bind="newunitfloorplan.uftitle"></h3>
																</div>
																<!-- /.box-header -->
																<!-- form start -->
																<div style="float: none;" class="col-md-12">
																	<form class="form-horizontal" name="unitfloorplanForm"
																		novalidate>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">
																				<div class="fa fa-upload"></div> Image
																			</label>
																			<div class="col-sm-9">
																				<input id="fileupload" name="image_path" type="file"
																					onchange="angular.element(this).scope().uploadedFile(this)"
																					ng-model="newunitfloorplan.image_path"
																					accept="image/*" /> <span style="color: red"
																					ng-show="unitfloorplanForm.image_path.$invalid && unitfloorplanForm.unitfloorplanFormSubmitted">
																					<span
																					ng-show="unitfloorplanForm.image_path.$error.type">Image
																						File only supported with extension
																						jpg|jpeg|png|gif.</span> <span
																					ng-show="unitfloorplanForm.image_path.$error.size">Empty
																						File can't be uploaded</span>
																				</span>
																				<div id="dvPreview"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Comment</label>
																			<div class="col-sm-9">
																				<input type="text" placeholder="Comment"
																					id="inputPassword3" name="comment" class="form-control"
																					ng-model="newunitfloorplan.comment" ng-maxlength="150">
																					<span style="color: red" ng-show="unitfloorplanForm.comment.$error.maxlength">Comment limit is 150.</span>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button class="btn btn-primary" type="button"
																				ng-click="submitUnitFloorplan()">
																				<i class="fa fa-fw fa-thumbs-up"></i> Submit
																			</button>
																			<button data-dismiss="modal" class="btn btn-danger"
																				type="button"
																				ng-click="resetUnitFloorPlanVariables()">
																				<i class="fa fa-close"></i> cancel
																			</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- Add Floor Plan Mapping Pop Up End -->

											<!-- View Floor Plan Mapping Pop Up Start -->
											<div aria-hidden="true" aria-labelledby="myModalLabel"
												role="dialog" tabindex="-1" id="viewUnitFloorPlanModal"
												class="modal fade" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-label="Close" data-dismiss="modal"
																class="close" type="button">
																<span aria-hidden="true"></span>
															</button>
															<h4 id="myModalLabel" class="modal-title">View Floor
																Plan Mapping</h4>
														</div>
														<div class="modal-body">
															<div class="box box-primary">
																<div class="box-header">
																	<h3 class="box-title">View Floor Plan Mapping</h3>
																</div>
																<!-- /.box-header -->
																<!-- form start -->
																<div style="float: none;" class="col-md-12">
																	<form class="form-horizontal">
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">
																				<div class="fa fa-upload"></div> Image
																			</label>
																			<div class="col-sm-9">
																				<input id="fileupload" type="file"
																					ng-model="newunitfloorplan.image_path" />
																				<div id="dvPreview"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Comment</label>
																			<div class="col-sm-9 user-id"
																				ng-bind="newunitfloorplan.comment"></div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button class="btn btn-primary" type="button">
																		<i class="fa fa-fw fa-thumbs-up"></i> Submit
																	</button>
																	<button data-dismiss="modal" class="btn btn-danger"
																		type="button" ng-click="resetUnitFloorPlanVariables()">
																		<i class="fa fa-close"></i> cancel
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- View Floor Plan Mapping Pop Up End -->

											<!-- Room Pop Up Start -->
											<div aria-hidden="true" aria-labelledby="myModalLabel"
												role="dialog" tabindex="-1" id="roomaddupdatemodal"
												class="modal fade" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-label="Close" data-dismiss="modal"
																class="close" type="button">
																<span aria-hidden="true"></span>
															</button>
															<h4 id="myModalLabel" class="modal-title">Edit Rooms</h4>
														</div>
														<div class="modal-body">
															<div class="box box-primary">
																<div class="box-header">
																	<h3 class="box-title">Rooms</h3>
																</div>
																<!-- /.box-header -->
																<!-- form start -->
																<div style="float: none;" class="col-md-12">
																	<form class="form-horizontal" name="roomForm"
																		novalidate>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3"># of Rooms</label>
																			<div class="col-sm-9">
																				<input type="number" placeholder="# of Rooms"
																					id="inputPassword3" class="form-control"
																					name="noOfRooms" ng-model="newroom.noOfRooms"
																					required> <span style="color: red"
																					ng-show="roomForm.noOfRooms.$dirty && roomForm.noOfRooms.$invalid && roomForm.roomFormSubmitted">
																					<span ng-show="roomForm.noOfRooms.$error.required">NoOfRooms
																						is required.</span> <span
																					ng-show="roomForm.noOfRooms.$error.number">Not
																						Valid Number!</span>
																				</span>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Name</label>
																			<div class="col-sm-9">
																				<input type="text" placeholder="Name"
																					id="inputPassword3" class="form-control"
																					ng-model="newroom.roomName" name="roomName"
																					required> <span style="color: red"
																					ng-show="roomForm.roomName.$dirty && roomForm.roomName.$invalid && roomForm.roomFormSubmitted">
																					<span ng-show="roomForm.roomName.$error.required">Room
																						Name is required.</span>
																				</span>
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-sm-3 control-label"
																				for="inputEmail3">Start Number</label>
																			<div class="col-sm-9">
																				<input type="number" placeholder="Start Number"
																					id="inputPassword3" class="form-control"
																					name="startNumber" ng-model="newroom.startNumber"
																					required> <span style="color: red"
																					ng-show="roomForm.startNumber.$dirty && roomForm.startNumber.$invalid && roomForm.roomFormSubmitted">
																					<span
																					ng-show="roomForm.startNumber.$error.required">Start
																						Number is required.</span> <span
																					ng-show="roomForm.startNumber.$error.number">Not
																						Valid Number!</span>
																				</span>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button class="btn btn-primary" type="button"
																				ng-click="submitRooms()">
																				<i class="fa fa-fw fa-thumbs-up"></i> Submit
																			</button>
																			<button data-dismiss="modal" class="btn btn-danger"
																				type="button">
																				<i class="fa fa-close"></i> cancel
																			</button>
																		</div>
																	</form>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- Room Pop Up End -->

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
	<!-- Creates the bootstrap modal where the image will appear -->
	<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>Image preview</b>
					</h4>
				</div>
				<div class="modal-body">
					<img src="" id="imagepreview" style="width: 574px; height: 400px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>

