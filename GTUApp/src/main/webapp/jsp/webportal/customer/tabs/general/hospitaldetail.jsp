
<script language="javascript" type="text/javascript">
	$(function() {
		$("#fileupload")
				.change(
						function() {
							if (typeof (FileReader) != "undefined") {
								var dvPreview = $("#dvPreview");
								dvPreview.html("");
								var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
								$($(this)[0].files)
										.each(
												function() {
													var file = $(this);
													if (regex.test(file[0].name
															.toLowerCase())) {
														var reader = new FileReader();
														reader.onload = function(
																e) {
															var img = $("<img />");
															img
																	.attr(
																			"style",
																			"height:100px;width: 100px");
															img
																	.attr(
																			"src",
																			e.target.result);
															dvPreview
																	.append(img);
														}
														reader
																.readAsDataURL(file[0]);
													} else {
														alert(file[0].name
																+ " is not a valid image file.");
														dvPreview.html("");
														return false;
													}
												});
							} else {
								alert("This browser does not support HTML5 FileReader.");
							}
						});
	});
</script>
</head>
<body class="skin-blue" ng-controller="hospitaldetailController">
	<div class="wrapper">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div role="tabpanel" class="nav-tabs-custom">
							<jsp:include page="../tabsmenu.jsp">
								<jsp:param name="page" value="general"></jsp:param>
							</jsp:include>
							<div class="tab-content">
								<!--<div id="summary" class="tab-pane active">
                                                              Summary Content
                                                          </div>-->
								<div id="header_general" class="tab-pane active">
									<div class="boxuserupdate">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">General Information</h3>
												<div class="button-top">
													<button type="submit" class="btn btn-primary"
														ng-click="updateGeneralInfo()">
														<i class="fa fa-fw fa-thumbs-up"></i> Submit
													</button>
													<button type="submit" class="btn btn-danger"
														ng-click="clearGeneralInfo()">
														<i class="fa fa-close"></i> Clear
													</button>
												</div>
											</div>
											<!-- /.box-header -->
											<!-- form start -->
											<div style="float: none;" class="col-md-12">
												<form class="form-horizontal" name="generalinfoform"
													novalidate>
													<!--                                                    <div class="form-group">
                                                                                                            <label class="col-sm-3 control-label" for="inputEmail3">ID</label>
                                                                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                                                                        </div>-->
													<div class="form-group even">
														<label class="col-sm-3 control-label" for="inputPassword3">Name</label>
														<div class="col-sm-9">
															<input type="text" ng-model="customerData.name"
																placeholder="Name" id="name" class="form-control"
																name="name" required hospitalname-unique> <span
																style="color: red"
																ng-show="generalinfoform.name.$invalid && generalinfoform.generalinfoFormSubmitted">
																<span ng-show="generalinfoform.name.$error.required">Hospital
																	Name is required.</span> <span
																ng-show="generalinfoform.name.$error.unique">Customer
																	Name already exists, try with different.</span>
															</span>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="inputPassword3">Plan</label>
														<div class="col-sm-9">
															<!--  <input type="text" ng-model="customerData.plan"
																placeholder="Plan" id="plan" class="form-control">-->
															<select id="plan" class="form-control"
																ng-model="customerData.plan">
																<option ng-repeat="item in planArray"
																	value="{{item.name}}">{{item.name}}</option>

															</select>

														</div>

													</div>
													<div class="form-group even">
														<label class="col-sm-3 control-label" for="inputPassword3">Time Zone</label>

														<div class="col-sm-9">
															<select class="form-control" id="timezone"
																ng-model="customerData.timezone">
																<option ng-repeat="item in timezoneArray"
																	value="{{item.name}}">{{item.name}}</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="inputPassword3">Rub Threshold</label>

														<div class="col-sm-9">
															<input type="number"
																ng-model="customerData.rubthreshold"
																id="rubthreshold" name="rubthreshold" class="form-control" min=0 max=10000>
															
														</div>
													</div>
													
													<div class="form-group even"
														ng-if="customerData.plan=='Level II' || !customerData.plan">
														<label class="col-sm-3 control-label" for="inputPassword3">WashOpportunity</label>
														<div class="col-sm-9">
															<input type="number"
																ng-model="customerData.washOpportunity"
																id="washOpportunity" name="washOpportunity" class="form-control" min=0 max=10000 required>
															<span ng-show="generalinfoform.washOpportunity.$error.required">Wash Opportunity is required.</span>
														</div>

													</div>
												</form>
											</div>
										</div>
										<!-- /.box -->

									</div>

									<!-- Customer Address forum start -->
									<div class="boxuserupdate">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">Address</h3>
												<div class="button-top">
													<button type="submit" class="btn btn-primary"
														ng-click="updateAddressInfo()"
														ng-disabled="disableAddressInfoSubmit">
														<i class="fa fa-fw fa-thumbs-up"></i> Submit
													</button>
													<button type="submit" class="btn btn-danger"
														ng-click="clearAddressInfo()">
														<i class="fa fa-close"></i> Clear
													</button>
												</div>
											</div>
											<!-- /.box-header -->
											<!-- form start -->
											<div style="float: none;" class="col-md-12">
												<form class="form-horizontal" name="hospitaladdressform"
													novalidate="">
													<div class="form-group ">
														<label class="col-sm-3 control-label" for="inputPassword3">Address</label>
														<div class="col-sm-9" ng-if="showAddress">
															<div liveaddress token="token" ng-model="address"
																input-class="{inputbox:true}"
																on-callback="validateAddress(addressresponse)"
																inputaddress="customerData.address.fullAddress"></div>
															<span style="color: red" ng-show="invalidAddress">
																Address is not valid, try with different one </span>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- /.box -->
									</div>
									<!-- Customer Address forum end -->

									<!-- contact  grid star -->
									<div class="boxuserupdate">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">
													Contact &nbsp;<a data-placement="top" data-toggle="modal"
														ng-click="openContactModal()" data-toggle="tooltip"
														data-original-title="Add User"
														class="btn btn-success btn-sm"><i class="fa fa-plus"></i>
													</a>
												</h3>
											</div>
											<div class="dataTables_wrapper form-inline">
												<table class="table table-hover" id="example1">
													<thead>
														<th>Name</th>
														<th>Email</th>
														<th>Department</th>
														<th></th>
														</tr>
													</thead>

													<tbody>
														<tr ng-repeat="item in contactData">
															<td style="width: 33%;" ng-bind="item.contactname"></td>
															<td><a href="mailto:John@gmail.com"><span
																	style="width: 33%;" ng-bind="item.email"></span></a></td>
															<td ng-bind="item.department"></td>
															<td class="text-right"><span data-toggle="modal"
																data-target="#Deletenotice"> <a
																	data-placement="top" data-toggle="modal"
																	data-original-title="View"
																	ng-click="viewContactModal(item)"
																	class="btn btn-primary btn-xs"
																	href="javascript:void(0);"> <i class="fa fa-eye"></i>
																</a>
															</span> <a class="btn btn-success btn-xs"
																data-original-title="Edit" data-toggle="modal"
																ng-click="updateContact(item)"> <i
																	class="fa fa-edit"></i>
															</a> <span ng-click="deleteContact(item)" data-toggle="modal"
																data-target="#Deletenotice"> <a
																	href="javascript:void(0);"
																	class="btn btn-danger btn-xs"
																	data-original-title="Delete" data-toggle="tooltip"
																	data-placement="top"> <i class="fa fa-trash"></i>
																</a>
															</span></td>
														</tr>
													</tbody>
												</table>
											</div>

											<div class="row">
												<div class="col-xs-6">
													<div class="dataTables_info" id="example1_info">Showing
														{{paginationObject.totalRecords == 0 ? 0 :
														paginationObject.start+1}} to
														{{paginationObject.totalRecords <
														paginationObject.start+paginationObject.limit ?
														paginationObject.totalRecords :
														paginationObject.start+paginationObject.limit}} of
														{{paginationObject.totalRecords}} entries</div>
												</div>
												<div class="col-xs-6">
													<div class="dataTables_paginate paging_bootstrap"
														ng-if="isDataLoaded">
														<div pagination on-navigate="fetchThroughPagination()"
															pagination-object="paginationObject"></div>
													</div>
												</div>
											</div>
											<!-- pop up -->
											<!-- Button trigger modal -->
											<!-- Modal Add Hospital List -->
											<div class="modal fade" id="addupdatecontactmodal"
												tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title" id="myModalLabel"
																ng-bind="newcontact.contacttitle"></h4>
														</div>
														<div class="modal-body">
															<form class="form-horizontal">
																<div class="box box-primary">
																	<div class="box-header">
																		<h3 class="box-title">Contact Detail</h3>
																	</div>
																	<!-- /.box-header -->
																	<!-- form start -->
																	<div class="col-md-12" style="float: none;">

																		<div class="form-group"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label for="inputEmail3"
																				class="col-sm-3 control-label"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Name</label>
																			<div class="col-sm-9">
																				<input type="Name" class="form-control"
																					id="inputPassword3" placeholder="Name"
																					ng-model="newcontact.name">
																			</div>
																		</div>
																		<div class="form-group even"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label for="inputPassword3"
																				class="col-sm-3 control-label"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Email</label>
																			<div class="col-sm-9">
																				<input type="Email" class="form-control"
																					id="inputPassword3" placeholder="Email"
																					ng-model="newcontact.email">
																			</div>
																		</div>
																		<div class="form-group"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label class="col-sm-3 control-label"
																				for="inputPassword3"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Contact
																				Type</label>
																			<div class="col-sm-9">
																				<select class="form-control"
																					ng-model="newcontact.type">
																					<option ng-repeat="item in contacttypeArray"
																						value="{{item.id}}">{{item.name}}</option>
																				</select>
																			</div>
																		</div>
																		<div class="form-group even"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label for="inputPassword3"
																				class="col-sm-3 control-label"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Fax</label>
																			<div class="col-sm-9">
																				<input type="text" data-mask=""
																					data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
																					class="form-control" ng-model="newcontact.fax">
																			</div>
																		</div>
																		<div class="form-group"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label for="inputPassword3"
																				class="col-sm-3 control-label"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Phone
																				Number</label>
																			<div class="col-sm-9">
																				<input type="text" data-mask=""
																					data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
																					class="form-control" ng-model="newcontact.phone">
																			</div>
																		</div>
																		<div class="form-group even"
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label for="inputPassword3"
																				class="col-sm-3 control-label"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Alternate
																				Phone Number</label>
																			<div class="col-sm-9">
																				<input class="form-control"
																					data-inputmask="'mask': ['999-999-9999 [x99999]', '+099 99 99 9999[9]-9999']"
																					data-mask="" type="text"
																					ng-model="newcontact.landline">
																			</div>
																		</div>

																		<div class="form-group "
																			style="border-bottom: 1px solid #ddd; margin: 0;">
																			<label class="col-sm-3 control-label"
																				for="inputPassword3"
																				style="border-right: 1px solid #ddd; margin-bottom: 0; padding-bottom: 16px; padding-top: 18px; text-align: right;">Address</label>
																			<div class="col-sm-9">
																				<div liveaddress token="token"
																					ng-model="contactaddress"
																					input-class="{inputbox:true}"
																					on-callback="validateContactAddress(addressresponse)"></div>
																				<span style="color: red"
																					ng-show="invalidContactAddress"> Address is
																					not valid, try with different one </span>
																			</div>
																		</div>
																		<!--</form>-->
																	</div>
																</div>

															</form>
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary"
																ng-click="submitContact()">
																<i class="fa fa-fw fa-thumbs-up"></i> Submit
															</button>
															<button type="button" class="btn btn-danger"
																data-dismiss="modal" ng-click="resetContactVariables()">
																<i class="fa fa-close"></i> cancel
															</button>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal Add Hospital List end -->
											<!-- contact view start -->
											<div class="modal fade" id="contactviewmodal" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title" id="myModalLabel">View
																Contact</h4>
														</div>
														<div class="modal-body">
															<div>
																<div class="box box-primary">
																	<div class="box-header">
																		<h3 class="box-title">Contact Detail</h3>
																	</div>
																	<!-- /.box-header -->
																	<!-- form start -->
																	<div class="col-md-12" style="float: none;">
																		<form class="form-horizontal">
																			<div class="form-group">
																				<label for="inputEmail3"
																					class="col-sm-3 control-label">Name</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.name"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Email</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.email"></div>
																			</div>
																			<div class="form-group">
																				<label class="col-sm-3 control-label"
																					for="inputPassword3">Type</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.type"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Fax</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.fax"></div>
																			</div>
																			<div class="form-group">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Phone Number</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.phone"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Alternate
																					Phone Number</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.landline"></div>
																			</div>
																		</form>
																	</div>
																</div>
																<!-- /.box -->

															</div>
															<div>
																<div class="box box-primary">
																	<div class="box-header">
																		<h3 class="box-title">View Address Detail</h3>
																	</div>
																	<!-- form start -->
																	<div class="col-md-12" style="float: none;">
																		<form class="form-horizontal">
																			<div class="form-group">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Building
																					Number</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.buildingnumber"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Street Name</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.streetName"></div>
																			</div>
																			<div class="form-group">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Suite Number</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.suitNumber"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">City</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.city"></div>
																			</div>
																			<div class="form-group">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">State</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.state"></div>
																			</div>
																			<div class="form-group even">
																				<label for="inputPassword3"
																					class="col-sm-3 control-label">Country</label>
																				<div class="col-sm-9 user-id"
																					ng-bind="newcontact.country"></div>
																			</div>
																		</form>
																	</div>
																</div>
																<!-- /.box -->
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary">
																<i class="fa fa-fw fa-thumbs-up"></i> Submit
															</button>
															<button type="button" class="btn btn-danger"
																data-dismiss="modal" ng-click="resetContactVariables()">
																<i class="fa fa-close"></i> cancel
															</button>
														</div>
													</div>
												</div>
											</div>
											<!-- contact view end -->
										</div>
										<!-- /.box -->
									</div>
									<!-- contact grid end -->
								</div>
								<!-- user tab content -->
								<!-- user tab content end -->
							</div>
						</div>
					</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- ./wrapper -->
		<!--        <script type="text/javascript">
                        $(function() {
                            $("#example1").dataTable();
                        });
                </script> -->

		<!-- jQuery 2.1.3 -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
</body>
