

hyginexApp.controller('dashboardtabcontrollerLevel1',function($scope ,bidashboardServiceL1,$routeParams){

	// alert ('coming');
	$scope.title="Dashboard";
	$scope.dateType = 'D';
	// $scope.endDate = '07/11/2015';
	$scope.cusId = $routeParams.customerid;
	$scope.unitIds = '-1';
	
	
	// Get Today's Date
	
	var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
    var today = mm+'/'+dd+'/'+yyyy;
	
	
    $scope.endDate = today;
		
    
    
  //code to fetch total number of units
    $scope.fetchUnitsComp = function() {

      	//  $scope.dateType = 'Y';
      	//  $scope.endDate = '09/26/2015';
      	// $scope.cusId = '8';
    		// $scope.unitIds = '';

    	bidashboardServiceL1.fetchUnitComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
                .success(function(data) {
                	
                	$scope.unit_labels = [];
                	$scope.unit_data = [];
                    	
                	
                    if (data.success && data.success === 1) {

                    		$scope.unit_xLabels = [];
	                    	$scope.unit_names = [];
	                    	$scope.unit_yData = [];
	                    	
	                    	
	                    	// for loop for data of line graph 
	                    	for (index = 0; index < data.data.length; index++) {

	                    	  // $scope.unit_labels = ["January", "February", "March", "April", "May", "June", "July"];
	                    	  // $scope.unit_series = ['Hospital', 'ICU'];
	                    		
	                    		$scope.unit_names[index] = data.data[index].name;
	                    		
	                    		// console.log('name:' + data.data[index].name ) ;
	                    		// console.log('lst lenght' + data.data[index].lst.length );
	                    		var test=0;
	                    		$scope.max = 0;
	                    		for (i=0; i < data.data[index].lst.length; i++){
	                    			
	                    			// console.log( 'index: ' + index  +   'i:' + i + ' name:' + data.data[index].lst[i].name + ' pc:' + data.data[index].lst[i].pcchw ); 
	                    			$scope.unit_xLabels[i] = data.data[index].lst[i].name;
	                    			
	                    			// console.log(" unit lable set") ;
	                    			if(!$scope.unit_yData[index])
	                    				$scope.unit_yData[index] = [];
	                    			
	                    			$scope.unit_yData[index][i] = data.data[index].lst[i].total;
	                    			
	                    		}
	                    		
	                    		//added by vinit vyas for top 5 units in dashboard level 2
	                    		//var topUnitComplience = '{"unitName":"'+$scope.unit_series[index]+'","unitComplience":"'+ $scope.unit_data[index].max() +'%"}';
	                    		//$scope.unitObj[index] =JSON.parse(topUnitComplience);
	                    		
	                    		
	                    		// data.data[index].lst.length;
	                    	    // $scope.unit_data[0][index] = data.data[index].pcchw;
	                    		
	                    } // outer for
	                    	
	                   /*Function to get data for Line data chart. */ 	
	                    	function getLineData(){
	                    		   var jsonUnit = "";
	                    		   var label="";
	               				   var fillColor = "";
	               				   var strokeColor = "";
	               				   var pointColor = "";
	               				   var pointStrokeColor = "#fff";
	               				   var pointHighlightFill = "#fff";
	               				   var pointHighlightStroke = "";
	               					data : 
	                    		   for(var i=0; i<$scope.unit_yData.length;i++){
	                    			   label=$scope.unit_names[i];
	                    			   switch(i%5) {
		                    			    case 0:
		                    			        fillColor = "rgba(220,220,220,0.2)";
		                    			        strokeColor = "rgba(220,220,220,1)";
		                    			        pointColor = "rgba(220,220,220,1)";
		                    			        pointStrokeColor = "#fff";
		                    			        pointHighlightFill = "#fff";
		                    			        pointHighlightStroke = "rgba(220,220,220,1)";
		                    			        break;
		                    			    case 1:
		                    			    	fillColor = "rgba(169,152,142,0.2)";
		                    			        strokeColor = "rgba(215,203,209,1)";
		                    			        pointColor = "rgba(230,210,222,1)";
		                    			        pointStrokeColor = "#fff";
		                    			        pointHighlightFill = "#fff";
		                    			        pointHighlightStroke = "rgba(220,220,220,1)";
		                    			        break;
		                    			    case 2:
		                    			    	fillColor = "rgba(050,125,100,0.2)";
		                    			        strokeColor = "rgba(125,220,025,1)";
		                    			        pointColor = "rgba(036,201,119,1)";
		                    			        pointStrokeColor = "#fff";
		                    			        pointHighlightFill = "#fff";
		                    			        pointHighlightStroke = "rgba(220,220,220,1)";
		                    			        break;
		                    			    case 3:
		                    			    	fillColor = "rgba(025,082,112,0.2)";
		                    			        strokeColor = "rgba(220,220,220,1)";
		                    			        pointColor = "rgba(220,220,220,1)";
		                    			        pointStrokeColor = "#fff";
		                    			        pointHighlightFill = "#fff";
		                    			        pointHighlightStroke = "rgba(220,220,220,1)";
		                    			        break;
		                    			    default:
		                    			    	fillColor = "rgba(255,255,0,0.2)";
		                    			        strokeColor = "rgba(220,220,220,1)";
		                    			        pointColor = "rgba(220,220,220,1)";
		                    			        pointStrokeColor = "#fff";
		                    			        pointHighlightFill = "#fff";
		                    			        pointHighlightStroke = "rgba(220,220,220,1)";
		                    			}
	                    			   if($scope.unit_yData.length==1){
	                    				   jsonUnit = "["+jsonUnit + JSON.stringify({"data":$scope.unit_yData[i],"label":label,"fillColor":fillColor,"strokeColor":strokeColor,"pointColor":pointColor,"pointStrokeColor":pointStrokeColor,"pointHighlightFill":pointHighlightFill,"pointHighlightStroke":pointHighlightStroke}) + "]";
	                    				   break;
	                    			   }
	                    			   if(i==0){
	                    				   jsonUnit = "["+jsonUnit + JSON.stringify({"data":$scope.unit_yData[i],"label":label,"fillColor":fillColor,"strokeColor":strokeColor,"pointColor":pointColor,"pointStrokeColor":pointStrokeColor,"pointHighlightFill":pointHighlightFill,"pointHighlightStroke":pointHighlightStroke});
	                    			   }
	                    			   if(i>0 && i<$scope.unit_yData.length-1){
	                    				   jsonUnit = jsonUnit+"," +  JSON.stringify({"data":$scope.unit_yData[i],"label":label,"fillColor":fillColor,"strokeColor":strokeColor,"pointColor":pointColor,"pointStrokeColor":pointStrokeColor,"pointHighlightFill":pointHighlightFill,"pointHighlightStroke":pointHighlightStroke});
	                    			   }
	                    			   if(i==$scope.unit_yData.length-1){
	                    				   jsonUnit = jsonUnit +"," +  JSON.stringify({"data":$scope.unit_yData[i],"label":label,"fillColor":fillColor,"strokeColor":strokeColor,"pointColor":pointColor,"pointStrokeColor":pointStrokeColor,"pointHighlightFill":pointHighlightFill,"pointHighlightStroke":pointHighlightStroke})+"]";
	                    			   }
	                    		   }
	                    		   return JSON.parse(jsonUnit);
	                    	   }	
	                    	/*End of function for line chart data. */ 	
	                    	
	                    	/*start line chart*/
	                		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
	                		var lineChartData = {
	                			labels : $scope.unit_xLabels,
	                			datasets : getLineData()   //get data from the function getLineData

	                		}

	                	
	                		var ctx = document.getElementById("linechart").getContext("2d");
	                		window.myLine = new Chart(ctx).Line(lineChartData, {
	                			responsive: true
	                		});
	                		/*end line chart*/	  	
	                		
	                	//loop to get data for doughnut chart	
                    	for(unitInd=0 ; unitInd<data.data.length; unitInd++){
                    		$scope.unit_labels[unitInd] = data.data[unitInd].name;
                    		var totalFinal = 0;
    	                	for (index = 0; index < data.data[unitInd].lst.length; index++) {
    	    	
    	                		 totalFinal = totalFinal +  data.data[unitInd].lst[index].total;
    	
    	                    }
    	                	$scope.unit_data[unitInd] =  parseInt(totalFinal);
                    	}//End For loop
                    
                    	//starting of donut chart
                    	/*start donutchart*/
                        $( document ).ready(function() {
                    	    Chart.types.Doughnut.extend({
                    	        name: "DoughnutTextInside",
                    	        showTooltip: function() {
                    	            this.chart.ctx.save();
                    	            Chart.types.Doughnut.prototype.showTooltip.apply(this, arguments);
                    	            this.chart.ctx.restore();
                    	        },
                    	        draw: function() {
                    	            Chart.types.Doughnut.prototype.draw.apply(this, arguments);

                    	            var width = this.chart.width,
                    	                height = this.chart.height;

                    	            var fontSize = (height / 114).toFixed(2);
                    	            this.chart.ctx.font = fontSize + "em Verdana";
                    	            this.chart.ctx.textBaseline = "middle";

                    	            var text = getTotalData(),
                    	                textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
                    	                textY = height / 2;

                    	            this.chart.ctx.fillText(text, textX, textY);
                    	        }
                    	    });
                    	    
                        });
                        
                        /*var data=[];
                        for(var i=1; i<$scope.unit_labels.length;i++){
                        	data[i]["label"] = $scope.unit_labels[i];
                        	data[i]["value"] = $scope.unit_data[i];
                        }*/
                        var unitLabels=$scope.unit_labels;
                        var unitValues=$scope.unit_data;
                        unitLabels.shift();
                        unitValues.shift();
                    	   
                       /* function (adaptor) for chart   */ 
                    	 function getDoughnutData(){
                    		   var jsonUnit = "";
                    		   var color ="";
                    		   for(var i=0; i<unitValues.length;i++){
                    			   switch(i%5) {
	                    			    case 0:
	                    			        color = "#64D899";
	                    			        break;
	                    			    case 1:
	                    			    	color = "#949FB1";
	                    			        break;
	                    			    case 2:
	                    			    	color = "#FFCE56";
	                    			        break;
	                    			    case 3:
	                    			    	color = "#F7464A";
	                    			        break;
	                    			    default:
	                    			        color = "#4D5360";
	                    			}
                    			   if(unitValues.length==1){
                    				   jsonUnit = "["+jsonUnit + JSON.stringify({"value":unitValues[i],"label":unitLabels[i],"color":color}) + "]";
                    				   break;
                    			   }
                    			   if(i==0){
                    				   jsonUnit = "["+jsonUnit + JSON.stringify({"value":unitValues[i],"label":unitLabels[i],"color":color});
                    			   }
                    			   if(i>0 && i<unitValues.length-1){
                    				   jsonUnit = jsonUnit+"," +  JSON.stringify({"value":unitValues[i],"label":unitLabels[i],"color":color});
                    			   }
                    			   if(i==unitValues.length-1){
                    				   jsonUnit = jsonUnit +"," +  JSON.stringify({"value":unitValues[i],"label":unitLabels[i],"color":color})+"]";
                    			   }
                    		   }
                    		   return JSON.parse(jsonUnit);
                    	   }
                    	 	/*function to get sum of all unit totals*/
	                    	 function getTotalData(){
	                    		 var totalUnitData = 0;
	                    		 for (var i=0; i<unitValues.length;i++){
	                    			 totalUnitData += unitValues[i]; 
	                    		 }
	                    		 return totalUnitData;
	                    	 }
	                       var data = getDoughnutData();
                    		   
                    	   console.log(data);
                    	    var DoughnutTextInsideChart = new Chart($('#donutchart')[0].getContext('2d')).DoughnutTextInside(data, {
                    	        responsive: true
                    	    });

                    /*end donutchart*/
                    	//end of donut chart
                    	
                    	
                    	console.log("Checkkk : "+$scope.unit_labels);
                    	console.log("Checkkk : " + $scope.unit_data);
                    }
                });
    };
    /*End of function for total unitsComplience donut graph graph.*/
    
    /* Starting of media complience graph function */
    $scope.fetchMediaComp = function() {
    	
    	bidashboardServiceL1.fetchMediaComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
        .success(function(data) {
        	$scope.media_labels = [];
        	$scope.media_data = [];
            	
            if (data.success && data.success === 1) {
            	
            	for(mediaInd=0 ; mediaInd<data.data.length; mediaInd++){
            		$scope.media_labels[mediaInd] = data.data[mediaInd].name;
                	$scope.media_data[mediaInd] =  data.data[mediaInd].total;
            	}
            	
            	
            	var mediaLabels=$scope.media_labels;
                var mediaValues=$scope.media_data;
            	
            	/* function (adaptor) for chart   */ 
	           	 function getPieData(){
	           		   var jsonUnit = "";
	           		   var color ="";
	           		   var highlight="";
	           		
	           		   for(var i=0; i<mediaValues.length;i++){
	           			   switch(i%5) {
	               			    case 0:
	               			        color = "#4EC3E4";
	               			        highlight = "#4EC3E4";
	               			        break;
	               			    case 1:
	               			    	color = "#65D99A";
	               			    	highlight = "#65D99A";
	               			        break;
	               			    case 2:
	               			    	color = "#FFCE56";
	               			    	highlight = "#FFCE56";
	               			        break;
	               			    case 3:
	               			    	color = "#F7464A";
	               			    	highlight = "#F7464A";
	               			        break;
	               			    default:
	               			        color = "#4D5360";
	               			}
	           			   if(mediaValues.length==1){
	           				   jsonUnit = "["+jsonUnit + JSON.stringify({"value":mediaValues[i],"label":mediaLabels[i],"color":color,"highlight":highlight}) + "]";
	           				   break;
	           			   }
	           			   if(i==0){
	           				   jsonUnit = "["+jsonUnit + JSON.stringify({"value":mediaValues[i],"label":mediaLabels[i],"color":color,"highlight":highlight});
	           			   }
	           			   if(i>0 && i<mediaValues.length-1){
	           				   jsonUnit = jsonUnit+"," +  JSON.stringify({"value":mediaValues[i],"label":mediaLabels[i],"color":color,"highlight":highlight});
	           			   }
	           			   if(i==mediaValues.length-1){
	           				   jsonUnit = jsonUnit +"," +  JSON.stringify({"value":mediaValues[i],"label":mediaLabels[i],"color":color,"highlight":highlight})+"]";
	           			   }
	           		   }
	           		   return JSON.parse(jsonUnit);
	           	   }
	           	  var pieData = getPieData();
	           // start jquery code for pie chart
            	$( document ).ready(function() {
            		var pie_ctx = document.getElementById("pie-chart-area").getContext("2d");
            		    window.myPie = new Chart(pie_ctx).Pie(pieData, {
            		        legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
            		    });
            		
            		var legend = myPie.generateLegend();
            		$("#piechart").html(legend);

            	});
            	debugger;
            	// end jquery code for pie chart
            }
        });
    };
    /*End of function for media complience */
    
    
    
    
    /*	  // Media  Types
	  $scope.event_labels = ['before', 'after'];
	  $scope.series = ['Series A'];

	  $scope.event_data = [
	    [45 , 15]
	  ];*/

		
 // charts script start
	  
  


	    
	    
  


		
/**area chart**/
		var barProfHordata = {
			    labels: ["January"],
			    datasets: [
			        {
			        	
			            label: "My First dataset",
			            fillColor: "#F5CC63",
			            
			            data: [50]
			        }
			    ]
			};
		
		$( document ).ready(function() {
			  var ctx = document.getElementById("barProfHor").getContext("2d");
			  var horizontalBarChart = new Chart(ctx).HorizontalBar(barProfHordata, {
				    barShowStroke: false
			   } );
		});
/*end area chart*/		   
		
		
		
		



/*	  // Media  Types
$scope.event_labels = ['before', 'after'];
$scope.series = ['Series A'];

$scope.event_data = [
  [45 , 15]
];*/

	$scope.submit = function() {
			
			// alert ('comign in submit');

			//$scope.fetchHospitalComp();
			//$scope.fetchUnitComp();
			// $scope.fetchShiftComp();
			//$scope.fetchProfComp();
			// $scope.fetchEventComp();
			//$scope.fetchMediaComp();
		
			// alert ('all hits done');
			$scope.fetchUnitsComp();
			$scope.fetchMediaComp();
    };

    
    $scope.selectDateType = function(myVar) {
			 // alert ('comign in selectDateType');
			 $scope.dateType = myVar;

    };


		  
$scope.loadUnits = function() {

  	//  $scope.dateType = 'Y';
  	//  $scope.endDate = '09/26/2015';
  	// $scope.unitIds = '';
  	// $scope.cusId = '8';

	 // alert('co,mimg in load unitx func');

	bidashboardServiceL1.loadUnits($scope.cusId)
            .success(function(data) {
                if (data.success && data.success === 1) {

                	// alert('loadedUnits' + data);

                	$scope.listUnitIds = data.data;

                }
            });
};



// $scope.fetchHospitalComp();
// $scope.fetchShiftComp();
// $scope.fetchProfComp();
// $scope.fetchEventComp();
// $scope.fetchMediaComp();

// alert('coming in controller');
$scope.fetchUnitsComp();
$scope.loadUnits();
$scope.submit();


// alert('before init');
// $scope.init();
// alert('coming1');


});







