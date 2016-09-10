<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!-- loading common styles and scripts -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Hyginex</title>
<link href="${pageContext.request.contextPath}/images/favicon.gif"
	rel="shortcut icon">

 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <%@include file="/jsp/webportal/common/loadstyle.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini" ng-app="gtuApp">
	<div class="wrapper">
		
		<%@include file="/jsp/webportal/common/loadscripts.jsp"%>

		<!-- Top Header -->
		<%@include file="/jsp/webportal/common/header.jsp"%>
		<%@include file="/jsp/webportal/common/leftSideBar.jsp"%>
		

			
			<decorator:body />
			<div ng-view="" class="content-wrapper"></div>
			
		
		<%@include file="/jsp/webportal/common/footer.jsp"%>
		<%@include file="/jsp/webportal/common/rightSideBar.jsp"%>
	</div>
</body>
</html>