/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
hyginexApp
		.controller(
				'hospitaldetailController',
				function($scope, hospitaldetailService, $routeParams, $window) {

					// contact related scope variables
					$scope.newcontact = {
						'contacttitle' : 'Add Contact',
						'contactid' : '0',
						'name' : '',
						'email' : '',
						'type' : '',
						'fax' : '',
						'phone' : '',
						'landline' : '',
						'buildingnumber' : '',
						'addressId' : 0,
						'streetName' : '',
						'zipcode' : '',
						'city' : '',
						'state' : '',
						'country' : ''
					};
					$scope.customerData = {
						'id' : '',
						'name' : '',
						'plan' : '',
						'timezone' : '',
						'rubthreshold':0,
						'washOpportunity' : 0
					};
					$scope.isDataLoaded = false;
					$scope.paginationObject = {
						'start' : 0,
						'limit' : 5,
						'currentPage' : 1,
						'totalRecords' : 0
					};
					// $scope.token='ba7d1e60-b106-2a11-a37f-b545a5c78af5';
					// $scope.token='faf81412-4840-df65-d874-59cffae5ef4a';
					$scope.disableAddressInfoSubmit = true;

					$scope.fetchAllContactsByCustId = function() {
						if ($routeParams.customerid !== '0') {
							hospitaldetailService
									.fetchAllContactsByCustId(
											$routeParams.customerid,
											$scope.paginationObject.start,
											$scope.paginationObject.limit)
									.success(
											function(data) {
												console.log(JSON
														.stringify(data));
												if (data.success
														&& data.success === 1) {
													$scope.contactData = data.data;
												}
											});
						}
					};

					$scope.fetchAllContactCountsByCustId = function() {
						hospitaldetailService
								.fetchAllContactCountsByCustId(
										$routeParams.customerid)
								.success(
										function(data) {
											$scope.paginationObject.totalRecords = data.totalRecords;
											$scope.isDataLoaded = true;
										});
					};

					$scope.fetchAllCustomerDemographicsByCustId = function() {
						hospitaldetailService
								.fetchCustomerDemographicsByCustId(
										$routeParams.customerid)
								.success(
										function(data) {
											if (data.success
													&& data.success === 1) {
												console.log("Check here : "+JSON
														.stringify(data));
												if(data.data==null) {
													$scope.customerData = {
															'id' : '',
															'name' : '',
															'plan' : '',
															'timezone' : '',
															'rubthreshold':0,
															'washOpportunity' : 0
														};
												}
												else
													$scope.customerData = data.data;
												if ($scope.customerData.address == null
														|| $scope.customerData.address == '') {
													$scope.customerData.address = {
														'addressId' : '',
														'streetName' : '',
														'buildingNumber' : '',
														'city' : '',
														'state' : '',
														'zipcode' : '',
														'country' : '',
														'fullAddress' : ''
													};
												}
												
												$scope.showAddress = true;
												console
														.log(JSON
																.stringify($scope.customerData));
											}
										});
					};

					$scope.loadAll = function() {

						if ($routeParams.customerid === '0') {
							$scope.disableAddressInfoSubmit = true;
						}
						if (get("SMARTYSTREETAUTHID") === ''
								|| get("SMARTYSTREETAUTHID") === undefined
								|| get("SMARTYSTREETAUTHID") === null) {
							hospitaldetailService.getConfigurationvalue(
									'smartystreetauthid').success(
									function(data) {
										console.log(data.data);
										put("SMARTYSTREETAUTHID", data.data);
										console.log("smartstreetID "
												+ get("SMARTYSTREETAUTHID"));
									}).error(function() {

							});
						}
						console.log(get("SMARTYSTREETAUTHID"));
						$scope.token = get("SMARTYSTREETAUTHID");
					
						$scope.prepareLookupArray();
						$scope.fetchAllContactsByCustId();
						$scope.fetchAllContactCountsByCustId();
						$scope.fetchAllCustomerDemographicsByCustId();
						console.log($scope.customerData);
					};

					$scope.prepareLookupArray = function() {
						$scope.contacttypeArray = getLookUpItemsFromLookupName('CONTACT TYPE');
						console.log($scope.contacttypeArray);
						$scope.timezoneArray = getLookUpItemsFromLookupName('TIMEZONE');
						console.log($scope.timezoneArray);
						$scope.newcontact.type = $scope.contacttypeArray[0].id;
						$scope.customerData.timezone = $scope.timezoneArray[0].id;
						$scope.planArray = getLookUpItemsFromLookupName('PLAN');
						console.log($scope.planArray);
						$scope.customerData.plan = $scope.planArray[0].id;
					};

					$scope.loadAll();

					$scope.fetchThroughPagination = function() {
						$scope.isDataLoaded = false;
						$scope.isDataLoaded = true;
						$scope.fetchAllContactsByCustId();
					};

					$scope.clearGeneralInfo = function() {
						$scope.customerData.name = '';
						$scope.customerData.plan = $scope.planArray[0].name;
						$scope.customerData.timezone = $scope.timezoneArray[0].name;
					};

					$scope.clearAddressInfo = function() {

					};

					$scope.updateGeneralInfo = function() {
						if ($scope.generalinfoform.$valid) {
							hospitaldetailService
									.updateGeneralInfo($routeParams.customerid,
											$scope.customerData.name,
											$scope.customerData.plan,
											$scope.customerData.timezone,
											$scope.customerData.rubthreshold,
											$scope.customerData.washOpportunity)
									.success(
											function(data) {
												if (data.success
														&& data.success === 1) {
													$scope.generalinfoform.generalinfoFormSubmitted = false;
													if ($routeParams.customerid === '0') {
														hyginexAlert('Customer General Information Added successfully');
														$window.location = '#/admin-hospital';
													} else {
														hyginexAlert('Information updated successfully');
													}
												}
											});
						} else {
							$scope.generalinfoform.generalinfoFormSubmitted = true;
						}
					};

					$scope.updateAddressInfo = function() {
						hospitaldetailService
								.updateAddressInfo(
										$routeParams.customerid,
										$scope.customerData.address.addressId,
										$scope.customerData.address.buildingNumber,
										$scope.customerData.address.streetName,
										$scope.customerData.address.zipcode,
										$scope.customerData.address.city,
										$scope.customerData.address.state,
										$scope.customerData.address.country,
										$scope.customerData.address.fullAddress)
								.success(
										function(data) {
											if (data.success
													&& data.success === 1) {
												if ($routeParams.customerid === '0') {
													hyginexAlert('Customer Address Information Added successfully');
												} else {
													hyginexAlert('Information updated successfully');
												}
											}
										});
					};

					$scope.validateAddress = function(addressresponse) {
						// http://jsfiddle.net/j2K7N/4/
						console.log(JSON.stringify(addressresponse));
						if (addressresponse.error) {
							// invalid address
							$scope.invalidAddress = true;
							$scope.disableAddressInfoSubmit = true;
						} else {
							$scope.invalidAddress = false;
							$scope.disableAddressInfoSubmit = false;
							if (addressresponse.components) {
								$scope.customerData.address.buildingNumber = addressresponse.components.primary_number;
								$scope.customerData.address.streetName = addressresponse.components.street_name
										+ " "
										+ addressresponse.components.street_suffix;
								if (addressresponse.components.plus4_code) {
									$scope.customerData.address.zipcode = addressresponse.components.zipcode
											+ "-"
											+ addressresponse.components.plus4_code;
								} else {
									$scope.customerData.address.zipcode = addressresponse.components.zipcode;
								}
								$scope.customerData.address.city = addressresponse.components.city_name;
								$scope.customerData.address.state = addressresponse.components.state_abbreviation;
								$scope.customerData.address.country = 'US';
								$scope.customerData.address.fullAddress = addressresponse.delivery_line_1
										+ ' ' + addressresponse.last_line;
							}
						}
					};

					// ------------------------------- Contact MODAL Functions
					// START -----------------------------
					$scope.openContactModal = function() {
						$("#addupdatecontactmodal").modal('show');
					};

					$scope.submitContact = function() {
						hospitaldetailService
								.updateContact($routeParams.customerid,
										$scope.newcontact.contactid,
										$scope.newcontact.name,
										$scope.newcontact.email,
										$scope.newcontact.type,
										$scope.newcontact.fax,
										$scope.newcontact.phone,
										$scope.newcontact.landline,
										$scope.newcontact.addressId,
										$scope.newcontact.buildingnumber,
										$scope.newcontact.streetName,
										$scope.newcontact.zipcode,
										$scope.newcontact.city,
										$scope.newcontact.state,
										$scope.newcontact.country)
								.success(
										function(data) {
											$scope.resetContactVariables();
											hospitaldetailService
													.fetchAllContactsByCustId(
															$routeParams.customerid,
															$scope.paginationObject.start,
															$scope.paginationObject.limit)
													.success(
															function(data) {
																$scope.contactData = data.data;
																$(
																		"#addupdatecontactmodal")
																		.modal(
																				'hide');
															});
										});
					};

					$scope.updateContact = function(item) {
						$scope.newcontact.contacttitle = 'Edit Contact';
						$scope.newcontact.contactid = item.contactid;
						$scope.newcontact.name = item.contactname;
						$scope.newcontact.email = item.email;
						$scope.newcontact.type = item.departmentId;
						$scope.newcontact.fax = item.fax;
						$scope.newcontact.phone = item.phoneNumber;
						$scope.newcontact.landline = item.alternatePhoneNumber;
						$scope.newcontact.addressId = item.addressId;
						$scope.newcontact.buildingnumber = item.buildingNumber;
						$scope.newcontact.streetName = item.streetName;
						$scope.newcontact.zipcode = item.zipcode;
						$scope.newcontact.city = item.city;
						$scope.newcontact.state = item.state;
						$scope.newcontact.country = item.country;
						$("#addupdatecontactmodal").modal('show');
					};

					$scope.viewContactModal = function(item) {
						$scope.newcontact.name = item.contactname;
						$scope.newcontact.email = item.email;
						$scope.newcontact.type = item.department;
						$scope.newcontact.fax = item.fax;
						$scope.newcontact.phone = item.phoneNumber;
						$scope.newcontact.landline = item.alternatePhoneNumber;
						$scope.newcontact.addressId = item.addressId;
						$scope.newcontact.buildingnumber = item.buildingNumber;
						$scope.newcontact.streetName = item.streetName;
						$scope.newcontact.zipcode = item.zipcode;
						$scope.newcontact.city = item.city;
						$scope.newcontact.state = item.state;
						$scope.newcontact.country = item.country;
						$("#contactviewmodal").modal('show');
					};

					$scope.resetContactVariables = function() {
						$scope.newcontact = {
							'contacttitle' : 'Add Contact',
							'contactid' : '0',
							'name' : '',
							'email' : '',
							'type' : '',
							'fax' : '',
							'phone' : '',
							landline : '',
							addressId : 0,
							buildingnumber : '',
							streetName : '',
							zipcode : '',
							city : '',
							state : '',
							country : ''
						};
						$scope.newcontact.type = $scope.contacttypeArray[0].id;
					};

					$scope.validateContactAddress = function(addressresponse) {
						// http://jsfiddle.net/j2K7N/4/
						console.log(JSON.stringify(addressresponse));
						if (addressresponse.error) {
							// invalid address
							$scope.invalidContactAddress = true;
						} else {
							$scope.invalidContactAddress = false;
							if (addressresponse.components) {
								$scope.newcontact.buildingNumber = addressresponse.components.primary_number;
								$scope.newcontact.streetName = addressresponse.components.street_name
										+ " "
										+ addressresponse.components.street_suffix;
								if (addressresponse.components.plus4_code) {
									$scope.newcontact.zipcode = addressresponse.components.zipcode
											+ "-"
											+ addressresponse.components.plus4_code;
								} else {
									$scope.newcontact.zipcode = addressresponse.components.zipcode;
								}
								$scope.newcontact.city = addressresponse.components.city_name;
								$scope.newcontact.state = addressresponse.components.state_abbreviation;
								$scope.newcontact.country = 'US';
							}
						}
					};

					$scope.deleteContact = function(item) {
						hyginexConfirm(
								'Delete Contact',
								'Are you sure to want to delete contact : '
										+ item.contactname + ' ? ',
								function() {
									hospitaldetailService
											.deleteContact(item.contactid,
													$routeParams.customerid)
											.success(
													function(data) {
														if (data.success
																&& data.success === 1) {
															$scope
																	.fetchAllContactsByCustId();
														} else {
															hyginexAlert('Error in contact deletion, try again');
														}
													})
											.error(
													function() {
														hyginexAlert('Error in contact deletion, try again');
													});
								}, function() {
								});
					};
				});