hyginexApp.service('bidashboardServiceL1', function($http) {
    return {
        fetchHospitalComp: function(cusId, toDate, dateType) {

        	console.log('calling Shift http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate  ) ;

        	return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType },
                url: '/app/rest/dashboard/hoscompliance/' + cusId
                // http://localhost:8080/app/rest//dashboard/hoscompliance/8?toDate=09/26/2015&dateType=Y
            });
        },


       /* fetchUnitComp: function(cusId, toDate, dateType, unitId) {

          console.log('calling UnitCOmp http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate  + ' unitId:' + unitId ) ;

          if (typeof unitId === 'undefined')
      		{
      		console.log('unitId is undefined');
      		unitId = '';
      	}
          
          return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                url: '/app/rest/dashboard/unitcompliance/' + cusId
                // http://localhost:8080/app/rest//dashboard/hoscompliance/8?toDate=09/26/2015&dateType=Y
            });
        },*/

        /*
        fetchShiftComp: function(cusId, toDate, dateType, unitId) {

        	console.log('calling Shift http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate + ' unitId:' + unitId ) ;

        	if (typeof unitId === 'undefined')
        	{
        		console.log('unitId is undefined');
        		unitId = '';
        	}

            return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                url: '/app/rest/dashboard/shiftcompliance/' + cusId
                // headers: {'Content-Type': 'application/json'}
                // url: '/app/rest/dashboard/shiftcompliance/8' + start + '/' + limit
                // http://localhost:8080/app/rest/dashboard/shiftcompliance/8?toDate=09/26/2015&dateType=Y
            });
        },
        
        */

        fetchProfComp: function(cusId, toDate, dateType, unitId) {

        	console.log('calling Prof http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate + ' unitId:' + unitId ) ;

        	if (typeof unitId === 'undefined' || unitId == null || unitId == 'null')
        	{
        		console.log('unitId is undefined');
        		unitId = '';
        	}
        	if (unitId == '')
        		unitId = '-1';

            return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                url: '/app/rest/dashboard/profcompliance/' + cusId
                // http://localhost:8080/app/rest/dashboard/profcompliance/8?toDate=09/26/2015&dateType=Y
            });
        },

        /*
        fetchEventComp: function(cusId, toDate, dateType, unitId) {

        	console.log('calling Wash Type Event http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate + ' unitId:' + unitId ) ;

        	if (typeof unitId === 'undefined')	{
        		console.log('unitId is undefined');
        		unitId = '';
        	}

            return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                // http://localhost:8080/app/rest/dashboard/washtypecompliance/8?toDate=09/26/2015&dateType=W
                url: '/app/rest/dashboard/washtypecompliance/' + cusId
            });
        },
        */


        fetchMediaComp: function(cusId, toDate, dateType, unitId) {

        	console.log('calling Wash Type Event http: cusId' + cusId + ' dateType:' + dateType + ' toDate : ' + toDate + ' unitId:' + unitId ) ;

        	if (typeof unitId === 'undefined')	{
        		console.log('unitId is undefined');
        		unitId = '';
        	}

            return $http({
                method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                // http://localhost:8080/app/rest/dashboard/mediacompliance/8?toDate=09/26/2015&dateType=Y
                url: '/app/rest/dispenseEventsBIDashboard/mediacompliance/' + cusId
                
            });
        },
        
        fetchUnitComp:function(cusId,toDate,dateType,unitId){
        	
        	if (typeof unitId === 'undefined')	{
        		console.log('unitId is undefined');
        		unitId = '';
        	}
        	
        	return $http({
        		method: 'GET',
                params: { toDate: toDate, dateType: dateType, unitId: unitId },
                url: '/app/rest/dispenseEventsBIDashboard/unitcompliance/' + cusId
        	});
        },

        loadUnits: function(cusId) {

        	// alert ( ' coming in load units servers');

            return $http({
                method: 'GET',
                // http://localhost:8080/app/rest/unit/customerid/8/fetchunits/0/1000
                url: '/app/rest/unit/customerid/' + cusId + '/fetchunits/0/1000'
            });
        },


        deleteHospital: function(id) {
            return $http({
                method: 'POST',
                url: '/app/rest/customer/customerid/' + id + '/deletecustomer',
                headers: {'Content-Type': 'application/json'}
            });
        }
    };
});
