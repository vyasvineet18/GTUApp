<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/webportal/template/plugins/datatables/dataTables.bootstrap.css">


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
								<td>{{college.collegeId}}</td>
								<td>{{college.name}}</td>
								<td>{{college.city}}</td>
								<td>{{college.pincode}}</td>
								<td><a href="http://{{college.website}}" target="_blank">{{college.website}}</a></td>
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
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>