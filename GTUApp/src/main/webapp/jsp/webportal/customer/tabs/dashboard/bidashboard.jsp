
<%@page import="com.hyginex.utilities.HyginexUtils"%>
<body class="skin-blue" ng-controller="dashboardtabcontroller">
	<div class="wrapper">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">


			<!--  include cssCharts.css -->
			<!-- Content Header (Page header) -->
			<section class="content-header dashboard-hospital-header">
				<div class="row">

					<div class="col-xs-12">
						<div role="tabpanel" class="nav-tabs-custom">
							<jsp:include page="../tabsmenu.jsp">
								<jsp:param name="page" value="dashboard"></jsp:param>
							</jsp:include>
							<div class="tab-content">
								<div id="dashboardtab" class="tab-pane active">
									<div class="boxuserupdate" id="container2">
										<div class="box box-grey box-primary">
											
											<div class="dataTables_wrapper form-inline">
												
													<!--  <h1>State of California Medical Center</h1>-->
												
													<script>
														/* 
															jQuery( "#spanCombo" ).click(function() {
																
																// alert ('coming in jQuery'); 
																
																  jQuery( "#units" ).trigger( "click" );
																  
																});
														 */
													</script>


													<div class="select-unit">
														<select id="units" class="form-control" name="unitIds"
															ng-model="unitIds"
															ng-options="item.unitid as item.unitname for item in listUnitIds">
															<option value="">Select Unit</option>
															<%-- <option value = "0">Hospital1</option> --%>
														</select> <span id="spanCombo" class="caret"
															style="margin-left: -15px;"></span>




														<%-- <select class="form-control" ng-model="unitIds1" >
									                        <option value="-1">Select Unit</option>
									                        <option value = "0">Hospital</option>
									                        <option value = "1">Unit 1</option>
									                    </select> --%>


														<div class="datepicker-box">

															<input class="datepicker" data-date-format="mm/d/yyyy"
																name="endDate" ng-model="endDate">

															<script type="text/javascript">
																$('.datepicker')
																		.datepicker();
															</script>

															<!--  input type="text" class="datepicker-on" name="startDate" value="04/01/15" ng-model="startDate">  -->
															<!--  input type="text" class="datepicker-on" name="endDate" value="05/01/15" ng-model="endDate">  -->

														</div>



														<div class="dates">

															<input type="hidden" name="dateType" id="myDateType"
																ng-model="dateType"> <a
																ng-class="{ 'datesselected': 'D' == dateType }"
																ng-click="selectDateType('D')" href="">Day</a> <a
																ng-class="{ 'datesselected': 'W' == dateType }"
																ng-click="selectDateType('W')" href="">Week</a> <a
																ng-class="{ 'datesselected': 'M' == dateType }"
																ng-click="selectDateType('M')" href="">Month</a> <a
																ng-class="{ 'datesselected': 'Y' == dateType }"
																ng-click="selectDateType('Y')" href="">Year</a>



														</div>
														<button ng-click="submit()">Submit</button>

													</div>
												</div>

											</div>
			


			<!-- Main content -->
			<div class="container line-up level2">
				
<div class="loader" data-loading ng-hide>				 
<div class="loader-inner" >
	<!--  <svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
   <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
    </svg>-->
    <img src="${pageContext.request.contextPath}/jsp/webportal/template/images/loading1.gif"  />
</div>
</div>
		
				<div class="graph-up  small-graph">
					<h3>Hospital Compliance</h3>
					
					<!--
					<canvas id="doughnutHospital" class="chart chart-doughnut"
						chart-data="hospital_data" chart-labels="hospital_labels"
						chart-legend="true" chart-series="hospital_series"
						chart-colours="hospital_colours" chart-options="hospital_options">
    				</canvas>
    				 -->

    				<canvas id="doughnutHospitalNew"></canvas>
    
    
				</div>

				<div class="graph-up big-graph">
					<!-- <h3>  Hospital Compliance  Hospital vs Unit Compliance  </h3> -->
					<canvas id="lineUnit" class="chart chart-line"
						chart-data="unit_data" chart-labels="unit_labels"
						chart-legend="true" chart-series="unit_series"
						chart-color="unit_fillColor" chart-options="unit_options">
    </canvas>
				</div>
			</div>



			<div class="container line-down level2">


				<!-- Hiding compilance by Shift Graph
				
				<div class="graph">
					<h3>Compliance By Shift</h3>
					<canvas id="barShift" class="chart chart-bar"
						chart-data="shift_data" chart-labels="shift_labels"
						chart-options="shift_options">
    				</canvas>
				</div>
				
				 -->

				<div class="graph">
					<h3>Compliance By Profession</h3>

					<!--     
    <canvas id="barProf" class="chart chart-bar"  chart-data="prof_data" chart-labels="prof_labels">
    </canvas>
   -->

					<canvas id="barProfHor" class="chart chart-bar">
    
   </canvas>


				</div>

				<!--  

				<div class="graph">
					<h3>Wash Event Types</h3>


					<canvas id="barEventHor" class="chart chart-bar">
    				</canvas>
				</div>
				
				 -->
				

				<div class="graph">
					<h3>Wash Median Types</h3>
					<canvas id="pieMedia" class="chart chart-pie"
						chart-data="media_data" chart-labels="media_labels"
						chart-legend="true" chart-series="media_series">
  </canvas>
				</div>





			</div>
			<!-- Added by Vinit Vyas -->
			<div class="col-md-12 line-down level1">
				<div class="row">
					<!-- cod for first table  -->
					<div class="col-md-6">
					<div class="panel panel-info">
					  <div class="panel-heading">TOP 5 UNITS</div>
					  <div class="panel-body">
					  	<div style="background-color:rgba(255,255,0,0.2);padding:15px" ng-hide="unitObj">
							Data Not Available
						</div>
						<div class="table-responsive" ng-if="unitObj">
						  <table class="table table-striped">
						  	<tr>
						  		<th>Name</th>
						  		<th>compliance</th>
						  	</tr>
						    <tr ng-repeat="model in unitObj | orderBy:'-unitComplience' ">
						  		<td>{{model.unitName}}</td>
						  		<td>{{model.unitComplience}}</td>
						  	</tr>
						  </table>
						</div>
					</div>
					</div>
					</div>
					<!-- code for first table  -->
					
					<div class="col-md-6">
					<div class="panel panel-info">
					  <div class="panel-heading">TOP 5 PERFORMARS</div>
					  <div class="panel-body">
					  		<div style="background-color:rgba(255,255,0,0.2);padding:15px" ng-hide="leaderBoards">
								Data Not Available
							</div>
							<div class="table-responsive" ng-if="leaderBoards">
							  <table class="table table-striped">
							  	<tr>
							  		<th>Name</th>
							  		<th>compliance</th>
							  	</tr>
							    <tr ng-repeat="model in leaderBoards ">
							  		<td>{{model.name}}</td>
							  		<td>{{model.pc}}</td>
							  	</tr>
							  	 
							  </table>
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
	<!-- /.content-wrapper -->
	</section>
	</div>
	</div>
</body>
