
<body class="skin-blue" ng-controller="dashboardtabcontrollerLevel1">
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
											<!-- <div class="box-header">
												<h3 class="box-title">Dashboard  for Level I&nbsp;</h3>
											</div>-->
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
			


			<!-- Main content -->
			<div class="col-md-12 line-up level1">
				<div class="row">

					<div class="col-sm-4">
							<div class="graph-up  small-graph">
								<h3>Total # of hand Hygiene Events</h3>						
								<canvas id="donutchart"></canvas>
							</div>
					</div>
					
					<div class="col-sm-8">
						<div class="graph-up big-graph">
							<!-- <h3>  Hospital Compliance  Hospital vs Unit Compliance  </h3> -->
							<!-- <canvas id="lineUnit" class="chart chart-line"
									chart-data="unit_data" chart-labels="unit_labels"
									chart-legend="true" chart-series="unit_series"
									chart-color="unit_fillColor" chart-options="unit_options">
			   					 </canvas>-->
			   					<canvas id="linechart"></canvas>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-12 line-down level1">
				<div class="row">
					<div class="col-sm-8">
					<div class="graph">
						<h3>Dispenser User Per Hour</h3>					
						<canvas id="barProfHor" class="chart chart-bar"></canvas>
					</div>
					</div>
	
					<div class="col-sm-4">
						<div class="graph">
							<h3>Wash Medium Types</h3>
							<canvas id="pie-chart-area"/></canvas>
							<div id="piechart"></div>
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
