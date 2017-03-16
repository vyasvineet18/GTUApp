<%@page import="com.hyginex.utilities.HyginexUtils"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page import="com.g.utilities.Hyginexconstants"%>
<%
    String link = request.getParameter("page");
    String customerid = request.getParameter("customerid");
    /*
    	Plan added in session so that dashboard can be shown according to plan choosed
    */
    String plan=request.getParameter("plan");    
    if(plan!=null && !plan.equals("undefined")) {
    	HyginexUtils.setCurrentCustomerPlan(request, plan);
    }
    else {
    	if(HyginexUtils.getCurrentCustomerPlan(request)!=null)
    		plan=HyginexUtils.getCurrentCustomerPlan(request);
    	else
    		plan="New Customer";
    }
    
    String dashboardLink;
    if (plan.equals("Level I")) 
    	dashboardLink="#hospitaldetail/"+customerid+"/dashboardLevel1";
    else if(plan.equals("Level II"))
    	dashboardLink="#hospitaldetail/"+customerid+"/dashboard";
    else
    	dashboardLink="#hospitaldetail/"+customerid+"/dashboardLevel3";
%>
<style>
    .disabledTab{
        pointer-events: none;
    }
</style>

<ul class="nav nav-tabs" role="tablist" >
    <!--<li role="presentation" class="active"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Summary</a></li>-->
     <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).DASHBOARD_MENU)">
        <li id="dashboardtab" role="presentation" class="<%=(link.equals("dashboard") ? "active" : "")%>">
   		<a href="<%=dashboardLink %>">     
        <!--  <a href=<%=plan.equals("Level I") ? "#hospitaldetail/"+customerid+"/dashboardLevel1" : "#hospitaldetail/"+customerid+"/dashboard"%> >
-->        Dashboard</a>
        </li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).GENERAL_TAB)">
        <li  role="presentation" class="<%=(link.equals("general") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/general" >General</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).POLICIES_TAB)">
        <li role="presentation" class="<%=(link.equals("policies") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/policies" >Policies</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).LAYOUT_TAB)">
        <li role="presentation" class="<%=(link.equals("layout") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/layout" >Layout</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).BEACON_TAB)">
        <li role="presentation" class="<%=(link.equals("beacon") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/beacon" >Beacon</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).DISPENSER_TAB)">
        <li role="presentation" class="<%=(link.equals("dispenser") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/dispenser" >Dispenser</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).WRISTBAND_TAB)">
        <li role="presentation" class="<%=(link.equals("wristband") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/wristband" >Wristband</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).GATEWAY_TAB)">
        <li  role="presentation" class="<%=(link.equals("gateway") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/gateway">Gateway</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).USERS_TAB)">
        <li role="presentation" class="<%=(link.equals("user") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/user">User</a></li>
    </security:authorize>
    <security:authorize access="hasRole(T(com.hyginex.utilities.Hyginexconstants).SECURITY_TAB)">
    	<li role="presentation" class="<%=(link.equals("security") ? "active" : "")%>"><a href="#hospitaldetail/<%=customerid%>/security">Security</a></li>
    	</security:authorize>
   
</ul>

<script>
    var customerid = "<%=customerid%>";
    if(customerid == 0){
        $("ul.nav li").removeClass('active').addClass('disabledTab');
        $("#dashboardtab").addClass('active');
    }
</script>