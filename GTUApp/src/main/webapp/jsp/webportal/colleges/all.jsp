<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/webportal/template/plugins/datatables/dataTables.bootstrap.css">


<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Colleges <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Tables</a></li>
		<li class="active">Data tables</li>
	</ol>
</section>

<!-- Main content -->
<section class="content" ng-controller="collegeController">
	
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Hover Data Table</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="form-inline dt-bootstrap" id="example1_wrapper">
						<div class="row">
							<div class="col-sm-6">
								<div id="example1_length" class="dataTables_length">
									<label>Show <select class="form-control input-sm"
										aria-controls="example1" name="example1_length"><option
												value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option></select> entries
									</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="dataTables_filter" id="example1_filter">
									<label>Search:<input aria-controls="example1"
										placeholder="" class="form-control input-sm" type="search"></label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
							<input type="text" name ="" value="" ng-model="vinit" ng-change="getUpdate();">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>City(s)</th>
											<th>Pincode</th>
											<th>Website</th>
											<th>Contact</th>
											<th colspan="2">Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="college in collegeData">
											<td>{{college.collegeId='vinit'}}</td>
											<td>{{college.name}}</td>
											<td>{{college.city}}</td>
											<td>{{college.pincode}}</td>
											<td><a href="http://{{college.website}}" target="_blank" ng-click="getAllCollegeData();">{{college.website}}</a></td>
											<td>{{college.contact1}}</td>
											<td>edit</td>
											<td>delete</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>City(s)</th>
											<th>Pincode</th>
											<th>Website</th>
											<th>Contact</th>
											<th colspan="2">Action</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div aria-live="polite" role="status" id="example2_info"
									class="dataTables_info">Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
							</div>
							<div class="col-sm-7">
								<div id="example2_paginate"
										class="dataTables_paginate paging_simple_numbers" ng-if="isDataLoaded">
                                    <div pagination on-navigate="fetchThroughPagination()" pagination-object="paginationObject"></div>
                                </div>
                            </div>
							<!-- <div class="col-sm-7">
								<div id="example2_paginate"
									class="dataTables_paginate paging_simple_numbers">
									<ul class="pagination">
										<li id="example2_previous"
											class="paginate_button previous disabled"><a
											tabindex="0" data-dt-idx="0" aria-controls="example2"
											href="#">Previous</a></li>
										<li class="paginate_button active"><a tabindex="0"
											data-dt-idx="1" aria-controls="example2" href="#">1</a></li>
										<li class="paginate_button "><a tabindex="0"
											data-dt-idx="2" aria-controls="example2" href="#">2</a></li>
										<li class="paginate_button "><a tabindex="0"
											data-dt-idx="3" aria-controls="example2" href="#">3</a></li>
										<li class="paginate_button "><a tabindex="0"
											data-dt-idx="4" aria-controls="example2" href="#">4</a></li>
										<li class="paginate_button "><a tabindex="0"
											data-dt-idx="5" aria-controls="example2" href="#">5</a></li>
										<li class="paginate_button "><a tabindex="0"
											data-dt-idx="6" aria-controls="example2" href="#">6</a></li>
										<li id="example2_next" class="paginate_button next"><a
											tabindex="0" data-dt-idx="7" aria-controls="example2"
											href="#">Next</a></li>
									</ul>
								</div>
							</div>
 -->						</div>
					</div>

				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

</section>