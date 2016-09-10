<body class="skin-blue" ng-controller="usertabController">
    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div role="tabpanel" class="nav-tabs-custom">
                            <jsp:include page="../tabsmenu.jsp">
                                <jsp:param name="page" value="user"></jsp:param>
                            </jsp:include>
                            <div class="tab-content"> 
                                <div id="layout" class="tab-pane active">
                                    <div class="boxuserupdate" id="container2">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Users&nbsp;
                                                    <a ng-click="openUserModal()" data-placement="top" data-toggle="modal" data-original-title="Add User" class="btn btn-success btn-sm">
                                                        <i class="fa fa-plus"></i>
                                                    </a>
                                                </h3>
                                            </div>
                                            <div class="dataTables_wrapper form-inline">
                                                    <table class="table table-condensed" style="border-collapse:collapse;">
                                                        <thead>
                                                            <tr>
                                                                <th>UserID </th>
                                                                <th>Name</th>
                                                                <th>Phone</th>
                                                                <th>Email</th>
                                                                <th>Login</th>
                                                                <th>Active</th>
                                                                <th>Role</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-repeat="item in userData">
                                                                <td ng-bind="item.id" width="10%"></td>
                                                                <td ng-bind="item.first + ' ' + item.last"></td>
                                                                <td ng-bind="item.phone"></td>
                                                                <td ng-bind="item.email"></td>
                                                                <td ng-bind="item.login"></td>
                                                                <td>
                                                                    <span ng-if="item.isActive === 'Y'">
                                                                        Yes
                                                                    </span>
                                                                    <span ng-if="item.isActive === 'N'">
                                                                        No
                                                                    </span>
                                                                </td>
                                                                <td ng-bind="item.role.roleName"></td>    
                                                                <td class="text-right button-right">
                                                                    <span ng-click="viewUser(item)" data-toggle="modal">
                                                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-original-title="Update" data-toggle="tooltip" data-placement="top">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                    </span> 
                                                                    <a ng-hide="item.isActive === 'N'" ng-click="updateUser(item)" data-target="#myModal32" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs">
                                                                        <i class="fa fa-edit"></i>
                                                                    </a>
                                                                    <span ng-hide="item.isActive === 'N'" ng-click="deleteUser(item)" data-toggle="modal" data-target="#Deletenotice">
                                                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="dataTables_info" id="example1_info">Showing {{paginationObject.totalRecords == 0 ? 0 : paginationObject.start+1}} to                                  
                                {{paginationObject.totalRecords < paginationObject.start+paginationObject.limit ? paginationObject.totalRecords : paginationObject.start+paginationObject.limit}} 
                                of {{paginationObject.totalRecords}} entries</div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="dataTables_paginate paging_bootstrap" ng-if="isDataLoaded">
                                                        <div pagination on-navigate="fetchThroughPagination()" pagination-object="paginationObject"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Pop Up Start --> 

                                            <!-- Add User Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="useraddupdatemodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newuser.usertitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">User</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal" name="userForm" novalidate>
                                                                        <div class="form-group">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" class="form-control" id="inputPassword3" placeholder="First Name" ng-model="newuser.first" name="first" required>
                                                                                <span style="color:red" ng-show="userForm.first.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.first.$error.required">First Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Last Name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Last Name" id="inputPassword3" class="form-control" ng-model="newuser.last" name="last" required>
                                                                                <span style="color:red" ng-show="userForm.last.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.last.$error.required">Last Name is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Phone</label>
                                                                            <div class="col-sm-9">
                                                                            <input type="text" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;" data-mask="" ng-model="newuser.phone">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="email" placeholder="Email" id="inputPassword3" class="form-control" ng-model="newuser.email" name="email" required email-unique userid="newuser.userid">
                                                                                <span style="color:red" ng-show="userForm.email.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.email.$error.required">Email is required.</span>
                                                                                    <span ng-show="userForm.email.$error.email">Not valid email!</span>
                                                                                    <span ng-show="userForm.email.$error.unique">Email already exists, try with different.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" placeholder="Login" id="inputPassword3" class="form-control" ng-model="newuser.login" name="login" required login-unique userid="newuser.userid">
                                                                                <span style="color:red" ng-show="userForm.login.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.login.$error.required">Login is required.</span>
                                                                                    <span ng-show="userForm.login.$error.unique">Login already exists, try with different.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newuser.isActive">
                                                                                    <option value="Y">Yes</option>
                                                                                    <option value="N">No</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Password</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="password" placeholder="Password" id="inputPassword3" class="form-control" ng-model="newuser.password" name="password" required>
                                                                                <span style="color:red" ng-show="userForm.password.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.password.$error.required">Password is required.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Confirm Password</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="password" placeholder="Confirm Password" id="inputPassword3" class="form-control" ng-model="newuser.confirmpassword" name="confirmpassword" required>
                                                                                <span style="color:red" ng-show="userForm.confirmpassword.$invalid && userForm.userFormSubmitted">
                                                                                    <span ng-show="userForm.confirmpassword.$error.required">Confirm Password is required.</span>
                                                                                    <span ng-show="userForm.confirmpassword.$error.notsame">Password & Confirm Password must be same.</span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">
                                                                                <div class="fa fa-upload"></div>
                                                                                Profile Photo
                                                                            </label>
                                                                            <div class="col-sm-9">
                                                                                <input type="file" id="fileupload" onchange="angular.element(this).scope().uploadedFile(this)" ng-model="newuser.profilePhoto">
                                                                            </div>
                                                                            <!--<img src="" class="profile-pic" id="profile-pic" style="max-width: 100px;max-height: 100px;display: none;" />-->
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Role</label>
                                                                            <div class="col-sm-9">
                                                                                <select class="form-control" ng-model="newuser.role"
                                                                                  ng-options="item.name for item in roleArray track by item.roleId"
                                                                                >
                                                                                      <!--  <option ng-repeat="item in roleArray" value="{{item.roleId}}">{{item.name}}</option>-->
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button" ng-click="submitUser()"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetUserVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Add user Pop Up End --> 
                                            <!-- view User Pop Up Start -->
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="userviewmodal" class="modal fade" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                                            <h4 id="myModalLabel" class="modal-title" ng-bind="newuser.usertitle"></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">User</h3>
                                                                </div>
                                                                <!-- /.box-header --> 
                                                                <!-- form start -->
                                                                <div style="float:none;" class="col-md-12">
                                                                    <form class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.first"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Last Name</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.last"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Phone</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.phone"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.email"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.login"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.isActive"> </div>
                                                                        </div>
                                                                         <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Password</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.password"> </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="inputEmail3" class="col-sm-3 control-label">
                                                                                <div class="fa fa-upload"></div>
                                                                                Profile Photo
                                                                            </label>
                                                                            <div class="col-sm-9">
                                                                                <img style="display:inline-block;width:100px;float:left;height:100px;overflow:hidden;vertical-align:top" src="{{newuser.profilePhoto}}" ng-click="openImgInModal(newuser.profilePhoto)" alt="No Image Found">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-3 control-label" for="inputEmail3">Role</label>
                                                                            <div class="col-sm-9 user-id" ng-bind="newuser.roleid"> </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                                            <button data-dismiss="modal" class="btn btn-danger" type="button" ng-click="resetUserVariables()"><i class="fa fa-close"></i> cancel</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- view User Pop Up End --> 
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
    <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel"><b>Image preview</b></h4>
                </div>
                <div class="modal-body">
                    <img src="" id="imagepreview" style="width: 574px; height: 400px;" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>

