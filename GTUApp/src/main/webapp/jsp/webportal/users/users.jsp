<div class="content-wrapper" ng-controller="userController">
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="tab-pane active" id="user">
                        <div class="boxuserupdate" id="container2">
                            <div>
                                <h3 class="box-title">Users &nbsp;<a data-placement="top" data-toggle="modal" data-target="#myModal31" data-original-title="Add User" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> </a> </h3>
                            </div>
                            <div class="dataTables_wrapper form-inline">
                                <div class="dataTables_wrapper form-inline">
                                    <table class="table table-condensed" style="border-collapse:collapse;">
                                        <thead>
                                            <tr>
                                                <th>ID </th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Login</th>
                                                <th>Active</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>John Kerry</td>
                                                <td>434-335-2319</td>
                                                <td>johnkerry@gmail.com</td>
                                                <td>Null</td>
                                                <td>Yes</td>
                                                <td class="text-right button-right"><span data-toggle="modal" data-target="#Deletenotice"><a data-placement="top" data-toggle="modal" data-original-title="View" data-target="#myModal36" class="btn btn-primary btn-xs" href="javascript:void(0);"><i class="fa fa-eye"></i></a></span> <a data-target="#myModal32" data-toggle="modal" data-original-title="Edit" class="btn btn-success btn-xs"><i class="fa fa-edit"></i></a><span data-toggle="modal" data-target="#Deletenotice"><a href="javascript:void(0);" class="btn btn-danger btn-xs" data-original-title="Delete" data-toggle="tooltip" data-placement="top"><i class="fa fa-trash"></i></a></span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="8" class="hiddenRow"><div class="accordian-body collapse" id="demo6">
                                                        <div class="table inner-table">
                                                            <div class="box box-primary">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Add User &nbsp;<a data-placement="top" data-toggle="modal" data-target="#myModal35" data-original-title="Add User" class="btn btn-success btn-sm"><i class="fa fa-plus"></i></a></h3>
                                                                </div>
                                                                <div class="dataTables_wrapper form-inline">
                                                                    <table class="table table-hover" id="myTable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Id</th>
                                                                                <th>Roll</th>
                                                                                <th>Head Of Unit</th>
                                                                                <th>Active</th>
                                                                                <th>Start Date</th>
                                                                                <th>End Date</th>
                                                                                <th></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>Cancer</td>
                                                                                <td>John Kerry</td>
                                                                                <td>Yes</td>
                                                                                <td>12 April 2015</td>
                                                                                <td>18 April 2015</td>
                                                                                <td class="text-right button-right"><span data-target="#Deletenotice" data-toggle="modal"><a data-placement="top" data-toggle="modal" data-original-title="View" data-target="#myModal36" class="btn btn-primary btn-xs" href="javascript:void(0);"><i class="fa fa-eye"></i></a></span> <a class="btn btn-success btn-xs" data-original-title="Edit" data-toggle="modal" data-target="#myModal36"><i class="fa fa-edit"></i></a><span data-target="#Deletenotice" data-toggle="modal"><a data-placement="top" data-toggle="tooltip" data-original-title="Delete" class="btn btn-danger btn-xs" href="javascript:void(0);"><i class="fa fa-trash"></i></a></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="dataTables_info" id="example1_info">Showing 1 to 1 of 1 entries</div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="dataTables_paginate paging_bootstrap">
                                        <ul class="pagination">
                                            <li class="prev disabled"><a href="#"> Previous</a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li class="next disabled"><a href="#">Next  </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Pop Up Start --> 
                            <!-- Add User Pop Up Start -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal31" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            <h4 id="myModalLabel" class="modal-title">Add Users</h4>
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
                                                            <label class="col-sm-3 control-label" for="inputEmail3">User ID</label>
                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="inputPassword3" placeholder="First Name">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Last Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Last Name" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Phone</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;" data-mask="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Email" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Login" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                            <div class="col-sm-9">
                                                                <select class="form-control">
                                                                    <option>Yes</option>
                                                                    <option>No</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Confirm Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Confirm Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">
                                                                <div class="fa fa-upload"></div>
                                                                Profile Photo
                                                            </label>
                                                            <div class="col-sm-9">
                                                                <input type="file" multiple id="fileupload">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                    <button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Add user Pop Up End --> 
                            <!-- Edit User Pop Up Start -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal32" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            <h4 id="myModalLabel" class="modal-title">Edit Users</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="box box-primary">
                                                <div class="box-header">
                                                    <h3 class="box-title">User Role</h3>
                                                </div>
                                                <!-- /.box-header --> 
                                                <!-- form start -->
                                                <div style="float:none;" class="col-md-12">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">User ID</label>
                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="inputPassword3" placeholder="First Name">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Last Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Last Name" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Phone</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;" data-mask="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Email" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" placeholder="Login" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                            <div class="col-sm-9">
                                                                <select class="form-control">
                                                                    <option>Yes</option>
                                                                    <option>No</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Confirm Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Confirm Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">
                                                                <div class="fa fa-upload"></div>
                                                                Profile Photo
                                                            </label>
                                                            <div class="col-sm-9">
                                                                <input type="file" multiple id="fileupload">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                    <button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Edit wristband Pop Up End -->
                            <!-- View user -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal36" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"></span></button>
                                            <h4 id="myModalLabel" class="modal-title">View User </h4>
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
                                                            <label class="col-sm-3 control-label" for="inputEmail3">User ID</label>
                                                            <div class="col-sm-9 user-id"> 1 </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                            <div class="col-sm-9 user-id">
                                                                John Kerry
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Last Name</label>
                                                            <div class="col-sm-9 user-id">
                                                                Kerry
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Phone</label>
                                                            <div class="col-sm-9 user-id">
                                                                434-335-2319
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                                            <div class="col-sm-9 user-id">
                                                                johnkerry@gmail.com
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Login</label>
                                                            <div class="col-sm-9 user-id">
                                                                Null
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Active</label>
                                                            <div class="col-sm-9 user-id">
                                                                Yes
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label" for="inputEmail3">Confirm Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" placeholder="Confirm Password" id="inputPassword3" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">
                                                                <div class="fa fa-upload"></div>
                                                                Profile Photo
                                                            </label>
                                                            <div class="col-sm-9">
                                                                <input type="file" multiple id="fileupload">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-thumbs-up"></i> Submit</button>
                                                    <button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-close"></i> cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- View user --> 
                            <!-- Pop Up End --> 
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>