hyginexApp.service('hospitaldetailService', function($http) {
	return {
		fetchAllContactsByCustId : function(customerid, start, limit) {
			return $http({
				method : 'GET',
				url : '/app/rest/contact/customerid/' + customerid
						+ '/fetchcontacts/' + start + '/' + limit
			});
		},
		fetchAllContactCountsByCustId : function(customerid) {
			return $http({
				method : 'GET',
				url : '/app/rest/contact/customerid/' + customerid
						+ '/fetchallcount'
			});
		},
		fetchCustomerDemographicsByCustId : function(customerid) {
			return $http({
				method : 'GET',
				url : '/app/rest/customer/customerid/' + customerid
						+ '/fetchcustomerdemographics'
			});
		},
		updateGeneralInfo : function(customerid, name, plan, timezone,rubthreshold,
				washOpportunity) {
			return $http({
				method : 'POST',
				url : '/app/rest/customer/addupdatecustomer',
				data : {
					id : customerid,
					name : name,
					plan : plan,
					timezone : timezone,
					rubthreshold : rubthreshold,
					washOpportunity : washOpportunity
				},
				headers : {
					'Content-Type' : 'application/json'
				}
			});
		},
		updateAddressInfo : function(customerid, addressId, buildingNumber,
				streetName, zipcode, city, state, country, fullAddress) {
			return $http({
				method : 'POST',
				url : '/app/rest/address/addUpdateAddress',
				data : {
					customerId : customerid,
					addressId : addressId,
					buildingNumber : buildingNumber,
					streetName : streetName,
					zipcode : zipcode,
					city : city,
					state : state,
					country : country,
					fullAddress : fullAddress
				},
				headers : {
					'Content-Type' : 'application/json'
				}
			});
		},
		updateContact : function(customerid, contactid, contactname, email,
				departmentId, fax, phoneNumber, alternatePhoneNumber,
				addressId, buildingNumber, streetName, zipcode, city, state,
				country) {
			return $http({
				method : 'POST',
				url : '/app/rest/contact/customerid/' + customerid
						+ '/addupdatecontact',
				data : {
					customerid : customerid,
					contactid : contactid,
					contactname : contactname,
					email : email,
					departmentId : departmentId,
					fax : fax,
					phoneNumber : phoneNumber,
					alternatePhoneNumber : alternatePhoneNumber,
					addressId : addressId,
					buildingNumber : buildingNumber,
					streetName : streetName,
					zipcode : zipcode,
					city : city,
					state : state,
					country : country
				},
				headers : {
					'Content-Type' : 'application/json'
				}
			});
		},
		checkUniqueCustomer : function(customername) {
			return $http({
				method : 'GET',
				url : '/app/rest/customer/customername/' + customername
						+ '/checkcustomername'
			});
		},
		deleteContact : function(contactid, customerid) {
			return $http({
				method : 'POST',
				url : '/app/rest/contact/contactid/' + contactid
						+ '/customerid/' + customerid + '/deletecontact',
				headers : {
					'Content-Type' : 'application/json'
				}
			});
		},
		getConfigurationvalue : function(key) {
			return $http({
				method : 'GET',
				url : '/app/rest/configuration/' + key
			});
		}
	};
});

hyginexApp.directive('hospitalnameUnique', [
		'hospitaldetailService',
		function(hospitaldetailService) {
			return {
				restrict : 'A',
				require : 'ngModel',
				link : function(scope, element, attrs, ngModel) {
					element.bind('blur', function(e) {
						if (!ngModel || !element.val())
							return;
						var currentValue = element.val();
						hospitaldetailService.checkUniqueCustomer(currentValue)
								.then(
										function(unique) {
											if (currentValue == element.val()) {
												ngModel.$setValidity('unique',
														unique.data.data);
											}
										},
										function() {
											ngModel
													.$setValidity('unique',
															true);
										});
					});
				}
			};
		} ]);