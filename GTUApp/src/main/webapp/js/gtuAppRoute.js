/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// for OcLazyLoad refer http://blog.dareboost.com/en/2014/11/angularjs-lazyload-resources/
// https://www.npmjs.com/package/oclazyload
//http://hackedbychinese.github.io/ng-idle/
var gtuApp = angular.module('gtuApp', ['ngRoute','paginationModule','ngIdle']);
gtuApp.config([
				'$routeProvider',
				'IdleProvider',
				function($routeProvider,IdleProvider) {
					$routeProvider
							/*
							 * .when('/dashboard', { templateUrl:
							 * 'bidashboard/bidashboard.jsp', controller:
							 * 'bidashboardController' })
							 */
							.when('/home', {
								templateUrl : 'home/index.jsp'
							})
							.when('/colleges/all', {
								templateUrl : 'colleges/all.jsp'
							})
							.when('/reports', {
								templateUrl : 'bidashboard/bidashboard.jsp',
								controller : 'bidashboardController'
							})
							.when('/dispenser', {
								templateUrl : 'dispenser/dispenser.jsp'
							})
							.when('/tracker', {
								templateUrl : 'tracker/tracker.jsp'
							})
							.when('/users', {
								templateUrl : 'users/users.jsp'
							})
							.when('/lookup', {
								templateUrl : 'lookup/lookup.jsp'
							})
							.when('/lookupitem', {
								templateUrl : 'lookupitem/lookupitem.jsp'
							})
							.when(
									'/beaconMaintenance',
									{
										templateUrl : 'beaconMaintenance/mapBeaconState.jsp'
									})
							.when(
									'/hospitaldetail/:customerid/general',
									{
										templateUrl : function(params) {
											return 'customer/tabs/general/hospitaldetail.jsp?customerid='
													+ params.customerid;
										},
										controller : 'hospitaldetailController'
									})
							.when(
									'/hospitaldetail/:customerid/policies',
									{
										templateUrl : function(params) {
											return 'customer/tabs/policies/policies.jsp?customerid='
													+ params.customerid;
										},
										controller : 'policytabController'
									})
							.when(
									'/hospitaldetail/:customerid/layout',
									{
										templateUrl : function(params) {
											return 'customer/tabs/layout/layouttab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'layouttabController'
									})
							.when(
									'/hospitaldetail/:customerid/beacon',
									{
										templateUrl : function(params) {
											return 'customer/tabs/beacon/beacontab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'beacontabController'
									})
							.when(
									'/hospitaldetail/:customerid/dispenser',
									{
										templateUrl : function(params) {
											return 'customer/tabs/dispenser/dispensertab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'dispensertabController'
									})
							.when(
									'/hospitaldetail/:customerid/wristband',
									{
										templateUrl : function(params) {
											return 'customer/tabs/wristband/wristbandtab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'wristbandtabController'
									})
							.when(
									'/hospitaldetail/:customerid/user',
									{
										templateUrl : function(params) {
											return 'customer/tabs/user/usertab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'usertabController'
									})
							.when(
									'/hospitaldetail/:customerid/gateway',
									{
										templateUrl : function(params) {
											return 'customer/tabs/gateway/gatewaytab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'gatewaytabController'
									})
							.when(
									'/hospitaldetail/:customerid/dashboard',
									{
										templateUrl : function(params) {
											return 'customer/tabs/dashboard/bidashboard.jsp?customerid='
													+ params.customerid
													+ '&plan=' + params.plan;
										},
										controller : 'dashboardtabcontroller'
									})
							.when(
									'/hospitaldetail/:customerid/dashboardLevel1',
									{
										templateUrl : function(params) {
											return 'customer/tabs/dashboardLevel1/dashboardLevel1.jsp?customerid='
													+ params.customerid
													+ '&plan=' + params.plan;
										},
										controller : 'dashboardtabcontrollerLevel1'
									})
							.when(
									'/hospitaldetail/:customerid/dashboardLevel3',
									{
										templateUrl : function(params) {
											return 'customer/tabs/dashboardLevel3/dashboardLevel3.jsp?customerid='
													+ params.customerid
													+ '&plan=' + params.plan;
										},
										controller : 'dashboardtabcontrollerLevel1'
									})
							.when(
									'/hospitaldetail/:customerid/security',
									{
										templateUrl : function(params) {
											return 'customer/tabs/security/securitytab.jsp?customerid='
													+ params.customerid;
										},
										controller : 'securitytabController'
									}).when('/error404', {
								templateUrl : '500.jsp'
							}).otherwise({
								redirectTo : '/error404'
							});

					IdleProvider.idle(1800);//30 mins 1800
					//Keep this time in sync with web.xml session timeout
				} ]);

gtuApp.run(function($rootScope, $templateCache, $location, Idle) {
	$rootScope.$on('$routeChangeStart', function(event, next, current) {
		if (typeof (current) !== 'undefined') {
			$templateCache.remove(current.templateUrl);
		}
	});

	$rootScope.$on('IdleStart', function() {		
		window.location.href = "/app/login";
	});

	Idle.watch();
});

// gtuApp.run(function($rootScope) {
// $rootScope.$on('$routeChangeSuccess', function() {
//      
// });
// });

