

hyginexApp.controller('dashboardtabcontrollerLevel3',function($scope , bidashboardService,$routeParams){

	
	// alert ('coming');
    	$scope.title="Dashboard";

		$scope.dateType = 'D';
		$scope.endDate = '07/11/2015';
		$scope.cusId = $routeParams.customerid;
		$scope.unitIds = '-1';
      // $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
	  // $scope.series = ['Series A', 'Series B'];

	  /*$scope.data = [
	    [65, 59, 80, 81, 56, 55, 40],
	    [28, 48, 40, 19, 86, 27, 90]
	  ]; */
	  $scope.shift_labels = ['Day Shift', 'Night Shift'];
	  $scope.series = ['Series A'];

	  $scope.shift_data = [
	    [40,40]
	  ];
	  

	  $scope.shift_options = {
	    		// scaleOverride: true,
	      	   scaleLabel : "<%= value + ' % '  %>" ,
	      	   scaleOverride: true,
	      	   scaleSteps: 5,
	           scaleStepWidth: Math.ceil(100 / 5),
	           scaleStartValue: 0
	  };



	  // Profession
	 /* 
	  $scope.prof_labels = ['Tech', 'Doc', 'Nurse'];
	  $scope.series = ['Series A'];

	  $scope.prof_data = [
	    [45 , 15, 60]
	   ];
	  
*/	  
		var barProfHordata = {
			    labels: ["January"],
			    datasets: [
			        {
			        	
			            label: "My First dataset",
			            fillColor: "rgba(4,195,227,0.5)",
			            
			            data: [30]
			        }
			    ]
			};
		
	  
	  var ctx = document.getElementById("barProfHor").getContext("2d");
	  var horizontalBarChart = new Chart(ctx).HorizontalBar(barProfHordata, {
		    barShowStroke: false
	   } );



	  // Wash Event Types
	  /*$scope.event_labels = ['Transition', 'After ', 'Before '];
	  $scope.series = ['Series A'];

	  $scope.event_data = [
	    [48 ,98, 22]
	  ];*/

	/*  $scope.event_labels = ['before', 'after'];
	  $scope.series = ['Series A'];

	  $scope.event_data = [
	    [45 , 15]
	  ];*/
	  
	  
		var barEventHordata = {
			    labels: ["January"],
			    datasets: [
			        {
			        	
			            label: "My First dataset",
			            fillColor: "rgba(4,195,227,0.5)",
			            
			            data: [30]
			        }
			    ]
			};
		
	  
	  var ctx = document.getElementById("barEventHor").getContext("2d");
	  var barEventHorChart = new Chart(ctx).HorizontalBar(barEventHordata, {
		    barShowStroke: true
	   } );




    // Line Unit Compliance

  $scope.unit_labels = ["January", "February", "March", "April", "May", "June", "July"];
  $scope.unit_series = ['H', 'C'];
  $scope.unit_data = [
    [65, 59, 80, 81, 56, 55, 40],
    [28, 48, 40, 19, 86, 27, 90]
  ];
  // $scope.unit_colours = ['#ee0000'];
  // $scope.unit_getColor = ['#ee0000', 'rgba(220,220,220,1)'];

  $scope.unit_options = {
    		// scaleOverride: true,
      	   scaleLabel : "<%= value + ' % '  %>" ,
      	   scaleOverride: true,
      	   scaleSteps: 10,
           scaleStepWidth: Math.ceil(100 / 10),
           scaleStartValue: 0
  };
  
  
	    $scope.hospital_labels = ["Compliance", "Non Compliance"];
	  // $scope.hospital_series = ["Compliance", "Non Compliance"];
	  $scope.hospital_data = [25, 75];


	  // $scope.hospital_labels = ["Compliance"];
	  // $scope.hospital_series = ["Compliance"];
	  // $scope.hospital_data = [25, 75];

	  $scope.hospital_options = {
			  percentageInnerCutout: 80,
			  scaleOverride: true,
			  scaleShowLabels: false,
			  showScale: false,
			  scaleFontSize: 0
			  
	};
	  
	  

	  $scope.media_labels = ["Soap", "Alcohol"];
	  $scope.media_series = ["Soap", "Alcohol"];
	  $scope.media_data = [54, 46];
	  $scope.media_fillColor = ['#ff0000'];
	  $scope.media_strokeColor = ['#00ff00'];




 // var salesChartCanvas = $("#lineUnit").get(0).getContext("2d");
 //  var salesChart = new Chart(salesChartCanvas).Bar(data, options);

 //  salesChart data = {
 //    labels: ["January", "February", "March", "April", "May", "June", "July"],
 //    datasets: [
 //        {
 //            fillColor: "rgba(220,220,220,0.2)",
 //            strokeColor: "rgba(220,220,220,1)",
 //            pointColor: "rgba(220,220,220,1)",
 //            pointStrokeColor: "#fff",
 //            pointHighlightFill: "#fff",
 //            pointHighlightStroke: "rgba(220,220,220,1)",
 //            data: [65, 59, 80, 81, 56, 55, 40]
 //        },
 //        {
 //            fillColor: "rgba(151,187,205,0.2)",
 //            strokeColor: "rgba(151,187,205,1)",
 //            pointColor: "rgba(151,187,205,1)",
 //            pointStrokeColor: "#fff",
 //            pointHighlightFill: "#fff",
 //            pointHighlightStroke: "rgba(151,187,205,1)",
 //            data: [28, 48, 40, 19, 86, 27, 90]
 //        }
 //    ]
 //  };



/*	  // Media  Types
	  $scope.event_labels = ['before', 'after'];
	  $scope.series = ['Series A'];

	  $scope.event_data = [
	    [45 , 15]
	  ];*/

		$scope.submit = function() {
				// alert ('comign in submit');

				$scope.fetchHospitalComp();
				$scope.fetchUnitComp();
				$scope.fetchShiftComp();
				$scope.fetchProfComp();
				$scope.fetchEventComp();
				$scope.fetchMediaComp();
			
				// alert ('all hits done');

	      };

	      
	      $scope.selectDateType = function(myVar) {
				 // alert ('comign in selectDateType');
				 $scope.dateType = myVar;

	      };

	  $scope.fetchHospitalComp = function() {

		  	 // $scope.dateType = 'Y';
		  	 // $scope.endDate = '09/26/2015';
		  	// $scope.cusId = '8';

				// alert('unitids:' + $scope.unitIds );
				console.log('enddate:' + $scope.endDate);
				console.log('dateType:' + $scope.dateType);
				console.log('cusId:' + $scope.cusId);
				console.log('unitIds' + $scope.unitIds);

	        bidashboardService.fetchHospitalComp($scope.cusId, $scope.endDate, $scope.dateType)
	                .success(function(data) {
	                    if (data.success && data.success === 1) {

	                    	$scope.hospital_labels = ["Compliance", "Non Compliance"];
	                    	$scope.hospital_series = ["Compliance", "Non Compliance"];
	                    	
	                    	 $scope.hospital_data[0] = data.data.pcchw;
	                    	 $scope.hospital_data[1] = 100 - data.data.pcchw;
	                    	
	                    	 // $scope.hospital_labels = ["Compliance"];
	                    	 // $scope.hospital_series = ["Compliance"];
	                    	
	                    	 // $scope.hospital_data[0] = data.data.pcchw;
	                    	
	                    	
	                    	//  0-69 should be red, 70-89 should be yellow, and 90 –100 should be green. 
	                    	// ["#04C3E3","#23D899","#FCBD54","#FA5077","#F7464A","#DE75D3","#4D5360"]
	                    	
	                    	/*
	                    	if ( data.data.pcchw < 1 ){
	                    		//alert("less than 70 red");
	                    		$scope.hospital_colours = [ "#FA5077" ,  "#FA5077"  ] ; 
	                    	} */
	                    	
	                    	
	                    	if ( data.data.pcchw < 70 ){
	                    		 // alert("less than 70 red fffff");
	                    		$scope.hospital_colours = [ "#FA5077" ,  "#D3D3D3"  ] ;
	                    		// $scope.hospital_colours = [ "#FA5077"   ] ;
	                    	}
	                    	else if ( data.data.pcchw >= 70 && data.data.pcchw < 90){
	                    		//alert("less than 90");
	                    		$scope.hospital_colours = [ "#FCBD54" , "#D3D3D3"   ] ; 
	                    		// $scope.hospital_colours = [ "#FCBD54"    ] ;
	                    		
	                    	}
	                    	else{
	                    		// alert ("top");
	                    		$scope.hospital_colours = [ "#23D899" , "#D3D3D3"   ] ; 
	                    		// $scope.hospital_colours = [ "#23D899"    ] ; 
	                    		
	                    	}
	                    	
	                    }
	                });
	    };


      $scope.fetchUnitComp = function() {
  		  	 // alert('preparting for calling fetchUnitComp');

  		  	//  $scope.dateType = 'Y';
  		  	//  $scope.endDate = '09/26/2015';
  		  	// $scope.unitIds = '';
  		  	// $scope.cusId = '8';

  		  	// alert('dateType: ' +  $scope.dateType) ;
  		  	// alert('end Date: ' +  $scope.endDate) ;

  	        bidashboardService.fetchUnitComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
  	                .success(function(data) {
  	                    if (data.success && data.success === 1) {
  	                    	 // alert('yes scuess');
  	                    	// alert('data.message:' +  data.message );
  	                    	// alert('data.data' +  data.data );
                          //
  	                    	// alert('data.data 0 id' +  data.data[0].id );
  	                    	// alert('data.data 0 name' +  data.data[0].name );
                          //
  	                    	// alert('data.data 1 id' +  data.data[1].id );
  	                    	// alert('data.data 1 name' +  data.data[1].name );

  	                    	// Get the context of the canvas element we want to select
  	                    	// var ctx = document.getElementById("barShift").getContext("2d");
  	                    	// var myChart = new Chart(ctx).PolarArea(data);
  	                    	// myChart.removeData();
  	                    	// myChart.addData([40, 60], "August");


  	                    	// alert ('data lenght' +   data.data.length) ;
  	                    	
  	                    	$scope.unit_labels = [];
  	                    	$scope.unit_series = [];
  	                    	$scope.unit_data = [];
  	                    	
  	                    	
  	                    	for (index = 0; index < data.data.length; index++) {

  	                    	  // $scope.unit_labels = ["January", "February", "March", "April", "May", "June", "July"];
  	                    	  // $scope.unit_series = ['Hospital', 'ICU'];
  	                    		
  	                    		$scope.unit_series[index] = data.data[index].name;
  	                    		
  	                    		// console.log('name:' + data.data[index].name ) ;
  	                    		// console.log('lst lenght' + data.data[index].lst.length );
  	                    		
  	                    		for (i=0; i < data.data[index].lst.length; i++){
  	                    			
  	                    			// console.log( 'index: ' + index  +   'i:' + i + ' name:' + data.data[index].lst[i].name + ' pc:' + data.data[index].lst[i].pcchw ); 
  	                    			$scope.unit_labels[i] = data.data[index].lst[i].name;
  	                    			// console.log(" unit lable set") ;
  	                    			if(!$scope.unit_data[index])
  	                    				$scope.unit_data[index] = [];
  	                    			
  	                    			$scope.unit_data[index][i] = data.data[index].lst[i].pcchw;
  	                    			
  	                    		}
  	                    		
  	                    		// data.data[index].lst.length;
  	                    	    // $scope.unit_data[0][index] = data.data[index].pcchw;
  	                    		 
  	                        } // outer for
  	                    	

  	                    } // if success
  	                    
  	                    
  	                });
  	    };



	    $scope.fetchMediaComp = function() {

		  	//  $scope.dateType = 'Y';
		  	//  $scope.endDate = '09/26/2015';
		  	// $scope.cusId = '8';
				// $scope.unitIds = '';

	        bidashboardService.fetchMediaComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
	                .success(function(data) {
	                	
	                	$scope.media_labels = [];
                    	$scope.media_data = [];
	                    	
	                	
	                    if (data.success && data.success === 1) {

	                    	var totalFinal = 0;

	                    	for (index = 0; index < data.data.length; index++) {


	                    		 totalFinal = totalFinal +  data.data[index].totalw;

	                        }


	                    	for (index = 0; index < data.data.length; index++) {

	                    		$scope.media_labels[index] = data.data[index].name;
	                    		$scope.media_data[index] =  (data.data[index].totalw * 100 ) / totalFinal  ;

	                        }


	                    }
	                });
	    };


	  $scope.fetchShiftComp = function() {
		  	// alert('preparting for calling func');

		  	//  $scope.dateType = 'Y';
		  	//  $scope.endDate = '09/26/2015';
		  	// $scope.unitIds = '';
		  	// $scope.cusId = '8';

		  	// alert('dateType: ' +  $scope.dateType) ;
		  	// alert('end Date: ' +  $scope.endDate) ;

	        bidashboardService.fetchShiftComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
	                .success(function(data) {
	                	
	                	$scope.shift_labels = [];
                    	// $scope.shift_data = [];
	                	
	                    if (data.success && data.success === 1) {
/*	                    	alert('yes scuess');
	                    	alert('data.message:' +  data.message );
	                    	alert('data.data' +  data.data );

	                    	alert('data.data 0 id' +  data.data[0].id );
	                    	alert('data.data 0 name' +  data.data[0].name );

	                    	alert('data.data 1 id' +  data.data[1].id );
	                    	alert('data.data 1 name' +  data.data[1].name );*/

	                    	// Get the context of the canvas element we want to select
	                    	// var ctx = document.getElementById("barShift").getContext("2d");
	                    	// var myChart = new Chart(ctx).PolarArea(data);
	                    	// myChart.removeData();
	                    	// myChart.addData([40, 60], "August");

	                    	console.log("shift progrssing");

	                    	for (index = 0; index < data.data.length; index++) {

	                    		$scope.shift_labels[index] = data.data[index].name;
	                    		
	                    		if (index ==0)
	                    		{
	                    			if(!$scope.shift_data[0])
	                    				$scope.shift_data[0] = [];
	                    		}
	                    		
	                    			
	                    		
	                    		 $scope.shift_data[0][index] = data.data[index].pcchw;

	                        }

	                    	// console.log("shift progrssing EBD");


	                    }
	                });
	    };



		  $scope.fetchProfComp = function() {

			  	//  $scope.dateType = 'Y';
			  	//  $scope.endDate = '09/26/2015';
			  	// $scope.unitIds = '';
			  	// $scope.cusId = '8';

		        bidashboardService.fetchProfComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
		                .success(function(data) {
		                	
		                	// Vertical Chart
		                	
		                	/*$scope.prof_labels = [];
		                	
		                    if (data.success && data.success === 1) {

		                    	for (index = 0; index < data.data.length; index++) {
		                    		$scope.prof_labels[index] = data.data[index].name;
		                    		
		                    		if (index ==0)
		                    		{
		                    			if(!$scope.prof_data[0])
		                    				$scope.prof_data[0] = [];
		                    		}
		                    		
		                    		 $scope.prof_data[0][index] = data.data[index].pcchw;
		                        }

		                    }*/
		                    
		                    /// For Horizontal
		                    
		            		// alert("lables111111" +  barProfHordata.labels[0] );
		            		// alert("Data0:" +  barProfHordata.datasets[0].data[0] );
		                    
		                    if (data.success && data.success === 1) {

		                    	for (index = 0; index < data.data.length; index++) {
		                    		barProfHordata.labels[index] = data.data[index].name;
		                    		
		                    		/*if (index ==0)
		                    		{
		                    			if(!barProfHordata.datasets[0].data[0])
		                    				barProfHordata.datasets[0].data[0] = [];
		                    		}*/
		                    		
		                    		// alert ('value : ' + data.data[index].pcchw ) ;
		                    		barProfHordata.datasets[0].data[index] = data.data[index].pcchw;
		                        }
		                    	
		                    	if(horizontalBarChart!=null){
		                    		horizontalBarChart.destroy();
		                        }
		                    	
		                    	 ctx = document.getElementById("barProfHor").getContext("2d");
		                    	 horizontalBarChart = new Chart(ctx).HorizontalBar(barProfHordata, {
		                    		    barShowStroke: false  ,
		                    		    scaleLabel : "<%= value + ' % '  %>" ,
		                 	      	   scaleOverride: true,
		                 	      	   scaleSteps: 5,
		                 	           scaleStepWidth: Math.ceil(100 / 5),
		                 	           scaleStartValue: 0
		                    	   } );
		                    	
		                    	// horizontalBarChart.update();
		                    	// horizontalBarChart.clear();

		                    }
		                    
		                    
		                    
		                    
		                });
		    };

			  $scope.fetchEventComp = function() {

				  	//  $scope.dateType = 'Y';
				  	//  $scope.endDate = '09/26/2015';
				  	// $scope.unitIds = '';
				  	// $scope.cusId = '8';

			        bidashboardService.fetchEventComp($scope.cusId, $scope.endDate, $scope.dateType, $scope.unitIds)
			                .success(function(data) {
			                	
			                	
			                	// Vertical Chart
			                	
			       /*         	
			                	$scope.event_labels = [];
			                	
			                    if (data.success && data.success === 1) {

			                    	for (index = 0; index < data.data.length; index++) {
			                    		$scope.event_labels[index] = data.data[index].name;
			                    		
			                    		if (index ==0)
			                    		{
			                    			if(!$scope.event_data[0])
			                    				$scope.event_data[0] = [];
			                    		}
			                    		
			                    		
			                    		 $scope.event_data[0][index] = data.data[index].pcchw;
			                        }

			                    }
			                    */
			                    
			                    
			                    // Horizontal Chart
			                    
			                    
			                    if (data.success && data.success === 1) {

			                    	for (index = 0; index < data.data.length; index++) {
			                    		barEventHordata.labels[index] = data.data[index].name;
			                    		
			                    		/*if (index ==0)
			                    		{
			                    			if(!barProfHordata.datasets[0].data[0])
			                    				barProfHordata.datasets[0].data[0] = [];
			                    		}*/
			                    		
			                    		// alert ('value : ' + data.data[index].pcchw ) ;
			                    		barEventHordata.datasets[0].data[index] = data.data[index].pcchw;
			                        }
			                    	
			                    	if(barEventHorChart!=null){
			                    		barEventHorChart.destroy();
			                        }
			                    	
			                    	
			                    	 
			                    	    ctx = document.getElementById("barEventHor").getContext("2d");
						              	barEventHorChart = new Chart(ctx).HorizontalBar(barEventHordata, {
						              		    barShowStroke: true,
						              		  scaleLabel : "<%= value + ' % '  %>" ,
				                 	      	   scaleOverride: true,
				                 	      	   scaleSteps: 5,
				                 	           scaleStepWidth: Math.ceil(100 / 5),
				                 	           scaleStartValue: 0
						              	   } );
						                    

			                    } // End of If data.success
			                    
			                    
			                    
			                    
			                });
			    };


			    $scope.loadUnits = function() {

				  	//  $scope.dateType = 'Y';
				  	//  $scope.endDate = '09/26/2015';
				  	// $scope.unitIds = '';
				  	// $scope.cusId = '8';

			    	 // alert('co,mimg in load unitx func');

			        bidashboardService.loadUnits($scope.cusId)
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
	$scope.loadUnits();
    $scope.submit();


     // alert('before init');
     // $scope.init();
		 // alert('coming1');


});






hyginexApp.service('bidashboardService', function($http) {
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


        fetchUnitComp: function(cusId, toDate, dateType, unitId) {

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
        },

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
                url: '/app/rest/dashboard/mediacompliance/' + cusId
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
