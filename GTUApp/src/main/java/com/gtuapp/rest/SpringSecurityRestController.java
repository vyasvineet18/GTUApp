package com.gtuapp.rest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author vinits
 */
@Controller
public class SpringSecurityRestController {

    
    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String redirectToLogin() {
        return "/jsp/webportal/login.jsp";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/home")
    public View redirectToSuccessLogin_get(HttpServletRequest request) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return new RedirectView(request.getContextPath()+"/jsp/webportal/index.jsp#/home"); // 
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/accessdenied")
    public String redirectToFailureLogin() {
        return "/jsp/webportal/login.jsp?error=true";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/logout")
    public String redirectToLogout() {
        return "/jsp/webportal/logout.jsp";
    }
    
   
}
