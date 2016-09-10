<!DOCTYPE html>
<%
    String activationkey = request.getParameter("key");

%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Hyginex</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="${pageContext.request.contextPath}/jsp/webportal/template/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/jsp/webportal/template/dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/jsp/webportal/template/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/jsp/webportal/template/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="login-page" ng-app="passwordApp">
        <div class="login-box" ng-controller="passwordCtrl">
            <div class="login-logo">
                <img src="${pageContext.request.contextPath}/jsp/webportal/template/images/logo.gif" alt="">
            </div><!-- /.login-logo -->

            <div class="login-box-body">
                <div ng-show="!passwordupdatesuccess">
                    <div ng-bind="errormsg" style="color: red"></div>
                    <p class="login-box-msg" style="text-align: left;font-size: 16px;padding-left: 0px"><strong>Change your password</strong></p>
                    <form method="post" ng-submit="changePassword()">
                        <div class="form-group has-feedback">
                            <input type="password" ng-model="password" class="form-control" placeholder="Password"/>
                        </div>
                        <div class="form-group has-feedback">
                            Must contain one lowercase letter, one number, and be at least 7 characters long
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" ng-model="confirmpassword" class="form-control" placeholder="Confirm password"/>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Change password</button>
                            </div><!-- /.col -->
                        </div>
                    </form>
                </div>
                <div ng-show="passwordupdatesuccess">
                    <p class="login-box-msg" style="text-align: left;font-size: 16px;padding-left: 0px"><strong>Password updated successfully</strong></p>
                    <a href="${pageContext.request.contextPath}/jsp/webportal/login.jsp" class="btn" style="padding-left: 0px">
                        Return to sign in
                        <span class="octicon octicon-arrow-right"></span>
                    </a>
                </div>
            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.4/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/jsp/webportal/passwordcontroller.js"></script>
        <script src="${pageContext.request.contextPath}/jsp/webportal/template/plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/jsp/webportal/template/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/jsp/webportal/template/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <script>
                    $(function() {
                        $('input').iCheck({
                            checkboxClass: 'icheckbox_square-blue',
                            radioClass: 'iradio_square-blue',
                            increaseArea: '20%' // optional
                        });
                    });
                    var activationkey = "<%=activationkey%>";
        </script>
    </body>
</html>